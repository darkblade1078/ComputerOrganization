using System;
using System.IO;

namespace Disassembler
{
   class Program
   {
      static void Main(string[] args)
      {

         if (args[0].Contains(".hack"))
         {
            if (File.Exists(args[0]))
            {
               string[] Lines = File.ReadLines(args[0]).ToArray();

               List<string> hackList = new List<string>();

               Dictionary<string, string> compTable =
               new Dictionary<string, string>()
               {
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


               Dictionary<string, string> destTable =
               new Dictionary<string, string>()
               {
                  {"000", ""},
                  {"001", "M="},
                  {"010", "D="},
                  {"011", "DM="},
                  {"100", "A="},
                  {"101", "AM="},
                  {"110", "AD="},
                  {"111", "ADM="}
               };

               Dictionary<string, string> jumpTable =
               new Dictionary<string, string>()
               {
                  {"000", ""},
                  {"001", ";JGT"},
                  {"010", ";JEQ"},
                  {"011", ";JGE"},
                  {"100", ";JLT"},
                  {"101", ";JNE"},
                  {"110", ";JLE"},
                  {"111", ";JMP"}
               };

               foreach (string line in Lines)
               {
                  if(line.Length == 0)
                     continue;

                  if(line[0] != '1') {

                     string value = line.Substring(1, 15);
                     int binVal = Convert.ToInt32(value, 2);
                     string val = binVal.ToString();

                     hackList.Add($"@{val}");
                  }
                  else {
                     string cBit = line.Substring(3, 7);
                     string dBit = line.Substring(10, 3);
                     string jBit = line.Substring(13, 3);

                     hackList.Add(destTable[dBit] + compTable[cBit] + jumpTable[jBit]);
                  }
               }

               File.WriteAllLines(args[0].Replace(".hack", ".asm"), hackList);
            }
         }
      }
   }
}
