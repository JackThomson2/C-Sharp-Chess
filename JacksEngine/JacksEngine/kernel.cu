
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>
#include <iostream>
#include "UCI.cuh"




int main()
{
	printf("Welcome to Jack's Chess Engine \n");

	UCI::loop();

    return 0;
}


