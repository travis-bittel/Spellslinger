/* What I currently have working:
 * - Player Movement (Left/Right)
 * - The First Enemy Type (Chases and Attacks the Player)
 * - The First Spell (Bolt: Projectile That Damages Enemies)
 * - Mana System (Costs, Regen, and Burnout - see game.h)
 * - Player Health and Death
 * - Basics of the Encounter System
 *     - Each SCREENWIDTH wide region is an encounter with predefined enemy spawns
 *     - After the player defeats all enemies in the encounter, they can move right to enter the next encounter
 *     - The player will receive new spells upon starting certain encounters
 * 
 * Next Steps:
 * - Next Two Player Spells:
 *     - Shield: Protects the player from projectiles and melee attacks (not not beams) briefly
 *     - Levitate: The player can move up at the cost of Mana to dodge beams at ground level and
 *       more easily hit floating enemies
 * - Next Three Enemy Types:
 *     - Shooter: Stands still and fires projectiles at the player
 *     - Wraith: Floats up and down randomly, fires projectiles at the player
 *     - Beamer: Fires beams towards the player that deal damage over time
 * - Setup all of the encounters!
 * 
 * ...And After That:
 * - Final Boss Battle
 *     - Will be a combination of previously seen enemy mechanics
 * - Art and Sound
 *     - In particular, UI is the top priority
 * - Potential Other Spells and Additional Enemy Types?
*/

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "start.h"
#include "instructions.h"
#include "win.h"
#include "lose.h"
#include "paused.h"
#include "background.h"
#include "game.h"
#include "player.h"
#include "spritesheet.h"

// Prototypes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum
{
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

int main()
{
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state)
        {
        case START:
            start();
            break;
        case INSTRUCTIONS:
            instructions();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}

// Sets up GBA
void initialize()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_4BPP | BG_SIZE_WIDE;

    buttons = BUTTONS;
    oldButtons = 0;

    // Spritesheet stuff
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    goToStart();
}

// Sets up the start state
void goToStart() {
    // Reset background position and disable sprites
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    state = START;
    DMANow(3, startPal, PALETTE, startPalLen / 2);
    DMANow(3, startTiles, &CHARBLOCK[0], startTilesLen / 2);
    DMANow(3, startMap, &SCREENBLOCK[16], startMapLen / 2);
}

// Runs every frame of the start state
void start() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToInstructions();
    }
}

// Sets up the instructions state
void goToInstructions() {
    // Reset background position and disable sprites
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    state = INSTRUCTIONS;
    DMANow(3, instructionsPal, PALETTE, instructionsPalLen / 2);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);
    DMANow(3, instructionsMap, &SCREENBLOCK[16], instructionsMapLen / 2);
}

// Runs every frame of the instructions state
void instructions() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initGame(); // Call this here so we avoid resetting stuff when unpausing
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the game state
void goToGame() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; // Enable sprites

    state = GAME;
    DMANow(3, backgroundPal, PALETTE, backgroundPalLen / 2);
    DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen / 2);
    DMANow(3, backgroundMap, &SCREENBLOCK[16], backgroundMapLen / 2);
}

// Runs every frame of the game state
void game() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
        return;
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToWin();
        return;
    }

    updateGame();
    waitForVBlank();
    drawGame();
}

// Sets up the pause state
void goToPause() {
    // Reset background position and disable sprites
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    state = PAUSE;
    DMANow(3, pausedPal, PALETTE, pausedPalLen / 2);
    DMANow(3, pausedTiles, &CHARBLOCK[0], pausedTilesLen / 2);
    DMANow(3, pausedMap, &SCREENBLOCK[16], pausedMapLen / 2);
}

// Runs every frame of the pause state
void pause() {

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
    // Reset background position and disable sprites
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    state = WIN;
    DMANow(3, winPal, PALETTE, winPalLen / 2);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[16], winMapLen / 2);
}

// Runs every frame of the win state
void win() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
    // Reset background position and disable sprites
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    
    state = LOSE;
    DMANow(3, losePal, PALETTE, losePalLen / 2);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[16], loseMapLen / 2);
}

// Runs every frame of the lose state
void lose() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}