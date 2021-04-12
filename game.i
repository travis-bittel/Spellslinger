# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct
{
    u16 tileimg[8192];
} charblock;


typedef struct
{
    u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();




typedef struct
{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 159 "myLib.h"
void hideSprites();






typedef struct
{
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 202 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 212 "myLib.h"
typedef volatile struct
{
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 253 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "game.c" 2
# 1 "game.h" 1

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
# 83 "game.h"
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

    int colStep;

    int state;
    int health;

    int attackStep;

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

    int attackStep;

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

    int direction;

    int colStep;

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

    int attackStep;

    int framesInAir;
    int framesOnGround;

    int rowVelocity;
} Wraith;

typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int width;
    int height;

    int direction;

    int colStep;

    int active;

} PlayerBolt;

typedef struct {
    int spawnCol;
    int type;
} EnemySpawn;

typedef struct {
 int startCol;
 int state;
    int numStartingEnemies;
    int numAdditionalEnemies;
    EnemySpawn startingEnemies[10];
    EnemySpawn additionalEnemies[10];
} Encounter;
# 3 "game.c" 2
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 10 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/newlib.h" 2 3
# 11 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4

# 209 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 321 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 143 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3



# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 41 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 5 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/_types.h" 2 3


typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3




# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stdint.h" 2 3 4
# 6 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 350 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 47 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitpro/devkitARM/lib/gcc/arm-none-eabi/9.1.0/include/stddef.h" 1 3 4
# 48 "/opt/devkitpro/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/opt/devkitpro/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 134 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 156 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 188 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 199 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 221 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 260 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 281 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 319 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 336 "/opt/devkitpro/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 4 "game.c" 2
# 1 "spritesheet.h" 1
# 22 "spritesheet.h"

# 22 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetMap[1024];


extern const unsigned short spritesheetPal[256];
# 5 "game.c" 2

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

Encounter encounters[2];

Walker walkers[5];

Shooter shooters[5];

Wraith wraiths[5];

PlayerBolt playerBolts[5];

ShooterProjectile shooterProjectiles[5];

enum {ENEMYSTATE_INACTIVE, ENEMYSTATE_MOVING, ENEMYSTATE_ATTACKING, ENEMYSTATE_IDLE};

enum {ENCOUNTER_NOT_STARTED, ENCOUNTER_ACTIVE, ENCOUNTER_COMPLETE};

int currentEncounter = 0;

int shadowOAMIndex = 0;

int hOff = 0;
int vOff = 95;

int currentPlayerHealth = 10;
int currentPlayerMana = 10;
int playerManaStep = 0;

int playerFacingDirection = 1;

enum {BOLT, SHIELD, LEVITATE};
int spellsUnlocked = 2;

int shieldTicks = 0;

int globalCooldown = 0;
int boltCooldown = 0;
int shieldCooldown = 0;

int levitateManaConsumptionStep = 0;
int levitateHeightStep = 0;

int playerMovementStep = 0;

void startEncounter() {
    player.worldCol = encounters[currentEncounter].startCol + 1;
    hOff = encounters[currentEncounter].startCol;


    for (int i = 0; i < encounters[currentEncounter].numStartingEnemies; i++) {
        EnemySpawn spawn = encounters[currentEncounter].startingEnemies[i];
        spawnEnemy(spawn.type, spawn.spawnCol);
    }
}

void damagePlayer(int amount, int pierceShield) {
    if (!pierceShield && shieldTicks > 0) {

        shadowOAM[1].attr0 = (player.screenRow - 8) | (0 << 14);
        shadowOAM[1].attr1 = player.screenCol | (0 << 14);
        shadowOAM[1].attr2 = ((0) << 12) | ((1)*32 + (5));

        currentPlayerMana += 2;
        if (currentPlayerMana > 10) {
            currentPlayerMana = 10;
        }

        shieldTicks += 15;
        return;
    }
    currentPlayerHealth -= amount;
    if (currentPlayerHealth <= 0) {
        goToLose();
    }
}


int playerIsWithinRange(int col, int width, int range) {

    if (collision(col - range, player.worldRow, width + (2 * range), 10, player.worldCol, player.worldRow, player.width, player.height)) {
        return 0;
    }
    if (col - player.worldCol > 0) {
        return -1;
    } else {
        return 1;
    }
}

int playerIsAtSameElevation(int row, int range) {
    if (abs(player.worldRow - row) <= range) {
        return 0;
    }
    if (player.worldRow - row > 0) {
        return 1;
    } else {
        return -1;
    }
}

int currentEncounterIsCleared() {

    for (int i = 0; i < 5; i++) {
        if (!walkers[i].state == ENEMYSTATE_INACTIVE) {
            return 0;
        }
    }
    return 1;
}



void spawnPlayerBolt() {
    for (int i = 0; i < 5; i++) {
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

void spawnShooterProjectile(int col, int row, int direction, int height, int width) {
    for (int i = 0; i < 5; i++) {
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
            for (int i = 0; i < 5; i++) {
                if (walkers[i].state == ENEMYSTATE_INACTIVE) {
                    walkers[i].state = ENEMYSTATE_MOVING;
                    walkers[i].health = 10;
                    walkers[i].worldCol = encounters[currentEncounter].startCol + col;
                    walkers[i].attackStep = 0;
                    walkers[i].colStep = 0;
                    walkers[i].hide = 0;
                    break;
                }
            }
            break;
        case SHOOTER:
            for (int i = 0; i < 5; i++) {
                if (shooters[i].state == ENEMYSTATE_INACTIVE) {
                    shooters[i].state = ENEMYSTATE_IDLE;
                    shooters[i].health = 15;
                    shooters[i].worldCol = encounters[currentEncounter].startCol + col;
                    shooters[i].attackStep = 0;
                    shooters[i].hide = 0;
                    shooters[i].facingDirection = 1;
                    break;
                }
            }
            break;
        case WRAITH:
            for (int i = 0; i < 5; i++) {
                if (wraiths[i].state == ENEMYSTATE_INACTIVE) {
                    wraiths[i].state = ENEMYSTATE_IDLE;
                    wraiths[i].health = 15;
                    wraiths[i].worldCol = encounters[currentEncounter].startCol + col;
                    wraiths[i].attackStep = 0;
                    wraiths[i].hide = 0;
                    wraiths[i].facingDirection = 1;
                    break;
                }
            }
            break;
    }
}



void initGame() {
    initEnemies();
    initProjectiles();

    encounters[0].startCol = 0;
    encounters[0].state = 1;
    encounters[0].startingEnemies[0].spawnCol = 80;
    encounters[0].startingEnemies[0].type = WRAITH;
    encounters[0].numStartingEnemies = 1;

    encounters[1].startCol = 240;
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
    player.worldRow = 225 - player.height;
    currentPlayerHealth = 10;
    currentPlayerMana = 10;

    startEncounter();
}

void initEnemies() {

    for (int i = 0; i < 5; i++) {
        walkers[i].health = 10;
        walkers[i].state = ENEMYSTATE_INACTIVE;
        walkers[i].width = 8;
        walkers[i].height = 16;
        walkers[i].worldCol = 200;
        walkers[i].worldRow = 225 - walkers[i].height;
        walkers[i].attackStep = 0;
        walkers[i].colStep = 0;
    }

    for (int i = 0; i < 5; i++) {
        shooters[i].health = 15;
        shooters[i].state = ENEMYSTATE_INACTIVE;
        shooters[i].width = 8;
        shooters[i].height = 16;
        shooters[i].worldCol = 200;
        shooters[i].worldRow = 225 - shooters[i].height;
        shooters[i].attackStep = 0;
    }

    for (int i = 0; i < 5; i++) {
        wraiths[i].health = 15;
        wraiths[i].state = ENEMYSTATE_INACTIVE;
        wraiths[i].width = 8;
        wraiths[i].height = 16;
        wraiths[i].worldCol = 200;
        wraiths[i].worldRow = 225 - wraiths[i].height;
        wraiths[i].attackStep = 0;
    }
}

void initProjectiles() {

    for (int i = 0; i < 5; i++) {
        playerBolts[i].active = 0;
        playerBolts[i].height = 8;
        playerBolts[i].width = 8;
        playerBolts[i].colStep = 0;
    }

    for (int i = 0; i < 5; i++) {
        shooterProjectiles[i].active = 0;
        shooterProjectiles[i].height = 8;
        shooterProjectiles[i].width = 8;
        shooterProjectiles[i].colStep = 0;
    }
}



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
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        playerFacingDirection = 1;

        if (player.worldCol + player.width + 1 < encounters[currentEncounter].startCol + 240) {
            if (playerMovementStep < 0) {
                playerMovementStep = 0;
            }
            if (player.worldRow + player.height < 225) {
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

                currentEncounter++;
                if (currentEncounter >= 2) {
                    goToWin();
                } else {
                    startEncounter();
                }
            }
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
        playerFacingDirection = -1;


        if (player.worldCol - 1 >= encounters[currentEncounter].startCol) {
            if (playerMovementStep > 0) {
                playerMovementStep = 0;
            }
            if (player.worldRow + player.height < 225) {
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


    if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0)))) && globalCooldown <= 0 && boltCooldown <= 0 && currentPlayerMana > 0) {
        if (currentPlayerMana <= 0) {
            return;
        }
        spawnPlayerBolt();
        currentPlayerMana -= 2;
        globalCooldown = 20;
        boltCooldown = 0;
        if (currentPlayerMana <= 0) {
            playerManaStep -= 45;
        }
    }
    if ((!(~(oldButtons) & ((1 << 1))) && (~buttons & ((1 << 1)))) && spellsUnlocked >= SHIELD && globalCooldown <= 0 && shieldCooldown <= 0 && currentPlayerMana > 0) {
        shieldTicks = 20;
        shadowOAM[1].attr2 = ((0) << 12) | ((1)*32 + (4));

        currentPlayerMana -= 0;
        globalCooldown = 20;
        shieldCooldown = 60;
        if (currentPlayerMana <= 0) {
            playerManaStep -= 45;
        }
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 6))) && spellsUnlocked >= LEVITATE && currentPlayerMana > 0) {
        if (levitateHeightStep < 0) {
            levitateHeightStep = 0;
        }
        playerManaStep = 0;
        if (player.worldRow + player.height > 225 - 12) {
            levitateHeightStep++;
        }
        if (levitateHeightStep >= 2) {
            player.worldRow--;
            levitateHeightStep = 0;
        }
        levitateManaConsumptionStep++;
        if (levitateManaConsumptionStep >= 30) {
            currentPlayerMana--;
            levitateManaConsumptionStep = 0;
        }
        if (currentPlayerMana <= 0) {
            playerManaStep -= 45;
        }
    } else {
        if (player.worldRow + player.height < 225) {
            levitateHeightStep--;
            if (levitateHeightStep < 0 && abs(levitateHeightStep) >= 3) {
                player.worldRow++;
                levitateHeightStep = 0;
            }
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 7))) && spellsUnlocked >= LEVITATE && player.worldRow + player.height < 225) {
        levitateHeightStep -= 3;
        if (levitateHeightStep < 0 && abs(levitateHeightStep) >= 3) {
            player.worldRow++;
            levitateHeightStep = 0;
        }
    }

    updateEnemies();
    updateProjectiles();

    player.screenCol = player.worldCol - hOff;
    player.screenRow = player.worldRow - vOff;

    if (currentPlayerMana < 10 || playerManaStep < 0) {
        playerManaStep++;
        if (playerManaStep >= 30) {
            currentPlayerMana++;
            playerManaStep = 0;
        }
    }
}

void updateEnemies() {

    for (int i = 0; i < 5; i++) {
        int temp = playerIsWithinRange(walkers[i].worldCol, walkers[i].width, 6);
        switch (walkers[i].state) {
            case ENEMYSTATE_ATTACKING:
                if (temp != 0) {
                    walkers[i].state = ENEMYSTATE_MOVING;
                } else {
                    walkers[i].attackStep++;
                    if (walkers[i].attackStep > 20) {
                        damagePlayer(3, 0);
                        walkers[i].attackStep = 0;
                    }
                }
                break;
            case ENEMYSTATE_MOVING:

                if (temp == 0) {
                    walkers[i].worldRow = 225 - walkers[i].height - 2;
                    walkers[i].state = ENEMYSTATE_ATTACKING;
                    walkers[i].attackStep = -10;

                } else if (temp == -1) {
                    walkers[i].worldRow = 225 - walkers[i].height;
                    walkers[i].colStep -= 4;
                    if (walkers[i].colStep <= 0) {
                        walkers[i].worldCol--;
                        walkers[i].colStep += 10;
                    }
                } else {
                    walkers[i].worldRow = 217;
                    walkers[i].colStep += 4;
                    if (walkers[i].colStep >= 10) {
                        walkers[i].worldCol++;
                        walkers[i].colStep -= 10;
                    }
                }
                break;
        }
    }

    for (int i = 0; i < 5; i++) {
        switch (shooters[i].state) {
            case ENEMYSTATE_ATTACKING:
                shooters[i].attackStep++;
                shooters[i].framesInAttackState++;
                shooters[i].facingDirection = playerIsWithinRange(shooters[i].worldCol, 0, 0);
                if (shooters[i].attackStep >= 60) {
                    spawnShooterProjectile(shooters[i].worldCol, shooters[i].worldRow, shooters[i].facingDirection, shooters[i].height, shooters[i].width);
                    shooters[i].attackStep = 0;
                }
                if (shooters[i].framesInAttackState >= 240) {
                    shooters[i].framesInAttackState = 0;
                    shooters[i].state = ENEMYSTATE_IDLE;
                }
                break;
            case ENEMYSTATE_IDLE:
                shooters[i].framesInIdleState++;
                if (shooters[i].framesInIdleState >= 120) {
                    shooters[i].framesInIdleState = 0;
                    shooters[i].state = ENEMYSTATE_ATTACKING;
                    shooters[i].facingDirection = playerIsWithinRange(shooters[i].worldCol, 0, 0);
                    spawnShooterProjectile(shooters[i].worldCol, shooters[i].worldRow, shooters[i].facingDirection, shooters[i].height, shooters[i].width);
                }
                break;
        }
    }

    for (int i = 0; i < 5; i++) {
        if (wraiths[i].state != ENEMYSTATE_INACTIVE) {
            wraiths[i].attackStep++;
            shooters[i].framesInAttackState++;
            wraiths[i].facingDirection = playerIsWithinRange(wraiths[i].worldCol, 0, 0);


            if (wraiths[i].attackStep >= 60 && playerIsAtSameElevation(wraiths[i].worldRow, 4) == 0) {
                spawnShooterProjectile(wraiths[i].worldCol, wraiths[i].worldRow, wraiths[i].facingDirection, wraiths[i].height, wraiths[i].width);
                wraiths[i].attackStep = 0;
            }


            if (wraiths[i].worldRow >= 225 - wraiths[i].height) {
                wraiths[i].framesOnGround++;
                if (wraiths[i].framesOnGround >= 120) {
                    wraiths[i].framesOnGround = 0;
                    wraiths[i].rowVelocity = 1;
                }
            } else if (wraiths[i].worldRow + wraiths[i].height <= 225 - 10) {
                wraiths[i].framesInAir++;
                if (wraiths[i].framesInAir >= 120) {
                    wraiths[i].framesInAir = 0;
                    wraiths[i].rowVelocity = -1;
                }
            }
            wraiths[i].rowStep += 4 * wraiths[i].rowVelocity;
            if (wraiths[i].rowStep <= -10) {
                wraiths[i].rowStep += 10;
                wraiths[i].worldRow++;
                if (wraiths[i].worldRow + wraiths[i].height >= 225) {
                    wraiths[i].rowStep = 0;
                    wraiths[i].rowVelocity = 0;
                }
            }
            if (wraiths[i].rowStep >= 10) {
                wraiths[i].rowStep -= 10;
                wraiths[i].worldRow--;
                if (wraiths[i].worldRow + wraiths[i].height <= 225 - 10) {
                    wraiths[i].rowStep = 0;
                    wraiths[i].rowVelocity = 0;
                }
            }
        }
    }
}

void updateProjectiles() {

    for (int i = 0; i < 5; i++) {
        if (playerBolts[i].active) {
            playerBolts[i].colStep += playerBolts[i].direction * 15;
            while (playerBolts[i].colStep >= 10 && playerBolts[i].direction == 1) {
                playerBolts[i].worldCol++;
                playerBolts[i].colStep -= 10;
            }
            while (playerBolts[i].colStep <= -10 && playerBolts[i].direction == -1) {
                playerBolts[i].worldCol--;
                playerBolts[i].colStep += 10;
            }


            for (int j = 0; j < 5; j++) {
                if (walkers[j].state != ENEMYSTATE_INACTIVE && collision(playerBolts[i].worldCol, playerBolts[i].worldRow, playerBolts[i].width,
                        playerBolts[i].height, walkers[j].worldCol, walkers[j].worldRow, walkers[j].width,
                        walkers[j].height)) {
                    walkers[j].health -= 4;
                    playerBolts[i].active = 0;
                    if (walkers[j].health <= 0) {
                        walkers[j].state = ENEMYSTATE_INACTIVE;
                        encounters[currentEncounter].state = 1 + currentEncounterIsCleared();
                    }
                }
            }

            for (int j = 0; j < 5; j++) {
                if (shooters[j].state == ENEMYSTATE_ATTACKING && collision(playerBolts[i].worldCol, playerBolts[i].worldRow, playerBolts[i].width,
                        playerBolts[i].height, shooters[j].worldCol, shooters[j].worldRow, shooters[j].width,
                        shooters[j].height)) {
                    shooters[j].health -= 4;
                    playerBolts[i].active = 0;
                    if (shooters[j].health <= 0) {
                        shooters[j].state = ENEMYSTATE_INACTIVE;
                        encounters[currentEncounter].state = 1 + currentEncounterIsCleared();
                    }
                }
            }

            for (int j = 0; j < 5; j++) {
                if (wraiths[j].state != ENEMYSTATE_INACTIVE && collision(playerBolts[i].worldCol, playerBolts[i].worldRow, playerBolts[i].width,
                        playerBolts[i].height, wraiths[j].worldCol, wraiths[j].worldRow, wraiths[j].width,
                        wraiths[j].height)) {
                    wraiths[j].health -= 4;
                    playerBolts[i].active = 0;
                    if (wraiths[j].health <= 0) {
                        wraiths[j].state = ENEMYSTATE_INACTIVE;
                        encounters[currentEncounter].state = 1 + currentEncounterIsCleared();
                    }
                }
            }

            playerBolts[i].screenCol = playerBolts[i].worldCol - hOff;
            playerBolts[i].screenRow = playerBolts[i].worldRow - vOff;
            if (playerBolts[i].screenCol > 240 || playerBolts[i].screenCol < 0) {
                playerBolts[i].active = 0;
            }
        }
    }

    for (int i = 0; i < 5; i++) {
        if (shooterProjectiles[i].active) {
            shooterProjectiles[i].colStep += shooterProjectiles[i].direction * 8;
            while (shooterProjectiles[i].colStep >= 10 && shooterProjectiles[i].direction == 1) {
                shooterProjectiles[i].worldCol++;
                shooterProjectiles[i].colStep -= 10;
            }
            while (shooterProjectiles[i].colStep <= -10 && shooterProjectiles[i].direction == -1) {
                shooterProjectiles[i].worldCol--;
                shooterProjectiles[i].colStep += 10;
            }


            if (collision(shooterProjectiles[i].worldCol, shooterProjectiles[i].worldRow, shooterProjectiles[i].width, shooterProjectiles[i].height,
                    player.worldCol, player.worldRow, player.width, player.height)) {
                damagePlayer(3, 0);
                shooterProjectiles[i].active = 0;
            }
            shooterProjectiles[i].screenCol = shooterProjectiles[i].worldCol - hOff;
            shooterProjectiles[i].screenRow = shooterProjectiles[i].worldRow - vOff;
            if (shooterProjectiles[i].screenCol > 240 || shooterProjectiles[i].screenCol < 0) {
                shooterProjectiles[i].active = 0;
            }
        }
    }
}



void drawGame() {
    if (state != GAME) {
        return;
    }

    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000012) = vOff;


    shadowOAM[0].attr0 = player.screenRow | (2 << 14);
    shadowOAM[0].attr1 = player.screenCol | (0 << 14);
    shadowOAM[0].attr2 = ((0) << 12) | ((0)*32 + (1));


    if (shieldTicks > 0) {
        shadowOAM[1].attr0 = (player.screenRow - 10) | (0 << 14);
        shadowOAM[1].attr1 = player.screenCol | (0 << 14);
    } else {
        shadowOAM[1].attr0 |= (2 << 8);
    }

    shadowOAMIndex = 2;

    drawEnemies();
    drawProjectiles();
    drawUI();

    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 512);
}

void drawEnemies() {

    for (int i = 0; i < 5; i++) {
        if (walkers[i].state != ENEMYSTATE_INACTIVE) {
            walkers[i].screenCol = walkers[i].worldCol - hOff;
            walkers[i].screenRow = walkers[i].worldRow - vOff;

            shadowOAM[shadowOAMIndex].attr0 = walkers[i].screenRow | (2 << 14);
            shadowOAM[shadowOAMIndex].attr1 = walkers[i].screenCol | (0 << 14);
            shadowOAM[shadowOAMIndex].attr2 = ((0) << 12) | ((0)*32 + (2));
        } else {
            shadowOAM[shadowOAMIndex].attr0 = (2 << 8);
        }
        shadowOAMIndex++;
    }


    for (int i = 0; i < 5; i++) {
        if (shooters[i].state != ENEMYSTATE_INACTIVE) {
            shooters[i].screenCol = shooters[i].worldCol - hOff;
            shooters[i].screenRow = shooters[i].worldRow - vOff;

            shadowOAM[shadowOAMIndex].attr0 = shooters[i].screenRow | (2 << 14);
            shadowOAM[shadowOAMIndex].attr1 = shooters[i].screenCol | (0 << 14);
            if (shooters[i].state == ENEMYSTATE_ATTACKING) {
                shadowOAM[shadowOAMIndex].attr2 = ((0) << 12) | ((0)*32 + (7));
            } else {
                shadowOAM[shadowOAMIndex].attr2 = ((0) << 12) | ((0)*32 + (6));
            }
        } else {
            shadowOAM[shadowOAMIndex].attr0 = (2 << 8);
        }
        shadowOAMIndex++;
    }


    for (int i = 0; i < 5; i++) {
        if (wraiths[i].state != ENEMYSTATE_INACTIVE) {
            wraiths[i].screenCol = wraiths[i].worldCol - hOff;
            wraiths[i].screenRow = wraiths[i].worldRow - vOff;

            shadowOAM[shadowOAMIndex].attr0 = wraiths[i].screenRow | (2 << 14);
            shadowOAM[shadowOAMIndex].attr1 = wraiths[i].screenCol | (0 << 14);
            if (wraiths[i].state == ENEMYSTATE_ATTACKING) {
                shadowOAM[shadowOAMIndex].attr2 = ((0) << 12) | ((0)*32 + (7));
            } else {
                shadowOAM[shadowOAMIndex].attr2 = ((0) << 12) | ((0)*32 + (6));
            }
        } else {
            shadowOAM[shadowOAMIndex].attr0 = (2 << 8);
        }
        shadowOAMIndex++;
    }
}

void drawProjectiles() {

    for (int i = 0; i < 5; i++) {
        if (playerBolts[i].active) {
            shadowOAM[shadowOAMIndex].attr0 = playerBolts[i].screenRow | (0 << 14);
            shadowOAM[shadowOAMIndex].attr1 = playerBolts[i].screenCol | (0 << 14);
            shadowOAM[shadowOAMIndex].attr2 = ((0) << 12) | ((0)*32 + (3));
        } else {
            shadowOAM[shadowOAMIndex].attr0 = (2 << 8);
        }
        shadowOAMIndex++;
    }

    for (int i = 0; i < 5; i++) {
        if (shooterProjectiles[i].active) {
            shadowOAM[shadowOAMIndex].attr0 = shooterProjectiles[i].screenRow | (0 << 14);
            shadowOAM[shadowOAMIndex].attr1 = shooterProjectiles[i].screenCol | (0 << 14);
            shadowOAM[shadowOAMIndex].attr2 = ((0) << 12) | ((1)*32 + (3));
        } else {
            shadowOAM[shadowOAMIndex].attr0 = (2 << 8);
        }
        shadowOAMIndex++;
    }
}

void drawUI() {

    int col = 4;
    int row = 4;
    for (int i = 0; i < 10; i++) {
        if (i < currentPlayerHealth) {
            shadowOAM[shadowOAMIndex].attr0 = row | (0 << 14);
            shadowOAM[shadowOAMIndex].attr1 = col | (0 << 14);
            shadowOAM[shadowOAMIndex].attr2 = ((0) << 12) | ((0)*32 + (5));
        } else {
            shadowOAM[shadowOAMIndex].attr0 |= (2 << 8);
        }
        shadowOAMIndex++;
        col += 7;
    }


    col = 240 - 7 * 10 - 4;
    for (int i = 0; i < 10; i++) {
        if (i < currentPlayerMana) {
            shadowOAM[shadowOAMIndex].attr0 = row | (0 << 14);
            shadowOAM[shadowOAMIndex].attr1 = col | (0 << 14);
            shadowOAM[shadowOAMIndex].attr2 = ((0) << 12) | ((0)*32 + (4));
        } else {
            shadowOAM[shadowOAMIndex].attr0 |= (2 << 8);
        }
        shadowOAMIndex++;
        col += 7;
    }
}
