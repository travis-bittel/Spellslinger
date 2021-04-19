
//{{BLOCK(walker_instructions)

//======================================================================
//
//	walker_instructions, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 556 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 17792 + 2048 = 20352
//
//	Time-stamp: 2021-04-18, 21:05:59
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WALKER_INSTRUCTIONS_H
#define GRIT_WALKER_INSTRUCTIONS_H

#define walker_instructionsTilesLen 17792
extern const unsigned short walker_instructionsTiles[8896];

#define walker_instructionsMapLen 2048
extern const unsigned short walker_instructionsMap[1024];

#define walker_instructionsPalLen 512
extern const unsigned short walker_instructionsPal[256];

#endif // GRIT_WALKER_INSTRUCTIONS_H

//}}BLOCK(walker_instructions)
