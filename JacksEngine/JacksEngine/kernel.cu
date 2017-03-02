#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <iostream>
#include "Defs.cuh"
#include "UCI.cuh"
#include "Bitboards.cuh"
#include <ctime>

int main()
{
	printf("Welcome to Jack's Chess Engine \n");

	InitAllBitBoard();
	
	U64 playBitBoard = 0ULL;

	printf("Start: \n");

	PrintBitboard(playBitBoard);

	playBitBoard |= (1ULL << SQ64(D2));
	playBitBoard |= (1ULL << SQ64(D3));
	playBitBoard |= (1ULL << SQ64(D4));
	playBitBoard |= (1ULL << SQ64(D1));

	printf("D2 added: \n\n");
	PrintBitboard(playBitBoard);
	auto count = CNT(playBitBoard);

	printf("Count: %d \n", count);

	auto index = POP(&playBitBoard);

	PrintBitboard(playBitBoard);
	count = CNT(playBitBoard);

	printf("Count: %d \n", count);


	UCI::loop();

    return 0;
}


