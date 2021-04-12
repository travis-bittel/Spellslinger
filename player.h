
//{{BLOCK(player)

//======================================================================
//
//	player, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 2 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 64 + 2048 = 2624
//
//	Time-stamp: 2021-03-31, 20:02:09
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PLAYER_H
#define GRIT_PLAYER_H

#define playerTilesLen 64
extern const unsigned short playerTiles[32];

#define playerMapLen 2048
extern const unsigned short playerMap[1024];

#define playerPalLen 512
extern const unsigned short playerPal[256];

#endif // GRIT_PLAYER_H

//}}BLOCK(player)
