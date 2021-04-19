
//{{BLOCK(instBG)

//======================================================================
//
//	instBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 595 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 19040 + 2048 = 21600
//
//	Time-stamp: 2021-04-18, 20:49:17
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTBG_H
#define GRIT_INSTBG_H

#define instBGTilesLen 19040
extern const unsigned short instBGTiles[9520];

#define instBGMapLen 2048
extern const unsigned short instBGMap[1024];

#define instBGPalLen 512
extern const unsigned short instBGPal[256];

#endif // GRIT_INSTBG_H

//}}BLOCK(instBG)
