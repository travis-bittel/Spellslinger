
//{{BLOCK(background)

//======================================================================
//
//	background, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 549 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 17568 + 4096 = 22176
//
//	Time-stamp: 2021-03-31, 15:25:17
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGROUND_H
#define GRIT_BACKGROUND_H

#define backgroundTilesLen 17568
extern const unsigned short backgroundTiles[8784];

#define backgroundMapLen 4096
extern const unsigned short backgroundMap[2048];

#define backgroundPalLen 512
extern const unsigned short backgroundPal[256];

#endif // GRIT_BACKGROUND_H

//}}BLOCK(background)
