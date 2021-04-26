
//{{BLOCK(start)

//======================================================================
//
//	start, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 532 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 17024 + 2048 = 19584
//
//	Time-stamp: 2021-04-25, 14:42:07
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_START_H
#define GRIT_START_H

#define startTilesLen 17024
extern const unsigned short startTiles[8512];

#define startMapLen 2048
extern const unsigned short startMap[1024];

#define startPalLen 512
extern const unsigned short startPal[256];

#endif // GRIT_START_H

//}}BLOCK(start)
