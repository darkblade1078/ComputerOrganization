package main

import (
    "bufio"
    "fmt"
    "log"
    "os"
    "strings"
    "strconv"
)
/// How to run the code ///

//  1. Ensure that Go is setup on your system
//  Run go version to check

//  go version Output
//      go version go1.23.3 linux/amd64


//  2. Go to the directory where your files are located 
//  You can check if your files are there by running 'ls' in the terminal

//  3. Run the following
//  go build -o ./disassembler.out ./disassembler.go (this is compiling your program)
//  ./disassembler.out ./Add.hack (this is executing your program)

//  Note: If you are on Windows, please use .exe rather .out for your
//        compiled binary



// Help function for reading from the file
func readLines(path string) ([]string, error) {
    file, err := os.Open(path)
    if err != nil {
        return nil, err
    }
    defer file.Close()

    var lines []string
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        lines = append(lines, scanner.Text())
    }
    return lines, scanner.Err()
}

// Help function for writing to the file
func writeLines(lines []string, path string) error {
    file, err := os.Create(path)
    if err != nil {
        return err
    }
    defer file.Close()

    w := bufio.NewWriter(file)
    for _, line := range lines {
        fmt.Fprintln(w, line)
    }
    return w.Flush()
}

// Main Function
func main() {

    // Check if appropriate file extension
    if (strings.Contains(os.Args[1], ".hack")) {

        // Check if file exists and open
        Lines, err := readLines(os.Args[1])
        if err != nil {
            log.Fatalf("readLines: %s", err)
        }

        // Slice to be used for storing HACK instructions
        var hackList []string

        // Computation Map
        var compTable = map[string]string {
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
            "1010101": "D|M",
        }

        // Destination Map
        var destTable = map[string]string {
            "000": "",
            "001": "M=",
            "010": "D=",
            "011": "DM=",
            "100": "A=",
            "101": "AM=",
            "110": "AD=",
            "111": "ADM=",
        }

        // Jump Map
        var jumpTable = map[string]string {
            "000": "",
            "001": ";JGT",
            "010": ";JEQ",
            "011": ";JGE",
            "100": ";JLT",
            "101": ";JNE",
            "110": ";JLE",
            "111": ";JMP",
        }

        // Loop through all assembly lines in the HACK file
        for _, line := range Lines {
            
            // A Instruction
            // if - Check instruction op-code (the first char in the string)
            
                // Get the remaining substring and convert to decimal 
                // Conversion (just uncomment)
                //      value, err := strconv.ParseInt(line[1:16], 2, 64)
                //      if err != nil {
                //          fmt.Println(err)
                //          return
                //      }

                // Construct the appropriate HACK instruction
                // https://golangdocs.com/concatenate-strings-in-golang

                // Append to hackList
                // https://dev.to/andyhaskell/a-closer-look-at-go-s-slice-append-function-3bhb

            // C Instruction
            // else if - Check instruction op-code (the first char in the string)

                // Create strings from the appropriate substrings
                // cBit, dBit, jBit
                // https://golangdocs.com/substring-in-golang

                // Return HACK destination string from destTable using dBit
                // https://golangdocs.com/maps-in-golang

                // Return HACK computation string from compTable using cBit

                // Return HACK jump string from jumpTable using jBit

                // Construct the appropriate HACK instruction

                // Append to hackList
        }

        // Write to file
        if err := writeLines(hackList, strings.ReplaceAll(os.Args[1],".hack",".asm")); err != nil {
            log.Fatalf("writeLines: %s", err)
        }
    }
}
