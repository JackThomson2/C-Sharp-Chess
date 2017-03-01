
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <iostream>
#include "Defs.cuh"
#include "UCI.cuh"

int main()
{
	printf("Welcome to Jack's Chess Engine \n");

	InitSq120To64();
	
	U64 playBitBoard = 0ULL;

	printf("Start: \n");

	PrintBitboard(playBitBoard);

	playBitBoard |= (1ULL << SQ64(D2));

	printf("D2 added: \n\n");
	PrintBitboard(playBitBoard);

	UCI::loop();

    return 0;
}


