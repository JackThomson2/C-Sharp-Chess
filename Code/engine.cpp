// engine.cpp : Defines the entry point for the console application.
//

#include <iostream>

using namespace std;

int main(int argc, char* argv[]) 
{
	cout << "Welcome to Jacks Chess Engine" << endl;
	UCI::loop(argc, argv);

    return 0;
}