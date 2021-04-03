// Prototypes
void updateGame();
void drawGame();
void initGame();
void initEnemies();
void updateEnemies();
int playerIsWithinRange(int col, int width, int range);
void damagePlayer();
void initProjectiles();
void spawnPlayerBolt();
void updateProjectiles();
void drawProjectiles();

#define BACKGROUND_WIDTH 512
#define NUMBER_OF_ENCOUNTERS 2

// Player Stats
#define PLAYER_MAX_HEALTH 10
#define PLAYER_MAX_MANA 10
#define PLAYER_TICKS_PER_MANA_REGEN 30
#define PLAYER_MANA_BURNOUT 90 // Time period where mana does not regen if you deplete all of your mana

// Bolt
#define MAX_PLAYER_BOLTS 5
#define PLAYER_BOLT_DAMAGE 4
#define BOLT_MANA_COST 2
#define PLAYER_BOLT_SPEED 15

// Walkers
#define MAX_WALKERS 1
#define WALKER_MAX_HEALTH 10
#define WALKER_SPEED 4 // 4 = .4px per tick
#define WALKER_DAMAGE 3
#define WALKER_SWING_RANGE 6
#define WALKER_HIT_RANGE 8
#define WALKER_ATTACK_WINDUP 20 // Time between entering swing range and performing the attack
#define WALKER_ATTACK_COOLDOWN 60 // Time between attacks after the first one

// Shooters
#define MAX_SHOOTERS 5

enum {WALKER, THROWER};

typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;

    int colStep; // Used to support decimal speeds. When it reaches 10, we increment worldCol.

    int state;
    int health;

    int attackStep; // Used to create a delay between attacks

} Walker;

typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int width;
    int height;

    int direction; // -1 = Left, 1 = Right

    int colStep; // Used to support decimal speeds. When it reaches 10, we increment worldCol.

    int active;

} PlayerBolt;

typedef struct {
    int spawnCol; // Where (measured from the left of the screen) to spawn the enemy
    int type; // Uses enemy enum above
} EnemySpawn;

typedef struct {
	int startCol; // Where the left side of the screen is set during this encounter
	int state; // 0 = Not Active, 1 = Active, 2 = Completed
    EnemySpawn startingEnemies[10]; // Enemies to spawn when the encounter starts
    EnemySpawn additionalEnemies[10]; // Additional enemies to spawn as the other enemies are killed
} Encounter;
