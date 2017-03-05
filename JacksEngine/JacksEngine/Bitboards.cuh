#ifndef BITBOARDS
#define BITBOARDS

#include <array>
#include "Defs.cuh"

#define POP(b) PopBit(b)
#define CNT(b) CountBits(b)

extern int PopBit(U64 *b);
extern int CountBits(U64 b);
extern int CountBitsSlow(U64 b);
extern U64 PieceKeys[13][120];
extern U64 SideKey;
extern U64 CastleKeys[16];

extern void InitAllBitBoard();
extern void InitBitMasks();
extern void InitSq120To64();
extern void InitHashKeys();


#endif
