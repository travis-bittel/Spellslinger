#include "myLib.h"
#include "game.h"
#include <stdlib.h>
#include "spritesheet.h"

extern void goToLose();
extern void goToWin();

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

int hOff = 0;
int vOff = 95;

int currentPlayerHealth = PLAYER_MAX_HEALTH;
int currentPlayerMana = PLAYER_MAX_MANA;
int playerManaStep = 0; // Used to regen mana at a rate of <1 per tick

int playerFacingDirection = 1; // -1 = Left, 1 = Right

enum {BOLT, SHIELD, LEVITATE};
int spellsUnlocked = 2;

int shieldTicks = 0; // When >0, negate projectiles and melee attacks

int globalCooldown = 0; // Prevents all spellcasts while >0
int boltCooldown = 0;
int shieldCooldown = 0;

int levitateManaConsumptionStep = 0;
int levitateHeightStep = 0;

int playerMovementStep = 0;

void startEncounter() {
    player.worldCol = encounters[currentEncounter].startCol + 1;
    hOff = encounters[currentEncounter].startCol;

    // Spawn Monsters
    for (int i = 0; i < encounters[currentEncounter].numStartingEnemies; i++) {
        EnemySpawn spawn = encounters[currentEncounter].startingEnemies[i];
        spawnEnemy(spawn.type, spawn.spawnCol);
    }
}

void damagePlayer(int amount, int pierceShield) {
    if (!pierceShield && shieldTicks > 0) {
        // Change shield sprite to blocked version
        shadowOAM[1].attr0 = (player.screenRow - 8) | ATTR0_SQUARE;
        shadowOAM[1].attr1 = player.screenCol | ATTR1_TINY;
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5, 1);

        currentPlayerMana += SHIELD_MANA_REFUND;
        if (currentPlayerMana > PLAYER_MAX_MANA) {
            currentPlayerMana = PLAYER_MAX_MANA;
        }

        shieldTicks += SHIELD_EXTENSION_ON_HIT;
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
            playerBolts[i].worldRow = player.worldRow + player.height / 2;
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

void spawnShooterProjectile(Shooter* shooter) {
    for (int i = 0; i < MAX_SHOOTER_PROJECTILES; i++) {
        if (!shooterProjectiles[i].active) {
            shooterProjectiles[i].active = 1;
            shooterProjectiles[i].colStep = 0;
            shooterProjectiles[i].worldRow = shooter->worldRow + shooter->height / 2;
            shooterProjectiles[i].direction = shooter->facingDirection;
            if (shooter->facingDirection == -1) {
                shooterProjectiles[i].worldCol = shooter->worldCol - shooterProjectiles[i].width;
            } else {
                shooterProjectiles[i].worldCol = shooter->worldCol + shooter->width;
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
                    shooters[i].attackStep = 0;
                    shooters[i].hide = 0;
                    shooters[i].facingDirection = 1;
                    break;
                }
            }
            break;
        case WRAITH:
            for (int i = 0; i < MAX_WRAITHS; i++) {
                if (shooters[i].state == ENEMYSTATE_INACTIVE) {
                    shooters[i].state = ENEMYSTATE_IDLE;
                    shooters[i].health = SHOOTER_MAX_HEALTH;
                    shooters[i].worldCol = encounters[currentEncounter].startCol + col;
                    shooters[i].attackStep = 0;
                    shooters[i].hide = 0;
                    shooters[i].facingDirection = 1;
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

    encounters[0].startCol = 0;
    encounters[0].state = 1;
    encounters[0].startingEnemies[0].spawnCol = 80;
    encounters[0].startingEnemies[0].type = SHOOTER;
    encounters[0].numStartingEnemies = 1;

    encounters[1].startCol = SCREENWIDTH;
    encounters[1].state = 0;
    encounters[1].startingEnemies[0].spawnCol = 80;
    encounters[1].startingEnemies[0].type = WALKER;
    encounters[1].startingEnemies[1].spawnCol = 120;
    encounters[1].startingEnemies[1].type = WALKER;
    encounters[1].startingEnemies[2].spawnCol = 40;
    encounters[1].startingEnemies[2].type = WALKER;
    encounters[1].numStartingEnemies = 3;

    player.worldCol = 20;
    player.width = 8;
    player.height = 16;
    player.worldRow = GROUND_LEVEL - player.height;
    currentPlayerHealth = PLAYER_MAX_HEALTH;
    currentPlayerMana = PLAYER_MAX_MANA;

    startEncounter();
}

void initEnemies() {
    // Walkers
    for (int i = 0; i < MAX_WALKERS; i++) {
        walkers[i].health = WALKER_MAX_HEALTH;
        walkers[i].state = ENEMYSTATE_INACTIVE;
        walkers[i].width = 8;
        walkers[i].height = 16;
        walkers[i].worldCol = 200;
        walkers[i].worldRow = GROUND_LEVEL - walkers[i].height;
        walkers[i].attackStep = 0;
        walkers[i].colStep = 0;
    }
    // Shooters
    for (int i = 0; i < MAX_SHOOTERS; i++) {
        shooters[i].health = SHOOTER_MAX_HEALTH;
        shooters[i].state = ENEMYSTATE_INACTIVE;
        shooters[i].width = 8;
        shooters[i].height = 16;
        shooters[i].worldCol = 200;
        shooters[i].worldRow = GROUND_LEVEL - shooters[i].height;
        shooters[i].attackStep = 0;
    }
}

void initProjectiles() {
    // Bolts
    for (int i = 0; i < MAX_PLAYER_BOLTS; i++) {
        playerBolts[i].active = 0;
        playerBolts[i].height = 8;
        playerBolts[i].width = 8;
        playerBolts[i].colStep = 0;
    }
    // Shooter Projectiles
    for (int i = 0; i < MAX_SHOOTER_PROJECTILES; i++) {
        shooterProjectiles[i].active = 0;
        shooterProjectiles[i].height = 8;
        shooterProjectiles[i].width = 8;
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
    if (shieldTicks > 0) {
        shieldTicks--;
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
    if (BUTTON_PRESSED(BUTTON_A) && globalCooldown <= 0 && boltCooldown <= 0 && currentPlayerMana > 0) { // Bolt
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
    if (BUTTON_PRESSED(BUTTON_B) && spellsUnlocked >= SHIELD && globalCooldown <= 0 && shieldCooldown <= 0 && currentPlayerMana > 0) { // Shield
        shieldTicks = SHIELD_DURATION;
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 1);
        
        currentPlayerMana -= SHIELD_MANA_COST;
        globalCooldown = GLOBAL_CAST_COOLDOWN;
        shieldCooldown = SHIELD_COOLDOWN;
        if (currentPlayerMana <= 0) {
            playerManaStep -= PLAYER_MANA_BURNOUT;
        }
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
        levitateManaConsumptionStep++;
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
            playerManaStep = 0;
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
                        walkers[i].attackStep = 0;
                    }
                }
                break;
            case ENEMYSTATE_MOVING:
                // Start attack if close enough to player
                if (temp == 0) {
                    walkers[i].worldRow = GROUND_LEVEL - walkers[i].height - 2;
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
                    walkers[i].worldRow = 217;
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
                    spawnShooterProjectile(&shooters[i]);
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
                    spawnShooterProjectile(&shooters[i]);
                }
                break;
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

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    // Draw Player
    shadowOAM[0].attr0 = player.screenRow | ATTR0_TALL;
    shadowOAM[0].attr1 = player.screenCol | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 0);

    // Shield
    if (shieldTicks > 0) {
        shadowOAM[1].attr0 = (player.screenRow - 10) | ATTR0_SQUARE;
        shadowOAM[1].attr1 = player.screenCol | ATTR1_TINY;
    } else {
        shadowOAM[1].attr0 |= ATTR0_HIDE;
    }

    shadowOAMIndex = 2;

    drawEnemies();
    drawProjectiles();
    drawUI();

    DMANow(3, shadowOAM, OAM, 512);
}

void drawEnemies() {
    // Walkers
    for (int i = 0; i < MAX_WALKERS; i++) {
        if (walkers[i].state != ENEMYSTATE_INACTIVE) {
            walkers[i].screenCol = walkers[i].worldCol - hOff;
            walkers[i].screenRow = walkers[i].worldRow - vOff;

            shadowOAM[shadowOAMIndex].attr0 = walkers[i].screenRow | ATTR0_TALL;
            shadowOAM[shadowOAMIndex].attr1 = walkers[i].screenCol | ATTR1_TINY;
            shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, 0);
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
            shadowOAM[shadowOAMIndex].attr1 = shooters[i].screenCol | ATTR1_TINY;
            if (shooters[i].state == ENEMYSTATE_ATTACKING) {
                shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(7, 0);
            } else {
                shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(6, 0);
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
            shadowOAM[shadowOAMIndex].attr0 = playerBolts[i].screenRow | ATTR0_SQUARE;
            shadowOAM[shadowOAMIndex].attr1 = playerBolts[i].screenCol | ATTR1_TINY;
            shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3, 0);
        } else {
            shadowOAM[shadowOAMIndex].attr0 = ATTR0_HIDE;
        }
        shadowOAMIndex++;
    }
    // Shooter Projectiles
    for (int i = 0; i < MAX_SHOOTER_PROJECTILES; i++) {
        if (shooterProjectiles[i].active) {
            shadowOAM[shadowOAMIndex].attr0 = shooterProjectiles[i].screenRow | ATTR0_SQUARE;
            shadowOAM[shadowOAMIndex].attr1 = shooterProjectiles[i].screenCol | ATTR1_TINY;
            shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(3, 1);
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
            shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5, 0);
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
            shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(4, 0);
        } else {
            shadowOAM[shadowOAMIndex].attr0 |= ATTR0_HIDE;
        }
        shadowOAMIndex++;
        col += 7;
    }
}
//#endregion