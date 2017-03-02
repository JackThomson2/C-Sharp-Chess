#include "Bitboards.cuh"

int Sq120ToSq64[BRD_SQ_NUM];
int Sq64ToSq120[64];

U64 SetMask[64];
U64 ClearMask[64];

void InitAllBitBoard()
{
	InitBitMasks();
	InitSq120To64();
}

void InitBitMasks()
{
	auto index = 0;

	for (index = 0; index < 64; index++)
	{
		SetMask[index] = 0ULL;
		ClearMask[index] = 0ULL;
	}

	for (index = 0; index < 64; index++)
	{
		SetMask[index] |= (1ULL << index);
		ClearMask[index] = ~SetMask[index];
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


const int BitTable[64] = {
	63, 30, 3, 32, 25, 41, 22, 33, 15, 50, 42, 13, 11, 53, 19, 34, 61, 29, 2,
	51, 21, 43, 45, 10, 18, 47, 1, 54, 9, 57, 0, 35, 62, 31, 40, 4, 49, 5, 52,
	26, 60, 6, 23, 44, 46, 27, 56, 16, 7, 39, 48, 24, 59, 14, 12, 55, 38, 28,
	58, 20, 37, 17, 36, 8
};

int PopBit(U64 *bb) {
	
	auto b = *bb ^ (*bb - 1);
	auto fold = unsigned((b & 0xffffffff) ^ (b >> 32));
	*bb &= (*bb - 1);
	return BitTable[(fold * 0x783a9b23) >> 26];
}

int CountBits(U64 b) {
	return __popcnt(b);
}

int CountBitsSlow(U64 b) {
	int r;
	for (r = 0; b; r++, b &= b - 1);
	return r;
}

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
