#include "stdafx.h"
#include "UCI.h"
#include <iostream>
#include <sstream>

using namespace std;

void UCI::loop(int argc, char* argv[])
{
	string token, cmd;
	do
	{
		if (argc == 1 && !getline(cin, cmd)) // Block here waiting for input or EOF
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
		else if (token == "isready") cout << "readyok" << endl;
		else if (token == "go") {
		//	go(pos, is);
			cout << "Lets roll" << endl;
		}

		else
			cout << "Unknown command: " << cmd << endl;
	}
	while (token != "quit" && argc == 1); // Passed args have one-shot behaviour
}
