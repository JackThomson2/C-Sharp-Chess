#include "Defs.cuh"
#include "Bitboards.cuh"
#include <stdio.h>
#include <iostream>

U64 GeneratePosKey(const S_BOARD* pos)
{
	int sq;
	U64 finalKey = 0;
	int piece;

	for (sq = 0; sq < BRD_SQ_NUM; ++sq)
	{
		piece = pos->pieces[sq];
		if (piece != NO_SQ && piece != EMPTY)
		{
			ASSERT(piece >= wP && piece <= bK);
			finalKey ^= PieceKeys[piece][sq];
		}
	}

	if (pos->side == WHITE)
	{
		finalKey ^= SideKey;
	}

	if (pos->enPas != NO_SQ)
	{
		ASSERT(pos->enPas >= 0 && pos->enPas < BRD_SQ_NUM);
		finalKey ^= PieceKeys[EMPTY][pos->enPas];
	}

	ASSERT(pos->castePerm >= 0 && pos->castePerm <= 15);

	finalKey ^= CastleKeys[pos->castePerm];

	return finalKey;
}
