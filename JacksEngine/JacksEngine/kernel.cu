
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <iostream>
#include "UCI.cuh"


__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = threadIdx.x;
	printf("ID : %d\n", threadIdx.x);
    c[i] = a[i] + b[i];
}

int main()
{
	printf("Welcome to Jack's Chess Engine \n");

	UCI::loop();

    return 0;
}


