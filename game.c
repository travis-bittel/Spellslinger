#include "myLib.h"
#include "game.h"
#include <stdlib.h>
#include "spritesheet.h"

extern void goToLose();
extern void goToWin();
extern void goToInstructions();
extern void goToNewSpell(int spell);
extern void goToNewEnemy(int enemy);

enum
{
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
extern int state;

ANISPRITE player;

Encounter encounters[NUMBER_OF_ENCOUNTERS];

Walker walkers[MAX_WALKERS];

Shooter shooters[MAX_SHOOTERS];

Wraith wraiths[MAX_WRAITHS];

PlayerBolt playerBolts[MAX_PLAYER_BOLTS];

ShooterProjectile shooterProjectiles[MAX_SHOOTER_PROJECTILES];

enum {ENEMYSTATE_INACTIVE, ENEMYSTATE_MOVING, ENEMYSTATE_ATTACKING, ENEMYSTATE_IDLE};

enum {ENCOUNTER_NOT_STARTED, ENCOUNTER_ACTIVE, ENCOUNTER_COMPLETE};

int currentEncounter = 0; // The index of the encounter the player is currently in

int shadowOAMIndex = 0; // Used to keep track of where we are in the shadowOAM. Updated in the draw functions

extern int cheatEnabled;

int hOff = 0;
int vOff = 95;

int currentPlayerHealth = PLAYER_MAX_HEALTH;
int currentPlayerMana = PLAYER_MAX_MANA;
int playerManaStep = 0; // Used to regen mana at a rate of <1 per tick
int playerManaDrainStep = 0;

int playerFacingDirection = 1; // -1 = Left, 1 = Right

enum {BOLT, SHIELD, LEVITATE};
int spellsUnlocked;

int durationShielded = 0; // Ticks up as player holds down Shield button, increasing Mana cost
int recentlyShieldedAttackTicks = 0;

int globalCooldown = 0; // Prevents all spellcasts while >0
int boltCooldown = 0;
int shieldCooldown = 0;

int levitateManaConsumptionStep = 0;
int levitateHeightStep = 0;

int playerMovementStep = 0;

int currentSBB = 15;
void startEncounter() {
    player.worldCol = encounters[currentEncounter].startCol + 1;
    hOff = encounters[currentEncounter].startCol;

    currentSBB++;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(currentSBB) | BG_4BPP | BG_SIZE_SMALL;

    if (currentPlayerHealth < PLAYER_MAX_HEALTH - 1) {
        currentPlayerHealth++;
    }
    currentPlayerMana = PLAYER_MAX_MANA;

    // Spawn Monsters
    for (int i = 0; i < encounters[currentEncounter].numStartingEnemies; i++) {
        EnemySpawn spawn = encounters[currentEncounter].startingEnemies[i];
        spawnEnemy(spawn.type, spawn.spawnCol);
    }

    // Show Instructions
    if (currentEncounter == 0) { // Bolt
        goToNewSpell(0);
        spellsUnlocked = 0;
    }
    if (currentEncounter == 1) { // Walker
        goToNewEnemy(0);
    }
    if (currentEncounter == 2) { // Shield
        goToNewSpell(1);
        spellsUnlocked = 1;
    }
    if (currentEncounter == 3) { // Turret
        goToNewEnemy(1);
    }
    if (currentEncounter == 6) { // Wraith
        goToNewEnemy(2);
    }
    if (currentEncounter == 7) { // Levitate
        goToNewSpell(2);
        spellsUnlocked = 2;
    }
}

void damagePlayer(int amount, int pierceShield) {
    if (!pierceShield && durationShielded > 0) {
        recentlyShieldedAttackTicks = 30;

        currentPlayerMana += SHIELD_MANA_REFUND;
        if (currentPlayerMana > PLAYER_MAX_MANA) {
            currentPlayerMana = PLAYER_MAX_MANA;
        }
        return;
    }
    currentPlayerHealth -= amount;
    if (currentPlayerHealth <= 0) {
        goToLose();
    }
}

// #region Condition Functions
int playerIsWithinRange(int col, int width, int range) {
    // Within range
    if (collision(col - range, player.worldRow, width + (2 * range), 10, player.worldCol, player.worldRow, player.width, player.height)) {
        return 0;
    }
    if (col - player.worldCol > 0) { // To the left
        return -1;
    } else { // To the right
        return 1;
    }
}

int playerIsAtSameElevation(int row, int range) {
    if (abs(player.worldRow - row) <= range) {
        return 0; // At same elevation
    }
    if (player.worldRow - row > 0) {
        return 1; // Player is above
    } else {
        return -1; // Player is below
    }
}

int currentEncounterIsCleared() {
    // Walkers
    for (int i = 0; i < MAX_WALKERS; i++) {
        if (!walkers[i].state == ENEMYSTATE_INACTIVE) {
            return 0;
        }
    }
    return 1;
}
// #endregion

// #region Spawning Functions
void spawnPlayerBolt() {
    for (int i = 0; i < MAX_PLAYER_BOLTS; i++) {
        if (!playerBolts[i].active) {
            playerBolts[i].active = 1;
            playerBolts[i].colStep = 0;
            playerBolts[i].worldRow = player.worldRow + 14;
            playerBolts[i].direction = playerFacingDirection;
            if (playerFacingDirection == -1) {
                playerBolts[i].worldCol = player.worldCol - playerBolts[i].width;
            } else {
                playerBolts[i].worldCol = player.worldCol + player.width;
            }
            break;
        }
    }
}

void spawnShooterProjectile(int col, int row, int direction, int height, int width) {
    for (int i = 0; i < MAX_SHOOTER_PROJECTILES; i++) {
        if (!shooterProjectiles[i].active) {
            shooterProjectiles[i].active = 1;
            shooterProjectiles[i].colStep = 0;
            shooterProjectiles[i].worldRow = row + height / 2;
            shooterProjectiles[i].direction = direction;
            if (direction == -1) {
                shooterProjectiles[i].worldCol = col;
            } else {
                shooterProjectiles[i].worldCol = col + width;
            }
            break;
        }
    }
}

void spawnEnemy(int type, int col) {
    switch (type) {
        case WALKER:
            for (int i = 0; i < MAX_WALKERS; i++) {
                if (walkers[i].state == ENEMYSTATE_INACTIVE) {
                    walkers[i].state = ENEMYSTATE_MOVING;
                    walkers[i].health = WALKER_MAX_HEALTH;
                    walkers[i].worldCol = encounters[currentEncounter].startCol + col;
                    walkers[i].attackStep = 0;
                    walkers[i].colStep = 0;
                    walkers[i].hide = 0;
                    break;
                }
            }
            break;
        case SHOOTER:
            for (int i = 0; i < MAX_SHOOTERS; i++) {
                if (shooters[i].state == ENEMYSTATE_INACTIVE) {
                    shooters[i].state = ENEMYSTATE_IDLE;
                    shooters[i].health = SHOOTER_MAX_HEALTH;
                    shooters[i].worldCol = encounters[currentEncounter].startCol + col;
                    shooters[i].attackStep = rand() % SHOOTER_ATTACK_COOLDOWN - 10;
                    shooters[i].hide = 0;
                    shooters[i].facingDirection = 1;
                    break;
                }
            }
            break;
        case WRAITH:
            for (int i = 0; i < MAX_WRAITHS; i++) {
                if (wraiths[i].state == ENEMYSTATE_INACTIVE) {
                    wraiths[i].state = ENEMYSTATE_IDLE;
                    wraiths[i].health = WRAITH_MAX_HEALTH;
                    wraiths[i].worldCol = encounters[currentEncounter].startCol + col;
                    wraiths[i].attackStep = rand() % WRAITH_ATTACK_COOLDOWN - 10;
                    wraiths[i].hide = 0;
                    wraiths[i].facingDirection = 1;
                    break;
                }
            }
            break;
    }
}
// #endregion

//#region Init Functions
void initGame() {
    initEnemies();
    initProjectiles();

    // #region Encounters
    encounters[0].startCol = 0;
    encounters[0].state = ENCOUNTER_COMPLETE;
    encounters[0].numStartingEnemies = 0;

    encounters[1].startCol = SCREENWIDTH;
    encounters[1].state = 1;
    encounters[1].startingEnemies[0].spawnCol = 120;
    encounters[1].startingEnemies[0].type = WALKER;
    encounters[1].startingEnemies[1].spawnCol = 160;
    encounters[1].startingEnemies[1].type = WALKER;
    encounters[1].numStartingEnemies = 2;

    encounters[2].startCol = SCREENWIDTH * 2;
    encounters[2].state = 0;
    encounters[2].startingEnemies[0].spawnCol = 80;
    encounters[2].startingEnemies[0].type = WALKER;
    encounters[2].startingEnemies[1].spawnCol = 120;
    encounters[2].startingEnemies[1].type = WALKER;
    encounters[2].startingEnemies[2].spawnCol = 160;
    encounters[2].startingEnemies[2].type = WALKER;
    encounters[2].numStartingEnemies = 3;

    encounters[3].startCol = SCREENWIDTH * 3;
    encounters[3].state = 0;
    encounters[3].startingEnemies[0].spawnCol = 80;
    encounters[3].startingEnemies[0].type = WALKER;
    encounters[3].startingEnemies[1].spawnCol = 120;
    encounters[3].startingEnemies[1].type = SHOOTER;
    encounters[3].startingEnemies[2].spawnCol = 160;
    encounters[3].startingEnemies[2].type = WALKER;
    encounters[3].numStartingEnemies = 3;

    encounters[4].startCol = SCREENWIDTH * 4;
    encounters[4].state = 0;
    encounters[4].startingEnemies[0].spawnCol = 90;
    encounters[4].startingEnemies[0].type = SHOOTER;
    encounters[4].startingEnemies[1].spawnCol = 140;
    encounters[4].startingEnemies[1].type = SHOOTER;
    encounters[4].numStartingEnemies = 2;

    encounters[5].startCol = SCREENWIDTH * 5;
    encounters[5].state = 0;
    encounters[5].startingEnemies[0].spawnCol = 60;
    encounters[5].startingEnemies[0].type = WALKER;
    encounters[5].startingEnemies[1].spawnCol = 100;
    encounters[5].startingEnemies[1].type = SHOOTER;
    encounters[5].startingEnemies[2].spawnCol = 180;
    encounters[5].startingEnemies[2].type = SHOOTER;
    encounters[5].numStartingEnemies = 3;

    encounters[6].startCol = SCREENWIDTH * 6;
    encounters[6].state = 0;
    encounters[6].startingEnemies[0].spawnCol = 100;
    encounters[6].startingEnemies[0].type = WALKER;
    encounters[6].startingEnemies[1].spawnCol = 140;
    encounters[6].startingEnemies[1].type = WALKER;
    encounters[6].startingEnemies[2].spawnCol = 180;
    encounters[6].startingEnemies[2].type = WRAITH;
    encounters[6].numStartingEnemies = 3;

    encounters[7].startCol = SCREENWIDTH * 7;
    encounters[7].state = 0;
    encounters[7].startingEnemies[0].spawnCol = 100;
    encounters[7].startingEnemies[0].type = SHOOTER;
    encounters[7].startingEnemies[1].spawnCol = 180;
    encounters[7].startingEnemies[1].type = WRAITH;
    encounters[7].numStartingEnemies = 2;

    encounters[8].startCol = SCREENWIDTH * 8;
    encounters[8].state = 0;
    encounters[8].startingEnemies[0].spawnCol = 60;
    encounters[8].startingEnemies[0].type = WRAITH;
    encounters[8].startingEnemies[1].spawnCol = 100;
    encounters[8].startingEnemies[1].type = SHOOTER;
    encounters[8].startingEnemies[2].spawnCol = 140;
    encounters[8].startingEnemies[2].type = SHOOTER;
    encounters[8].numStartingEnemies = 3;

    encounters[9].startCol = SCREENWIDTH * 9;
    encounters[9].state = 0;
    encounters[9].startingEnemies[0].spawnCol = 60;
    encounters[9].startingEnemies[0].type = WALKER;
    encounters[9].startingEnemies[1].spawnCol = 80;
    encounters[9].startingEnemies[1].type = WALKER;
    encounters[9].startingEnemies[2].spawnCol = 100;
    encounters[9].startingEnemies[2].type = WRAITH;
    encounters[9].startingEnemies[3].spawnCol = 140;
    encounters[9].startingEnemies[3].type = WRAITH;
    encounters[9].numStartingEnemies = 4;
    // #endregion

    player.worldCol = 20;
    player.width = 16;
    player.height = 32;
    player.worldRow = GROUND_LEVEL - player.height;
    currentPlayerHealth = PLAYER_MAX_HEALTH;
    currentPlayerMana = PLAYER_MAX_MANA;
    currentEncounter = 0;
    spellsUnlocked = 0;

    currentSBB = 15;
    startEncounter();
}

void initEnemies() {
    // Walkers
    for (int i = 0; i < MAX_WALKERS; i++) {
        walkers[i].health = WALKER_MAX_HEALTH;
        walkers[i].state = ENEMYSTATE_INACTIVE;
        walkers[i].width = 16;
        walkers[i].height = 32;
        walkers[i].worldCol = 200;
        walkers[i].worldRow = GROUND_LEVEL - walkers[i].height;
        walkers[i].attackStep = 0;
        walkers[i].colStep = 0;
    }
    // Shooters
    for (int i = 0; i < MAX_SHOOTERS; i++) {
        shooters[i].health = SHOOTER_MAX_HEALTH;
        shooters[i].state = ENEMYSTATE_INACTIVE;
        shooters[i].width = 16;
        shooters[i].height = 32;
        shooters[i].worldCol = 200;
        shooters[i].worldRow = GROUND_LEVEL - shooters[i].height;
        shooters[i].attackStep = 0;
    }
    // Wraiths
    for (int i = 0; i < MAX_SHOOTERS; i++) {
        wraiths[i].health = SHOOTER_MAX_HEALTH;
        wraiths[i].state = ENEMYSTATE_INACTIVE;
        wraiths[i].width = 16;
        wraiths[i].height = 32;
        wraiths[i].worldCol = 200;
        wraiths[i].worldRow = GROUND_LEVEL - wraiths[i].height;
        wraiths[i].attackStep = 0;
    }
}

void initProjectiles() {
    // Bolts
    for (int i = 0; i < MAX_PLAYER_BOLTS; i++) {
        playerBolts[i].active = 0;
        playerBolts[i].height = 8;
        playerBolts[i].width = 12;
        playerBolts[i].colStep = 0;
    }
    // Shooter Projectiles
    for (int i = 0; i < MAX_SHOOTER_PROJECTILES; i++) {
        shooterProjectiles[i].active = 0;
        shooterProjectiles[i].height = 8;
        shooterProjectiles[i].width = 12;
        shooterProjectiles[i].colStep = 0;
    }
}
//#endregion

//#region Update Functions 
void updateGame() {
    if (globalCooldown > 0) {
        globalCooldown--;
    }
    if (boltCooldown > 0) {
        boltCooldown--;
    }
    if (shieldCooldown > 0) {
        shieldCooldown--;
    }
    if (recentlyShieldedAttackTicks > 0) {
        recentlyShieldedAttackTicks--;
    }

    if (cheatEnabled) { // Cheat gives unlimitted Mana
        currentPlayerMana = 10;
    }

    if (BUTTON_HELD(BUTTON_RIGHT)) {
        playerFacingDirection = 1;
        // Stop player from moving into next encounter's region
        if (player.worldCol + player.width + 1 < encounters[currentEncounter].startCol + SCREENWIDTH) {
            if (playerMovementStep < 0) {
                playerMovementStep = 0;
            }
            if (player.worldRow + player.height < GROUND_LEVEL) { // Half speed while airborne
                playerMovementStep += 4;
            } else {
                playerMovementStep += 8;
            }
            if (playerMovementStep >= 10) {
                player.worldCol++;
                playerMovementStep -= 10;
            }
        } else {
            if (encounters[currentEncounter].state == ENCOUNTER_COMPLETE) {
                // Move to next encounter
                currentEncounter++;
                if (currentEncounter >= NUMBER_OF_ENCOUNTERS) {
                    goToWin();
                } else {
                    startEncounter();
                }
            }
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        playerFacingDirection = -1;
        
        // Stop player from moving into next encounter's region
        if (player.worldCol - 1 >= encounters[currentEncounter].startCol) {
            if (playerMovementStep > 0) {
                playerMovementStep = 0;
            }
            if (player.worldRow + player.height < GROUND_LEVEL) { // Half speed while airborne
                playerMovementStep -= 4;
            } else {
                playerMovementStep -= 8;
            }
            if (playerMovementStep <= -10) {
                player.worldCol--;
                playerMovementStep += 10;
            }
        }
    }

    // Spells
    // Bolt
    if (BUTTON_PRESSED(BUTTON_A) && spellsUnlocked >= BOLT && globalCooldown <= 0 && boltCooldown <= 0 && currentPlayerMana > 0) {
        if (currentPlayerMana <= 0) {
            return;
        }
        spawnPlayerBolt();
        currentPlayerMana -= BOLT_MANA_COST;
        globalCooldown = GLOBAL_CAST_COOLDOWN;
        boltCooldown = BOLT_COOLDOWN;
        if (currentPlayerMana <= 0) {
            playerManaStep -= PLAYER_MANA_BURNOUT;
        }
    }
    // Shield
    if (BUTTON_HELD(BUTTON_B) && spellsUnlocked >= SHIELD && globalCooldown <= 0 && shieldCooldown <= 0 && currentPlayerMana > 0) {
        durationShielded++;
        playerManaStep = 0;
        playerManaDrainStep += SHIELD_MANA_COST_BASE + (durationShielded * SHIELD_MANA_COST_GROWTH);
        if (playerManaDrainStep >= 1000) {
            playerManaDrainStep -= 1000;
            currentPlayerMana--;
        }
        if (currentPlayerMana <= 0) {
            playerManaStep -= PLAYER_MANA_BURNOUT;
        }
    } else {
        durationShielded = 0;
    }
    // Levitate
    if (BUTTON_HELD(BUTTON_UP) && spellsUnlocked >= LEVITATE && currentPlayerMana > 0) {
        if (levitateHeightStep < 0) { // Undo falling progress when up is pressed
            levitateHeightStep = 0;
        }
        playerManaStep = 0; // No regen while levitating
        if (player.worldRow + player.height > GROUND_LEVEL - LEVITATE_MAX_HEIGHT) {
            levitateHeightStep++;
        }
        if (levitateHeightStep >= LEVITATE_STEPS_PER_MOVE_UP) {
            player.worldRow--;
            levitateHeightStep = 0;
        }
        //levitateManaConsumptionStep++;
        if (levitateManaConsumptionStep >= LEVITATE_STEPS_PER_MANA_DRAIN) {
            currentPlayerMana--;
            levitateManaConsumptionStep = 0;
        }
        if (currentPlayerMana <= 0) {
            playerManaStep -= PLAYER_MANA_BURNOUT;
        }
    } else {
        if (player.worldRow + player.height < GROUND_LEVEL) {
            levitateHeightStep--;
            if (levitateHeightStep < 0 && abs(levitateHeightStep) >= LEVITATE_STEPS_PER_MOVE_DOWN) {
                player.worldRow++;
                levitateHeightStep = 0;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_DOWN) && spellsUnlocked >= LEVITATE && player.worldRow + player.height < GROUND_LEVEL) {
        levitateHeightStep -= LEVITATE_FALL_ACCELERATED_RATE;
        if (levitateHeightStep < 0 && abs(levitateHeightStep) >= LEVITATE_STEPS_PER_MOVE_DOWN) {
            player.worldRow++;
            levitateHeightStep = 0;
        }
    }

    updateEnemies();
    updateProjectiles();

    player.screenCol = player.worldCol - hOff;
    player.screenRow = player.worldRow - vOff;

    if (currentPlayerMana < PLAYER_MAX_MANA || playerManaStep < 0) { // < 0 used for delaying mana regen temporarily if we want to
        playerManaStep++;
        if (playerManaStep >= PLAYER_TICKS_PER_MANA_REGEN) {
            currentPlayerMana++;
            playerManaStep -= PLAYER_TICKS_PER_MANA_REGEN;
        }
    }
}

void updateEnemies() {
    // Walkers
    for (int i = 0; i < MAX_WALKERS; i++) {
        int temp = playerIsWithinRange(walkers[i].worldCol, walkers[i].width, WALKER_SWING_RANGE);
        switch (walkers[i].state) {
            case ENEMYSTATE_ATTACKING:
                if (temp != 0) {
                    walkers[i].state = ENEMYSTATE_MOVING;
                } else {
                    walkers[i].attackStep++;
                    if (walkers[i].attackStep > WALKER_ATTACK_COOLDOWN) {
                        damagePlayer(WALKER_DAMAGE, 0);
                        walkers[i].recentAttack = 15;
                        walkers[i].attackStep = 0;
                    }
                }
                break;
            case ENEMYSTATE_MOVING:
                // Start attack if close enough to player
                if (temp == 0) {
                    walkers[i].worldRow = GROUND_LEVEL - walkers[i].height;
                    walkers[i].state = ENEMYSTATE_ATTACKING;
                    walkers[i].attackStep = -WALKER_ATTACK_WINDUP; // Add the windup before first attack
                // Otherwise move towards them
                } else if (temp == -1) { // Player to the left
                    walkers[i].worldRow = GROUND_LEVEL - walkers[i].height;
                    walkers[i].colStep -= WALKER_SPEED;
                    if (walkers[i].colStep <= 0) {
                        walkers[i].worldCol--;
                        walkers[i].colStep += 10;
                    }
                } else { // Player to the right
                    walkers[i].worldRow = GROUND_LEVEL - walkers[i].height;
                    walkers[i].colStep += WALKER_SPEED;
                    if (walkers[i].colStep >= 10) {
                        walkers[i].worldCol++;
                        walkers[i].colStep -= 10;
                    }
                }
                break;
        }
    }
    // Shooters
    for (int i = 0; i < MAX_SHOOTERS; i++) {
        switch (shooters[i].state) {
            case ENEMYSTATE_ATTACKING:
                shooters[i].attackStep++;
                shooters[i].framesInAttackState++;
                shooters[i].facingDirection = playerIsWithinRange(shooters[i].worldCol, 0, 0);
                if (shooters[i].attackStep >= SHOOTER_ATTACK_COOLDOWN) {
                    spawnShooterProjectile(shooters[i].worldCol, shooters[i].worldRow, shooters[i].facingDirection, shooters[i].height, shooters[i].width);
                    shooters[i].attackStep = 0;
                }
                if (shooters[i].framesInAttackState >= SHOOTER_ATTACK_STATE_DURATION) {
                    shooters[i].framesInAttackState = 0;
                    shooters[i].state = ENEMYSTATE_IDLE;
                }
                break;
            case ENEMYSTATE_IDLE:
                shooters[i].framesInIdleState++;
                if (shooters[i].framesInIdleState >= SHOOTER_IDLE_STATE_DURATION) {
                    shooters[i].framesInIdleState = 0;
                    shooters[i].state = ENEMYSTATE_ATTACKING;
                    shooters[i].facingDirection = playerIsWithinRange(shooters[i].worldCol, 0, 0);
                    spawnShooterProjectile(shooters[i].worldCol, shooters[i].worldRow, shooters[i].facingDirection, shooters[i].height, shooters[i].width);
                }
                break;
        }
    }
    // Wraiths
    for (int i = 0; i < MAX_WRAITHS; i++) {
        if (wraiths[i].state != ENEMYSTATE_INACTIVE) {
            wraiths[i].attackStep++;
            shooters[i].framesInAttackState++;
            wraiths[i].facingDirection = playerIsWithinRange(wraiths[i].worldCol, 0, 0);

            // Attacking
            if (wraiths[i].attackStep >= WRAITH_ATTACK_COOLDOWN) {
                spawnShooterProjectile(wraiths[i].worldCol, player.worldRow, wraiths[i].facingDirection, wraiths[i].height, wraiths[i].width);
                wraiths[i].attackStep = 0;
            }

            // Vertical Movement
            if (wraiths[i].worldRow >= GROUND_LEVEL - wraiths[i].height) {
                wraiths[i].framesOnGround++;
                if (wraiths[i].framesOnGround >= WRAITH_GROUND_DURATION) {
                    wraiths[i].framesOnGround = 0;
                    wraiths[i].rowVelocity = 1;
                }
            } else if (wraiths[i].worldRow + wraiths[i].height <= GROUND_LEVEL - WRAITH_MAX_HEIGHT) {
                wraiths[i].framesInAir++;
                if (wraiths[i].framesInAir >= WRAITH_AIRBORNE_DURATION) {
                    wraiths[i].framesInAir = 0;
                    wraiths[i].rowVelocity = -1;
                }
            }
            wraiths[i].rowStep += WRAITH_SPEED * wraiths[i].rowVelocity;
            if (wraiths[i].rowStep <= -10) {
                wraiths[i].rowStep += 10;
                wraiths[i].worldRow++;
                if (wraiths[i].worldRow + wraiths[i].height >= GROUND_LEVEL) {
                    wraiths[i].rowStep = 0;
                    wraiths[i].rowVelocity = 0;
                }
            }
            if (wraiths[i].rowStep >= 10) {
                wraiths[i].rowStep -= 10;
                wraiths[i].worldRow--;
                if (wraiths[i].worldRow + wraiths[i].height <= GROUND_LEVEL - WRAITH_MAX_HEIGHT) {
                    wraiths[i].rowStep = 0;
                    wraiths[i].rowVelocity = 0;
                }
            }
        }
    }
}

void updateProjectiles() {
    // Player Bolts
    for (int i = 0; i < MAX_PLAYER_BOLTS; i++) {
        if (playerBolts[i].active) {
            playerBolts[i].colStep += playerBolts[i].direction * PLAYER_BOLT_SPEED;
            while (playerBolts[i].colStep >= 10 && playerBolts[i].direction == 1) {
                playerBolts[i].worldCol++;
                playerBolts[i].colStep -= 10;
            }
            while (playerBolts[i].colStep <= -10 && playerBolts[i].direction == -1) {
                playerBolts[i].worldCol--;
                playerBolts[i].colStep += 10;
            }

            // Walker Collision
            for (int j = 0; j < MAX_WALKERS; j++) {
                if (walkers[j].state != ENEMYSTATE_INACTIVE && collision(playerBolts[i].worldCol, playerBolts[i].worldRow, playerBolts[i].width, 
                        playerBolts[i].height, walkers[j].worldCol, walkers[j].worldRow, walkers[j].width, 
                        walkers[j].height)) {
                    walkers[j].health -= PLAYER_BOLT_DAMAGE;
                    playerBolts[i].active = 0;
                    if (walkers[j].health <= 0) {
                        walkers[j].state = ENEMYSTATE_INACTIVE;
                        encounters[currentEncounter].state = 1 + currentEncounterIsCleared(); // +1 because of how the states are setup
                    }
                }
            }
            // Shooter Collision
            for (int j = 0; j < MAX_SHOOTERS; j++) {
                if (shooters[j].state == ENEMYSTATE_ATTACKING && collision(playerBolts[i].worldCol, playerBolts[i].worldRow, playerBolts[i].width, 
                        playerBolts[i].height, shooters[j].worldCol, shooters[j].worldRow, shooters[j].width, 
                        shooters[j].height)) {
                    shooters[j].health -= PLAYER_BOLT_DAMAGE;
                    playerBolts[i].active = 0;
                    if (shooters[j].health <= 0) {
                        shooters[j].state = ENEMYSTATE_INACTIVE;
                        encounters[currentEncounter].state = 1 + currentEncounterIsCleared(); // +1 because of how the states are setup
                    }
                }
            }
            // Wraith Collision
            for (int j = 0; j < MAX_SHOOTERS; j++) {
                if (wraiths[j].state != ENEMYSTATE_INACTIVE && collision(playerBolts[i].worldCol, playerBolts[i].worldRow, playerBolts[i].width, 
                        playerBolts[i].height, wraiths[j].worldCol, wraiths[j].worldRow, wraiths[j].width, 
                        wraiths[j].height)) {
                    wraiths[j].health -= PLAYER_BOLT_DAMAGE;
                    playerBolts[i].active = 0;
                    if (wraiths[j].health <= 0) {
                        wraiths[j].state = ENEMYSTATE_INACTIVE;
                        encounters[currentEncounter].state = 1 + currentEncounterIsCleared(); // +1 because of how the states are setup
                    }
                }
            }
            
            playerBolts[i].screenCol = playerBolts[i].worldCol - hOff;
            playerBolts[i].screenRow = playerBolts[i].worldRow - vOff;
            if (playerBolts[i].screenCol > SCREENWIDTH || playerBolts[i].screenCol < 0) {
                playerBolts[i].active = 0;   
            }
        }
    }
    // Shooter Projectiles
    for (int i = 0; i < MAX_SHOOTER_PROJECTILES; i++) {
        if (shooterProjectiles[i].active) {
            shooterProjectiles[i].colStep += shooterProjectiles[i].direction * SHOOTER_BOLT_SPEED;
            while (shooterProjectiles[i].colStep >= 10 && shooterProjectiles[i].direction == 1) {
                shooterProjectiles[i].worldCol++;
                shooterProjectiles[i].colStep -= 10;
            }
            while (shooterProjectiles[i].colStep <= -10 && shooterProjectiles[i].direction == -1) {
                shooterProjectiles[i].worldCol--;
                shooterProjectiles[i].colStep += 10;
            }

            // Player Collision
            if (collision(shooterProjectiles[i].worldCol, shooterProjectiles[i].worldRow, shooterProjectiles[i].width, shooterProjectiles[i].height,
                    player.worldCol, player.worldRow, player.width, player.height)) {
                damagePlayer(SHOOTER_DAMAGE, 0);
                shooterProjectiles[i].active = 0;
            }
            shooterProjectiles[i].screenCol = shooterProjectiles[i].worldCol - hOff;
            shooterProjectiles[i].screenRow = shooterProjectiles[i].worldRow - vOff;
            if (shooterProjectiles[i].screenCol > SCREENWIDTH || shooterProjectiles[i].screenCol < 0) {
                shooterProjectiles[i].active = 0;   
            }
        }
    }
}
//#endregion

//#region Drawing Functions
void drawGame() {
    if (state != GAME) {
        return;
    }

    //REG_BG0HOFF = hOff;
    //REG_BG0VOFF = vOff;

    // Draw Player
    shadowOAM[0].attr0 = player.screenRow | ATTR0_TALL;
    shadowOAM[0].attr1 = player.screenCol | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 0);

    if (playerFacingDirection == -1) {
        shadowOAM[0].attr1 |= ATTR1_HFLIP;
    }

    // Shield
    shadowOAM[1].attr0 = (player.screenRow) | ATTR0_SQUARE;
    if (player.screenCol < 8) {
        shadowOAM[1].attr1 = 0 | ATTR1_MEDIUM;
    } else {
        shadowOAM[1].attr1 = (player.screenCol - 8) | ATTR1_MEDIUM;
    }
    if (durationShielded > 0) {
        if (recentlyShieldedAttackTicks > 0) {
            shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(9, 4);
        } else {
            shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(9, 0);
        }
    } else {
        shadowOAM[1].attr0 |= ATTR0_HIDE;
    }

    shadowOAMIndex = 2;

    drawEnemies();
    drawProjectiles();
    drawUI();

    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(currentSBB) | BG_4BPP | BG_SIZE_SMALL;
}

void drawEnemies() {
    // Walkers
    for (int i = 0; i < MAX_WALKERS; i++) {
        if (walkers[i].state != ENEMYSTATE_INACTIVE) {
            if (walkers[i].recentAttack > 0) {
                walkers[i].recentAttack--;
            }
            walkers[i].screenCol = walkers[i].worldCol - hOff;
            walkers[i].screenRow = walkers[i].worldRow - vOff;

            shadowOAM[shadowOAMIndex].attr0 = walkers[i].screenRow | ATTR0_TALL;
            shadowOAM[shadowOAMIndex].attr1 = walkers[i].screenCol | ATTR1_MEDIUM;
            shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0);
            if (walkers[i].recentAttack > 0) {
                shadowOAM[shadowOAMIndex].attr2 |= ATTR2_TILEID(3, 8);
            } else if (walkers[i].state == ENEMYSTATE_ATTACKING) {
                shadowOAM[shadowOAMIndex].attr2 |= ATTR2_TILEID(3, 4);
            } else {
                shadowOAM[shadowOAMIndex].attr2 |= ATTR2_TILEID(3, 0);
            }

            if (player.worldCol > walkers[i].worldCol) {
                shadowOAM[shadowOAMIndex].attr1 |= ATTR1_HFLIP;
            }
        } else {
            shadowOAM[shadowOAMIndex].attr0 = ATTR0_HIDE;
        }
        shadowOAMIndex++;
    } 

    // Shooters
    for (int i = 0; i < MAX_SHOOTERS; i++) {
        if (shooters[i].state != ENEMYSTATE_INACTIVE) {
            shooters[i].screenCol = shooters[i].worldCol - hOff;
            shooters[i].screenRow = shooters[i].worldRow - vOff;

            shadowOAM[shadowOAMIndex].attr0 = shooters[i].screenRow | ATTR0_TALL;
            shadowOAM[shadowOAMIndex].attr1 = shooters[i].screenCol | ATTR1_MEDIUM;
            if (shooters[i].state == ENEMYSTATE_ATTACKING) {
                shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(13, 4);
            } else {
                shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(13, 0);
            }
        } else {
            shadowOAM[shadowOAMIndex].attr0 = ATTR0_HIDE;
        }
        shadowOAMIndex++;
    } 

    // Wraiths
    for (int i = 0; i < MAX_WRAITHS; i++) {
        if (wraiths[i].state != ENEMYSTATE_INACTIVE) {
            wraiths[i].animStep++;
            wraiths[i].screenCol = wraiths[i].worldCol - hOff;
            wraiths[i].screenRow = wraiths[i].worldRow - vOff;

            shadowOAM[shadowOAMIndex].attr0 = wraiths[i].screenRow | ATTR0_TALL;
            shadowOAM[shadowOAMIndex].attr1 = wraiths[i].screenCol | ATTR1_MEDIUM;

            if (wraiths[i].animStep >= 30) {
                wraiths[i].animStep = 0;
                wraiths[i].aniState = (wraiths[i].aniState + 1) % 3;
            }

            shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(15, 4 * wraiths[i].aniState);
            if (wraiths[i].facingDirection == 1) {
                shadowOAM[shadowOAMIndex].attr1 |= ATTR1_HFLIP;
            }
        } else {
            shadowOAM[shadowOAMIndex].attr0 = ATTR0_HIDE;
        }
        shadowOAMIndex++;
    } 
}

void drawProjectiles() {
    // Bolts
    for (int i = 0; i < MAX_PLAYER_BOLTS; i++) {
        if (playerBolts[i].active) {
            shadowOAM[shadowOAMIndex].attr0 = playerBolts[i].screenRow | ATTR0_WIDE;
            shadowOAM[shadowOAMIndex].attr1 = playerBolts[i].screenCol | ATTR1_TINY;
            shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5, 0);
        } else {
            shadowOAM[shadowOAMIndex].attr0 = ATTR0_HIDE;
        }
        shadowOAMIndex++;
    }
    // Shooter Projectiles
    for (int i = 0; i < MAX_SHOOTER_PROJECTILES; i++) {
        if (shooterProjectiles[i].active) {
            shadowOAM[shadowOAMIndex].attr0 = shooterProjectiles[i].screenRow | ATTR0_WIDE;
            shadowOAM[shadowOAMIndex].attr1 = shooterProjectiles[i].screenCol | ATTR1_TINY;
            shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5, 1);
        } else {
            shadowOAM[shadowOAMIndex].attr0 = ATTR0_HIDE;
        }
        shadowOAMIndex++;
    }
}

void drawUI() {
    // Health
    int col = 4;
    int row = 4;
    for (int i = 0; i < PLAYER_MAX_HEALTH; i++) {
        if (i < currentPlayerHealth) {
            shadowOAM[shadowOAMIndex].attr0 = row | ATTR0_SQUARE;
            shadowOAM[shadowOAMIndex].attr1 = col | ATTR1_TINY;
            shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(7, 0);
        } else {
            shadowOAM[shadowOAMIndex].attr0 |= ATTR0_HIDE;
        }
        shadowOAMIndex++;
        col += 7;
    }
 
    // Mana
    col = SCREENWIDTH - 7 * PLAYER_MAX_MANA - 4;
    for (int i = 0; i < PLAYER_MAX_MANA; i++) {
        if (i < currentPlayerMana) {
            shadowOAM[shadowOAMIndex].attr0 = row | ATTR0_SQUARE;
            shadowOAM[shadowOAMIndex].attr1 = col | ATTR1_TINY;
            shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(7, 1);
        } else {
            shadowOAM[shadowOAMIndex].attr0 |= ATTR0_HIDE;
        }
        shadowOAMIndex++;
        col += 7;
    }
}
//#endregion