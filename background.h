
//{{BLOCK(background)

//======================================================================
//
//	background, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 497 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 15904 + 2048 = 18464
//
//	Time-stamp: 2021-04-19, 22:45:06
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGROUND_H
#define GRIT_BACKGROUND_H

#define backgroundTilesLen 15904
extern const unsigned short backgroundTiles[7952];

#define backgroundMapLen 2048
extern const unsigned short backgroundMap[1024];

#define backgroundPalLen 512
extern const unsigned short backgroundPal[256];

#endif // GRIT_BACKGROUND_H

//}}BLOCK(background)
