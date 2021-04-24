
//{{BLOCK(background)

//======================================================================
//
//	background, 2560x256@4, 
//	+ palette 256 entries, not compressed
//	+ 26 tiles (t|f reduced) not compressed
//	+ regular map (in SBBs), not compressed, 320x32 
//	Total size: 512 + 832 + 20480 = 21824
//
//	Time-stamp: 2021-04-24, 01:45:17
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGROUND_H
#define GRIT_BACKGROUND_H

#define backgroundTilesLen 832
extern const unsigned short backgroundTiles[416];

#define backgroundMapLen 20480
extern const unsigned short backgroundMap[10240];

#define backgroundPalLen 512
extern const unsigned short backgroundPal[256];

#endif // GRIT_BACKGROUND_H

//}}BLOCK(background)
