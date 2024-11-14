#include <iostream>
#include <fstream>
#include <vector>
#include <map>

using std::string;

int main(int argc, char *argv[])
{
    string fileName = argv[1];
    std::fstream file;
    std::vector<string> Lines;

    if (fileName.find(".hack") != std::string::npos)
    {
        file.open(argv[1], std::ios::in);

        if (file.is_open())
        {
            string tp;
            while(getline(file, tp))
            { 
                Lines.push_back(tp);
            }
            file.close();

            std::vector<string> hackList;

            std::map<string, string> compTable = {
                {"0101010", "0"},
                {"0111111", "1"},
                {"0111010", "-1"},
                {"0001100", "D"},
                {"0110000", "A"},
                {"1110000", "M"},
                {"0001101", "!D"},
                {"0110001", "!A"},
                {"1110001", "!M"},
                {"0001111", "-D"},
                {"0110011", "-A"},
                {"1110011", "-M"},
                {"0011111", "D+1"},
                {"0110111", "A+1"},
                {"1110111", "M+1"},
                {"0001110", "D-1"},
                {"0110010", "A-1"},
                {"1110010", "M-1"},
                {"0000010", "D+A"},
                {"1000010", "D+M"},
                {"0010011", "D-A"},
                {"1010011", "D-M"},
                {"0000111", "A-D"},
                {"1000111", "M-D"},
                {"0000000", "D&A"},
                {"1000000", "D&M"},
                {"0010101", "D|A"},
                {"1010101", "D|M"}
            };

            std::map<string, string> destTable = {
                {"000", "\0"},
                {"001", "M="},
                {"010", "D="},
                {"011", "DM="},
                {"100", "A="},
                {"101", "AM="},
                {"110", "AD="},
                {"111", "ADM="}
            };

            std::map<string, string> jumpTable = {
                {"000", "\0"},
                {"001", ";JGT"},
                {"010", ";JEQ"},
                {"011", ";JGE"},
                {"100", ";JLT"},
                {"101", ";JNE"},
                {"110", ";JLE"},
                {"111", ";JMP"}
            };

            for (int i = 0; i < Lines.size(); i++)
            {
                string line = Lines[i];

                if(line.size() == 0)
                    continue;


                if(line[0] == '0') {

                    string value = line.substr(1, 15);
                    unsigned long long binVal = stoull(value, 0, 2);
                    string newValue = std::to_string(binVal) + "\n";

                    hackList.push_back("@" + newValue);
                }
                else {
                    string cBit = line.substr(3, 7);
                    string dBit = line.substr(10, 3);
                    string jBit = line.substr(13, 3);

                    hackList.push_back(destTable[dBit] + compTable[cBit] + jumpTable[jBit] + "\n");
                }
            }

            file.open(fileName.replace(fileName.find(".hack"), 5, ".asm"), std::ios::out);

            if(file.is_open())
            {
                for (int i = 0; i < hackList.size(); i++)
                {
                    file << hackList[i];
                }
                file.close();
            }
        }
    }
}
