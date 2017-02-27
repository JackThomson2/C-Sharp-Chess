// engine.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include <iostream>
#include "UCI.h"
using namespace std;

int main(int argc, char* argv[]) 
{
	int x;

	cout << "Welcome to Jacks Chess Engine" << endl;
	UCI::loop(argc, argv);

    return 0;
}


