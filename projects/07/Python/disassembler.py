import sys
from os.path import exists as file_exists

if ".hack" in sys.argv[1]:

    if file_exists(sys.argv[1]):

        file = open(sys.argv[1], 'r')
        Lines = file.readlines()

        hackList = []

        compTable = {
            '0101010' : '0',
            '0111111' : '1',
            '0111010' : '-1',
            '0001100' : 'D',
            '0110000' : 'A',
            '1110000' : 'M',
            '0001101' : '!D',
            '0110001' : '!A',
            '1110001' : '!M',
            '0001111' : '-D',
            '0110011' : '-A',
            '1110011' : '-M',
            '0011111' : 'D+1',
            '0110111' : 'A+1',
            '1110111' : 'M+1',
            '0001110' : 'D-1',
            '0110010' : 'A-1',
            '1110010' : 'M-1',
            '0000010' : 'D+A',
            '1000010' : 'D+M',
            '0010011' : 'D-A',
            '1010011' : 'D-M',
            '0000111' : 'A-D',
            '1000111' : 'M-D',
            '0000000' : 'D&A',
            '1000000' : 'D&M',
            '0010101' : 'D|A',
            '1010101' : 'D|M'
        }

        destTable = {
            '000' : '',
            '001' : 'M=',
            '010' : 'D=',
            '011' : 'DM=',
            '100' : 'A=',
            '101' : 'AM=',
            '110' : 'AD=',
            '111' : 'ADM='
        }

        jumpTable = {
            '000' : '',
            '001' : ';JGT',
            '010' : ';JEQ',
            '011' : ';JGE',
            '100' : ';JLT',
            '101' : ';JNE',
            '110' : ';JLE',
            '111' : ';JMP'
        }

        for line in Lines:

            if(len(line) == 0):
                continue

            if(line[0] != '1'):

                value = int(line[1:16], 2)

                hackList.append(f"@{value}\n")
            else:
                cBit = line[3:10]
                dBit = line[10:13]
                jBit = line[13:16]

                hackList.append(destTable[dBit] + compTable[cBit] + jumpTable[jBit] + "\n")

        file = open(sys.argv[1].replace('.hack', '.asm'), 'w')
        file.writelines(hackList)
        file.close()
