
//{{BLOCK(paused)

//======================================================================
//
//	paused, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 501 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 16032 + 2048 = 18592
//
//	Time-stamp: 2021-04-25, 14:13:39
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSED_H
#define GRIT_PAUSED_H

#define pausedTilesLen 16032
extern const unsigned short pausedTiles[8016];

#define pausedMapLen 2048
extern const unsigned short pausedMap[1024];

#define pausedPalLen 512
extern const unsigned short pausedPal[256];

#endif // GRIT_PAUSED_H

//}}BLOCK(paused)
