
//{{BLOCK(paused)

//======================================================================
//
//	paused, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 124 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 3968 + 2048 = 6528
//
//	Time-stamp: 2021-03-28, 17:16:53
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSED_H
#define GRIT_PAUSED_H

#define pausedTilesLen 3968
extern const unsigned short pausedTiles[1984];

#define pausedMapLen 2048
extern const unsigned short pausedMap[1024];

#define pausedPalLen 512
extern const unsigned short pausedPal[256];

#endif // GRIT_PAUSED_H

//}}BLOCK(paused)
