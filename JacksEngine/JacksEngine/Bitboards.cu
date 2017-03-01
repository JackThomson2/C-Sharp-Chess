#include "Bitboards.cuh"

int Sq120ToSq64[BRD_SQ_NUM];
int Sq64ToSq120[64];


void TestArrays()
{
	auto index = 0;

	for (index = 0; index < BRD_SQ_NUM; ++index)
	{
		if (index % 10 == 0) printf("\n");
		printf("%5d", Sq120ToSq64[index]);
	}

	printf("\n");
	printf("\n");
	printf("\n");

	for (index = 0; index < 64; ++index)
	{
		if (index % 8 == 0) printf("\n");
		printf("%5d", Sq64ToSq120[index]);
	}
}

void InitSq120To64()
{
	auto index = 0;
	int file = FILE_A;
	int rank = RANK_1;
	int sq = A1;
	auto sq64 = 0;

	for (index = 0; index < BRD_SQ_NUM; ++index)
	{
		Sq120ToSq64[index] = 65;
	}

	for (index = 0; index < 64; ++index)
	{
		Sq64ToSq120[index] = 120;
	}

	for (rank = RANK_1; rank <= RANK_8; ++rank)
	{
		for (file = FILE_A; file <= FILE_H; ++file)
		{
			sq = FR2SQ(file, rank);
			Sq64ToSq120[sq64] = sq;
			Sq120ToSq64[sq] = sq64;
			sq64++;
		}
	}
}

void PrintBitboard(U64 bb)
{
	auto shiftMe = 1ULL;

	auto rank = 0;
	auto file = 0;
	auto sq = 0;
	auto sq64 = 0;

	printf("\n\n");

	for (rank = RANK_8; rank >= RANK_1; --rank)
	{
		for (file = FILE_A; file <= FILE_H; ++file)
		{
			sq = FR2SQ(file, rank); //120 base
			sq64 = SQ64(sq); //64 Based

			if ((shiftMe << sq64) & bb)
				printf("X");
			else
				printf("-");
		}
		printf("\n");
	}
	printf("\n\n");
}
