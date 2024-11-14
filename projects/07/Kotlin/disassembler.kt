import java.io.File;
import java.util.*;

/// How to run the code ///

//  1. Ensure that Kotlin is setup on your system properly
//  You will need a jdk
//      Run java --version to check

//      java --version Output
//      openjdk 23.0.1 2024-10-15
//      OpenJDK Runtime Environment Homebrew (build 23.0.1)
//      OpenJDK 64-Bit Server VM Homebrew (build 23.0.1, mixed mode, sharing)

//  You will also need Kotlin itself
//      Run kotlin -version to check

//      kotlin -version Output
//          Kotlin version 1.9.23-release-779 (JRE 22+36)


//  2. Go to the directory where your files are located 
//  You can check if your files are there by running 'ls' in the terminal

//  3. Run the following
//  kotlinc ./disassembler.kt -include-runtime -d ./disassembler.jar (this is compiling your program)
//  kotlin ./disassembler.jar ./Add.hack (this is executing your program)



fun main(args: Array<String>) 
{
    // Check if appropriate file extension
    if (args[0].endsWith(".hack"))	
    {
        // Check if file exists
        if (File(args[0]).exists())
        {
            val Lines: List<String> = File(args[0]).readLines();

            // List to be used for storing HACK instructions
            val hackList: ArrayList<String> = ArrayList<String>();

            // Computation Map
            val compTable = mapOf(
                "0101010" to "0",
                "0111111" to "1",
                "0111010" to "-1",
                "0001100" to "D",
                "0110000" to "A",
                "1110000" to "M",
                "0001101" to "!D",
                "0110001" to "!A",
                "1110001" to "!M",
                "0001111" to "-D",
                "0110011" to "-A",
                "1110011" to "-M",
                "0011111" to "D+1",
                "0110111" to "A+1",
                "1110111" to "M+1",
                "0001110" to "D-1",
                "0110010" to "A-1",
                "1110010" to "M-1",
                "0000010" to "D+A",
                "1000010" to "D+M",
                "0010011" to "D-A",
                "1010011" to "D-M",
                "0000111" to "A-D",
                "1000111" to "M-D",
                "0000000" to "D&A",
                "1000000" to "D&M",
                "0010101" to "D|A",
                "1010101" to "D|M",
            )

            // Destination Map
            val destTable = mapOf(
                "000" to "",
                "001" to "M=",
                "010" to "D=",
                "011" to "DM=",
                "100" to "A=",
                "101" to "AM=",
                "110" to "AD=",
                "111" to "ADM="
            )

            // Jump Map
            val jumpTable = mapOf(
                "000" to "",
                "001" to ";JGT",
                "010" to ";JEQ",
                "011" to ";JGE",
                "100" to ";JLT",
                "101" to ";JNE",
                "110" to ";JLE",
                "111" to ";JMP"
            )

            // Loop through all assembly lines in the HACK file
            for (line in Lines)
            {
                // A Instruction
                // if - Check instruction op-code (the first char in the char[])

                    // Get the remaining substring and convert to decimal
                    // Conversion (just uncomment)
                    // 		val binVal: String = line.substring(1, 16);

                    // Construct the appropriate HACK instruction

                    // Append to hackList

                // C Instruction
                // else if - Check instruction op-code (the first char in the char[])

                    // Create strings from the appropriate substrings
                    // cBit, dBit, jBit

                    // Return HACK destination string from destTable using dBit

                    // Return HACK computation string from compTable using cBit 

                    // Return HACK jump string from jumpTable using jBit

                    // Construct the appropriate HACK instruction

                    // Append to hackList
            }

            // Write to file
            File(args[0].replace(".hack", ".asm")).writeText(hackList.joinToString(separator=""));
        }
    }
}
