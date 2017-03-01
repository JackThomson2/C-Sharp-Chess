#ifndef BITBOARDS
#define BITBOARDS

#include <array>
#include "Defs.cuh"

struct
{
	int pieces[BRD_SQ_NUM];
	U64 pawns[3];

	int KingSq[2];

	int side;
	int enPas;
	int fiftyMove;

	int ply;
	int hisPly;

	int castePerm;

	U64 posKey;

	int pceNum[13];
	int bigPce[3];
	int majorPce[3];
	int minorPce[3];

	S_UNDO history[MAXGAMEMOVES];


	//Piece List
	int pList[13][10];	
} S_BOARD;



	


#endif
