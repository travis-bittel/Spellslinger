#include "myLib.h"
#include "game.h"
#include <stdlib.h>

extern void goToLose();

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

PlayerBolt playerBolts[MAX_PLAYER_BOLTS];

enum {ENEMYSTATE_INACTIVE, ENEMYSTATE_MOVING, ENEMYSTATE_ATTACKING, ENEMYSTATE_SHOOTING};

int currentEncounter = 0; // The index of the encounter the player is currently in

int shadowOAMIndex = 0; // Used to keep track of where we are in the shadowOAM. Updated in the draw functions

int hOff = 0;
int vOff = 95;

int currentPlayerHealth = PLAYER_MAX_HEALTH;
int currentPlayerMana = PLAYER_MAX_MANA;
int playerManaStep = 0; // Used to regen mana at a rate of <1 per tick

int playerFacingDirection = 1; // -1 = Left, 1 = Right

/* 0 -- Bolt
 * 1 -- Shield
 * 2 -- Levitate
*/
int spellsUnlocked = 0; 

//#region Init Functions
void initGame() {
    initEnemies();
    initProjectiles();

    encounters[0].startCol = 0;
    encounters[0].state = 1;

    encounters[1].startCol = SCREENWIDTH;
    encounters[1].state = 0;

    player.worldCol = 20;
    player.worldRow = 217;
    player.width = 8;
    player.height = 8;
}

void initEnemies() {
    // Walkers
    for (int i = 0; i < MAX_WALKERS; i++) {
        walkers[i].health = WALKER_MAX_HEALTH;
        walkers[i].state = ENEMYSTATE_MOVING;
        walkers[i].width = 8;
        walkers[i].height = 8;
        walkers[i].worldCol = 200;
        walkers[i].worldRow = 217;
        walkers[i].attackStep = 0;
        walkers[i].colStep = 0;
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
}
//#endregion

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

//#region Update Functions
void updateGame() {
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        playerFacingDirection = 1;
        // Stop player from moving into next encounter's region
        if (player.worldCol + player.width + 1 < encounters[currentEncounter + 1].startCol) {
            player.worldCol++;
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        playerFacingDirection = -1;
        // Stop player from moving into next encounter's region
        if (player.worldCol - 1 >= encounters[currentEncounter].startCol) {
            player.worldCol--;
        }
    }

    // Spells
    if (BUTTON_PRESSED(BUTTON_A)) { // Bolt
        if (currentPlayerMana <= 0) {
            return;
        }
        spawnPlayerBolt();
        currentPlayerMana -= BOLT_MANA_COST;
        if (currentPlayerMana <= 0) {
            playerManaStep -= PLAYER_MANA_BURNOUT;
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
                        damagePlayer(WALKER_DAMAGE);
                        walkers[i].attackStep = 0;
                    }
                }
                break;
            case ENEMYSTATE_MOVING:
                // Start attack if close enough to player
                if (temp == 0) {
                    walkers[i].worldRow = 200;
                    walkers[i].state = ENEMYSTATE_ATTACKING;
                    walkers[i].attackStep = -WALKER_ATTACK_WINDUP; // Add the windup before first attack
                // Otherwise move towards them
                } else if (temp == -1) { // Player to the left
                    walkers[i].worldRow = 217;
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
}

void updateProjectiles() {
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
}
//#endregion

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

void damagePlayer(int amount) {
    currentPlayerHealth -= amount;
    if (currentPlayerHealth <= 0) {
        goToLose();
    }
}

//#region Drawing Functions
void drawEnemies() {
    // Walkers

    for (int i = 0; i < MAX_WALKERS; i++) {
        if (walkers[i].state != ENEMYSTATE_INACTIVE) {
            walkers[i].screenCol = walkers[i].worldCol - hOff;
            walkers[i].screenRow = walkers[i].worldRow - vOff;

            shadowOAM[shadowOAMIndex].attr0 = walkers[i].screenRow | ATTR0_SQUARE;
            shadowOAM[shadowOAMIndex].attr1 = walkers[i].screenCol | ATTR1_TINY;
            shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 0);
        } else {
            shadowOAM[shadowOAMIndex].attr0 = ATTR0_HIDE;
        }
        shadowOAMIndex++;
    } 
}

void drawGame() {
    if (state != GAME) {
        return;
    }

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    shadowOAM[0].attr0 = player.screenRow | ATTR0_SQUARE;
    shadowOAM[0].attr1 = player.screenCol | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 0);
    shadowOAMIndex = 1;

    drawEnemies();
    drawProjectiles();

    DMANow(3, shadowOAM, OAM, 512);
}

void drawProjectiles() {
    // Bolts
    for (int i = 0; i < MAX_PLAYER_BOLTS; i++) {
        if (playerBolts[i].active) {
            shadowOAM[shadowOAMIndex].attr0 = playerBolts[i].screenRow | ATTR0_SQUARE;
            shadowOAM[shadowOAMIndex].attr1 = playerBolts[i].screenCol | ATTR1_TINY;
            shadowOAM[shadowOAMIndex].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(1, 0);
        } else {
            shadowOAM[shadowOAMIndex].attr0 = ATTR0_HIDE;
        }
        shadowOAMIndex++;
    }
}
//#endregion