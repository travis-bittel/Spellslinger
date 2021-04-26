/*
  Milestone 4
---------------
- All instructions are specified on the various instructions screens in the game!
- All sprites and background are implemented!
    - This includes the animated sprites and XL background requirements
- Lots of bugs have been found and squashed!

- ...I didn't have time to work on sound yet :(
- The final enemy type I was going to implement was annoying to deal with and a pain to
  implement as well, so I scrapped it.
- The final boss is fully planned out and shouldn't be hard to implement, but as of right
  now I have a placeholder encounter in the final spot just in case I can't get it working.
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
#include "bolt_instructions.h"
#include "levitate_instructions.h"
#include "shield_instructions.h"
#include "walker_instructions.h"
#include "shooter_instructions.h"
#include "wraith_instructions.h"

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
void goToNewSpell(int spell);
void newSpell();
void goToNewEnemy(int enemy);
void newEnemy();

// States
enum
{
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE,
    NEW_SPELL,
    NEW_ENEMY
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
            case NEW_SPELL:
                newSpell();
                break;
            case NEW_ENEMY:
                newEnemy();
                break;
        }
    }
}

// Sets up GBA
void initialize()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_4BPP | BG_SIZE_SMALL;

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
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_4BPP | BG_SIZE_SMALL;

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
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_4BPP | BG_SIZE_SMALL;

    state = INSTRUCTIONS;
    DMANow(3, instructionsPal, PALETTE, instructionsPalLen / 2);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);
    DMANow(3, instructionsMap, &SCREENBLOCK[16], instructionsMapLen / 2);
}

// Runs every frame of the instructions state
void instructions() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initGame(); // Call this here so we avoid resetting stuff when unpausing
        //goToGame();
        goToNewSpell(0);
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToNewSpell(int spell) {
    // Reset background position and disable sprites
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_4BPP | BG_SIZE_SMALL;

    state = NEW_SPELL;

    switch (spell) {
        case 0:
            DMANow(3, bolt_instructionsPal, PALETTE, bolt_instructionsPalLen / 2);
            DMANow(3, bolt_instructionsTiles, &CHARBLOCK[0], bolt_instructionsTilesLen / 2);
            DMANow(3, bolt_instructionsMap, &SCREENBLOCK[16], bolt_instructionsMapLen / 2);
            break;
        case 1:
            DMANow(3, shield_instructionsPal, PALETTE, shield_instructionsPalLen / 2);
            DMANow(3, shield_instructionsTiles, &CHARBLOCK[0], shield_instructionsTilesLen / 2);
            DMANow(3, shield_instructionsMap, &SCREENBLOCK[16], shield_instructionsMapLen / 2);
            break;
        case 2:
            DMANow(3, levitate_instructionsPal, PALETTE, levitate_instructionsPalLen / 2);
            DMANow(3, levitate_instructionsTiles, &CHARBLOCK[0], levitate_instructionsTilesLen / 2);
            DMANow(3, levitate_instructionsMap, &SCREENBLOCK[16], levitate_instructionsMapLen / 2);
            break;
        default:
            DMANow(3, bolt_instructionsPal, PALETTE, bolt_instructionsPalLen / 2);
            DMANow(3, bolt_instructionsTiles, &CHARBLOCK[0], bolt_instructionsTilesLen / 2);
            DMANow(3, bolt_instructionsMap, &SCREENBLOCK[16], bolt_instructionsMapLen / 2);
            break;
    }
}

void newSpell() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        return;
    }
}

void goToNewEnemy(int enemy) {
    // Reset background position and disable sprites
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_4BPP | BG_SIZE_SMALL;

    state = NEW_ENEMY;

    switch (enemy) {
        case 0:
            DMANow(3, walker_instructionsPal, PALETTE, walker_instructionsPalLen / 2);
            DMANow(3, walker_instructionsTiles, &CHARBLOCK[0], walker_instructionsTilesLen / 2);
            DMANow(3, walker_instructionsMap, &SCREENBLOCK[16], walker_instructionsMapLen / 2);
            break;
        case 1:
            DMANow(3, shooter_instructionsPal, PALETTE, shooter_instructionsPalLen / 2);
            DMANow(3, shooter_instructionsTiles, &CHARBLOCK[0], shooter_instructionsTilesLen / 2);
            DMANow(3, shooter_instructionsMap, &SCREENBLOCK[16], shooter_instructionsMapLen / 2);
            break;
        case 2:
            DMANow(3, wraith_instructionsPal, PALETTE, wraith_instructionsPalLen / 2);
            DMANow(3, wraith_instructionsTiles, &CHARBLOCK[0], wraith_instructionsTilesLen / 2);
            DMANow(3, wraith_instructionsMap, &SCREENBLOCK[16], wraith_instructionsMapLen / 2);
            break;
        default:
            DMANow(3, bolt_instructionsPal, PALETTE, bolt_instructionsPalLen / 2);
            DMANow(3, bolt_instructionsTiles, &CHARBLOCK[0], bolt_instructionsTilesLen / 2);
            DMANow(3, bolt_instructionsMap, &SCREENBLOCK[16], bolt_instructionsMapLen / 2);
            break;
    }
}

void newEnemy() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        return;
    }
}

// Sets up the game state
void goToGame() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE; // Enable sprites
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_4BPP | BG_SIZE_SMALL;

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
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_4BPP | BG_SIZE_SMALL;

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
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_4BPP | BG_SIZE_SMALL;

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
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_4BPP | BG_SIZE_SMALL;
    
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