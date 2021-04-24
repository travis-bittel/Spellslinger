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
void spawnEnemy();
int currentEncounterIsCleared();
void startEncounter();
void drawEnemies();
void drawUI();
int playerIsAtSameElevation(int row, int range);
void spawnShooterProjectile(int col, int row, int direction, int height, int width);

#define BACKGROUND_WIDTH 512
#define NUMBER_OF_ENCOUNTERS 7
#define GROUND_LEVEL 224

// Player Stats
#define PLAYER_MAX_HEALTH 10
#define PLAYER_MAX_MANA 10
#define PLAYER_TICKS_PER_MANA_REGEN 30
#define PLAYER_MANA_BURNOUT 45 // Time period where mana does not regen if you deplete all of your mana
#define GLOBAL_CAST_COOLDOWN 10

// Bolt
#define MAX_PLAYER_BOLTS 5
#define PLAYER_BOLT_DAMAGE 5
#define BOLT_MANA_COST 2
#define PLAYER_BOLT_SPEED 20
#define BOLT_COOLDOWN 0

// Shield
#define SHIELD_MANA_COST_BASE 25// /1000
#define SHIELD_MANA_COST_GROWTH 4 // /1000
#define SHIELD_MANA_REFUND 1
#define SHIELD_COOLDOWN 20

// Levitate
#define LEVITATE_STEPS_PER_MOVE_UP 2
#define LEVITATE_STEPS_PER_MOVE_DOWN 3
#define LEVITATE_STEPS_PER_MANA_DRAIN 50
#define LEVITATE_FALL_ACCELERATED_RATE 3
#define LEVITATE_MAX_HEIGHT 12

// Walkers
#define MAX_WALKERS 5
#define WALKER_MAX_HEALTH 10
#define WALKER_SPEED 4 // 4 = .4px per tick
#define WALKER_DAMAGE 3
#define WALKER_SWING_RANGE 6
#define WALKER_HIT_RANGE 8
#define WALKER_ATTACK_WINDUP 10 // Time between entering swing range and performing the attack
#define WALKER_ATTACK_COOLDOWN 20 // Time between attacks after the first one

// Shooters
#define MAX_SHOOTERS 5
#define SHOOTER_MAX_HEALTH 15
#define SHOOTER_DAMAGE 3
#define SHOOTER_ATTACK_COOLDOWN 60
#define MAX_SHOOTER_PROJECTILES 5
#define SHOOTER_BOLT_SPEED 8
#define SHOOTER_ATTACK_STATE_DURATION 240
#define SHOOTER_IDLE_STATE_DURATION 120

// Wraiths
#define MAX_WRAITHS 5
#define WRAITH_MAX_HEALTH 15
#define WRAITH_DAMAGE 3
#define WRAITH_ATTACK_COOLDOWN 90
#define WRAITH_AIRBORNE_DURATION 120
#define WRAITH_GROUND_DURATION 120
#define WRAITH_SPEED 4
#define WRAITH_MAX_HEIGHT 10

enum {WALKER, SHOOTER, WRAITH};

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
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;

    int state;
    int health;

    int facingDirection;

    int attackStep; // Used to create a delay between attacks

    int framesInAttackState;
    int framesInIdleState;
} Shooter;

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

} ShooterProjectile;

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

    int state;
    int health;

    int rowStep;

    int facingDirection;

    int attackStep; // Used to create a delay between attacks

    int framesInAir;
    int framesOnGround;

    int rowVelocity; // 1 means moving up, -1 means moving down
} Wraith;

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
    int numStartingEnemies;
    int numAdditionalEnemies;
    EnemySpawn startingEnemies[10]; // Enemies to spawn when the encounter starts
    EnemySpawn additionalEnemies[10]; // Additional enemies to spawn as the other enemies are killed
} Encounter;
