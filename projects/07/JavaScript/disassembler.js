const fs = require("fs");

var inFile = process.argv[2];
if (inFile.includes(".hack"))
{
    // Check if file exists
    if (fs.existsSync(inFile))
    {
        const Lines = fs.readFileSync(inFile, "utf8").split("\n");

        var hackList = [];

        let compTable = {
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

        let destTable = {
            "000": "",
            "001": "M=",
            "010": "D=",
            "011": "DM=",
            "100": "A=",
            "101": "AM=",
            "110": "AD=",
            "111": "ADM="
        };

        let jumpTable = {
            "000": "",
            "001": ";JGT",
            "010": ";JEQ",
            "011": ";JGE",
            "100": ";JLT",
            "101": ";JNE",
            "110": ";JLE",
            "111": ";JMP"
        };

        for (const line of Lines)
        {
            if(line.length == 0)
                continue;

            if(line[0] != '1'){

                var value = parseInt(line.substring(1, 16), 2);

                hackList = hackList.concat(`@${value}`);
            }
            else {
                    var cBit = line.substring(3, 10);
                    var dBit = line.substring(10, 13);
                    var jBit = line.substring(13, 16);
                    
                    var computation = destTable[dBit] + compTable[cBit] + jumpTable[jBit];

                    hackList = hackList.concat(computation);
            }
        
        }

        // Write to file
        var outFile = inFile.replace(".hack", ".asm");
        fs.writeFileSync(outFile, hackList.join("\n"));
    }
}