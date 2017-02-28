#include "UCI.cuh"
#include <ostream>
#include <iostream>
#include <string>
#include <sstream>
#include <device_launch_parameters.h>
#include <cuda_runtime_api.h>

using namespace std;

__global__ void testIndex()
{
	printf("Block id : %d Thread id : %d\n", blockIdx.x, threadIdx.x);
}

void UCI::loop()
{
	string token, cmd;
	do
	{
		if (!getline(cin, cmd)) // Block here waiting for input or EOF
			cmd = "quit";

		istringstream is(cmd);

		token.clear(); // getline() could return empty or blank line
		is >> skipws >> token;

		// The GUI sends 'ponderhit' to tell us to ponder on the same move the
		// opponent has played. In case Signals.stopOnPonderhit is set we are
		// waiting for 'ponderhit' to stop the search (for instance because we
		// already ran out of time), otherwise we should continue searching but
		// switching from pondering to normal search.
		if (token == "quit"
			|| token == "stop"
			|| (token == "ponderhit"))
		{
			cout << "Im out of here";
		}

		else if (token == "uci")
			cout << "id name " << "Jacks engine"
			<< "\nuciok" << endl;

		else if (token == "ucinewgame")
		{
			//Search::clear();
			//Tablebases::init(Options["SyzygyPath"]);
			//Time.availableNodes = 0;
		}
		else if (token == "testCudas")
		{
			testIndex <<< 1, 1024 >>>();
			cudaDeviceSynchronize();
		}
		else if (token == "isready") cout << "readyok" << endl;
		else if (token == "go") {
			//	go(pos, is);
			cout << "Lets roll" << endl;
		}

		else
			cout << "Unknown command: " << cmd << endl;
	} while (token != "quit");
}
