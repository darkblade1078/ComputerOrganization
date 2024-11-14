import 'dart:io';

/// How to run the code ///

//  1. Ensure that Dart is setup on your system
//  Run go version to check

//  dart --version Output
//      Dart SDK version: 3.5.4 (stable)


//  2. Go to the directory where your files are located 
//  You can check if your files are there by running 'ls' in the terminal

//  3. Run the following
//  dart compile exe ./disassembler.dart -o ./disassembler.out (this is compiling your program)
//  ./disassembler.out ./Add.hack (this is executing your program)

//  Note: If you are on Windows, please use .exe rather .out for your
//        compiled binary


// Main Function
void main(List<String> args) async
{
    // Check if appropriate file extension
    if (args[0].endsWith(".hack"))
    {
        // Check if file exists and open
        if (File(args[0]).existsSync())
        {
            List<String> lines = await File(args[0]).readAsLines();

            // List to be used for storing HACK instructions
            List<String> hackList = [];

            // Computation Map
            Map<String, String> compTable = 
            {
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
            };

            // Destination Map
            Map<String, String> destTable = 
            {
                "000": "",
                "001": "M=",
                "010": "D=",
                "011": "DM=",
                "100": "A=",
                "101": "AM=",
                "110": "AD=",
                "111": "ADM="
            };

            // Jump Map
            Map<String, String> jumpTable = 
            {
                "000": "",
                "001": ";JGT",
                "010": ";JEQ",
                "011": ";JGE",
                "100": ";JLT",
                "101": ";JNE",
                "110": ";JLE",
                "111": ";JMP"
            };

            // Loop through all assembly lines in the HACK file
            for (String line in lines)
            {
                // A Instruction
                // if - Check instruction op-code (the first char in the string)
                
                    // Get the remaining substring and convert to decimal 
                    // Conversion (just uncomment)
                    // String value = line.substring(1, 16);
                    // int binVal = int.parse(value, radix: 2);

                    // Construct the appropriate HACK instruction
                    // https://api.flutter.dev/flutter/dart-core/String-class.html

                    // Append to hackList
                    // https://api.dart.dev/stable/3.5.4/dart-core/List/add.html

                // C Instruction
                // else if - Check instruction op-code (the first char in the string)
                
                    // Create strings from the appropriate substrings
                    // cBit, dBit, jBit
                    // https://api.flutter.dev/flutter/dart-core/String-class.html

                    // Return HACK destination string from destTable using dBit
                    // https://dart.dev/language/collections#maps

                    // Return HACK computation string from compTable using cBit

                    // Return HACK jump string from jumpTable using jBit

                    // Construct the appropriate HACK instruction

                    // Append to hackList
            }

            // Write to file
            String fileName = args[0].replaceAll(".hack", ".asm");
            File(fileName).writeAsStringSync(hackList.join("\n"));
        }
    }
} 