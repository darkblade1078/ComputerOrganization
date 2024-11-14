import std.file : readText; 
import std.container : DList;
import std.conv : to, toChars;
import std.string : splitLines;
import core.stdc.stdlib : strtol;
import std.stdio : writeln, toFile;
import std.array : split, array, replace;
import std.algorithm.searching : endsWith;

/// How to run the code ///

//  1. Ensure that you have a D compiler on your system (I recommend LDC personally)
//      https://wiki.dlang.org/Compilers

//  You need some D compiler installed on your system
//      Run ldc --version to check

//      ldc --version Output
//          LDC - the LLVM D compiler (1.39.0):
//              based on DMD v2.109.1 and LLVM 18.1.8
//              built with LDC - the LLVM D compiler (1.39.0)
//              Default target: x86_64-pc-linux-gnu
//              Host CPU: znver4
//              http://dlang.org - http://wiki.dlang.org/LDC


//  2. Go to the directory where your files are located 
//  You can check if your files are there by running 'ls' in the terminal

//  3. Run the following
//  ldc ./disassembler.d -of disassembler.out (this is compiling your program)
//  ./disassembler.out ./Add.hack (this is executing your program)

//  Note: If you are on Windows, please use .exe rather .out for your
//        compiled binary

//  Please use your appropriate compiler rather than "ldc" if you're using another compiler



void main(string[] getline)
{ 
    if (endsWith(getline[1], ".hack"))
    {
        string[] Lines = readText(getline[1]).splitLines();

        // Doubly Linked List to be used for storing HACK instructions
        DList!string hackList;

        // Computation Associative Array
        string[string] compTable = [
            "0101010": "0",
            "0111111": "1",
            "0111010": "-1",
            "0001100": "D",
            "0110000": "A",
            "1110000": "M",
            "0001101": "!D",
            "0110001": "!A",
            "1110001": "!M",
            "0001111": "-D",
            "0110011": "-A",
            "1110011": "-M",
            "0011111": "D+1",
            "0110111": "A+1",
            "1110111": "M+1",
            "0001110": "D-1",
            "0110010": "A-1",
            "1110010": "M-1",
            "0000010": "D+A",
            "1000010": "D+M",
            "0010011": "D-A",
            "1010011": "D-M",
            "0000111": "A-D",
            "1000111": "M-D",
            "0000000": "D&A",
            "1000000": "D&M",
            "0010101": "D|A",
            "1010101": "D|M"
        ];

        // Destination Associative Array
        string[string] destTable = [
            "000": "",
            "001": "M=",
            "010": "D=",
            "011": "DM=",
            "100": "A=",
            "101": "AM=",
            "110": "AD=",
            "111": "ADM="
        ];

        // Jump Associative Array
        string[string] jumpTable = [
            "000": "",
            "001": ";JGT",
            "010": ";JEQ",
            "011": ";JGE",
            "100": ";JLT",
            "101": ";JNE",
            "110": ";JLE",
            "111": ";JMP"
        ];

        // Loop through all assembly lines in the HACK file
        foreach (string line; Lines)
        {
            // A Instruction
            // if - Check instruction op-code (the first char in the string)
                // Get the remaining substring and convert to decimal
                // Conversion
                //      string value = line[1..16];
                //      int binVal =to!int(strtol(value.ptr, null, 2));

                // Construct the appropriate HACK instruction
                // https://dlang.org/spec/arrays.html#array-concatenation
                
                // Append to hackList
                // https://dlang.org/phobos/std_container_dlist.html#.DList.insertBack

            // C Instruction
            // else if - Check instruction op-code (the first char in the string)

                // Create strings from the appropriate substrings
                // cBit, dBit, jBit
                // https://dlang.org/spec/arrays.html#slicing

                // Return HACK destination string from destTable using dBit
                // https://dlang.org/spec/hash-map.html

                // Return HACK computation string from compTable using cBit 

                // Return HACK jump string from jumpTable using jBit

                // Construct the appropriate HACK instruction

                // Append to hackList
        }

        // Write to file
        toFile(hackList.array, args[1].replace(".hack", ".asm"));
    }
}
