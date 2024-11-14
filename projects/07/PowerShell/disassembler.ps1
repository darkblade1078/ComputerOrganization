### How to run the code ###

#   1. Ensure that PowerShell 7 is setup on your system
#     Run pwsh --version to check

#     pwsh --version Output
#         PowerShell 7.4.6


#   2. Go to the directory where your files are located 
#   You can check if your files are there by running "ls" in the terminal

#   3. Run the following
#   pwsh -file ./disassembler.ps1 ./Add.hack (this is executing your program)



# Check if appropriate file extension
if ($args[0].EndsWith(".hack"))
{
    if ([System.IO.File]::Exists($args[0]))
    {
        $lines = [System.IO.File]::ReadLines($args[0])

        # List to be used for storing HACK instructions
        $hackList = @()

        # Computation Dictionary
        $compTable = 
        @{
            '0101010' = '0';
            '0111111' = '1';
            '0111010' = '-1';
            '0001100' = 'D';
            '0110000' = 'A';
            '1110000' = 'M';
            '0001101' = '!D';
            '0110001' = '!A';
            '1110001' = '!M';
            '0001111' = '-D';
            '0110011' = '-A';
            '1110011' = '-M';
            '0011111' = 'D+1';
            '0110111' = 'A+1';
            '1110111' = 'M+1';
            '0001110' = 'D-1';
            '0110010' = 'A-1';
            '1110010' = 'M-1';
            '0000010' = 'D+A';
            '1000010' = 'D+M';
            '0010011' = 'D-A';
            '1010011' = 'D-M';
            '0000111' = 'A-D';
            '1000111' = 'M-D';
            '0000000' = 'D&A';
            '1000000' = 'D&M';
            '0010101' = 'D|A';
            '1010101' = 'D|M'
        };

        # Destination Dictionary
        $destTable = 
        @{
            '000' = '';
            '001' = 'M=';
            '010' = 'D=';
            '011' = 'DM=';
            '100' = 'A=';
            '101' = 'AM=';
            '110' = 'AD=';
            '111' = 'ADM='
        };

        # Jump Dictionary
        $jumpTable = 
        @{
            '000' = '';
            '001' = ';JGT';
            '010' = ';JEQ';
            '011' = ';JGE';
            '100' = ';JLT';
            '101' = ';JNE';
            '110' = ';JLE';
            '111' = ';JMP'
        };

        # Loop through all assembly lines in the HACK file
        foreach ($line in $lines)
        {
            # A Instruction
            # if - Check instruction op-code (the first char in the string)

                # Get the remaining substring and convert to decimal 
                # Conversion (just uncomment)
                # $binString = $line.Substring(1, 15)
                # $value = [convert]::ToInt32($binString, 2)

                # Construct the appropriate HACK instruction
                # https://localhorse.net/article/powershell-how-to-concatenate-strings

                # Append to hackList
                # https://www.delftstack.com/howto/powershell/add-items-to-array-in-powershell/

            # C Instruction

                # Create strings from the appropriate substrings
                # cBit, dBit, jBit
                # https://lazyadmin.nl/powershell/substring/

                # Return HACK destination string from destTable using dBit
                # https://lazyadmin.nl/powershell/powershell-hashtable/
                
                # Return HACK computation string from compTable using cBit

                # Return HACK jump string from jumpTable using jBit

                # Construct the appropriate HACK instruction

                # Append to hackList
        }

        # Write to file
        $fileName = $args[0].replace('.hack', '.asm')
        [System.IO.File]::WriteAllLines($fileName, $hackList)
    }
}
