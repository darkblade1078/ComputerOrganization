### How to run the code ###

#   1. Ensure that Perl is setup on your system
#     Run perl --version to check

#     python --version Output
#         This is perl 5, version 38, subversion 2 (v5.38.2) built for x86_64-linux-thread-multi


#   2. Go to the directory where your files are located 
#   You can check if your files are there by running "ls" in the terminal

#   3. Run the following
#   perl ./disassembler.pl ./Add.hack (this is executing your program)



# Check if appropriate file extension
if (index($ARGV[0], ".hack") != -1)
{
    # Check if file is readable
    if (-r $ARGV[0])
    {
        open (my $handle, "<", $ARGV[0]);
        chomp (my @lines = <$handle>);
        close $handle;

        # List to be used for storing HACK instructions
        my @hackList;

        # Computation Dictionary
        my %compTable = 
        (
            '0101010' => '0',
            '0111111' => '1',
            '0111010' => '-1',
            '0001100' => 'D',
            '0110000' => 'A',
            '1110000' => 'M',
            '0001101' => '!D',
            '0110001' => '!A',
            '1110001' => '!M',
            '0001111' => '-D',
            '0110011' => '-A',
            '1110011' => '-M',
            '0011111' => 'D+1',
            '0110111' => 'A+1',
            '1110111' => 'M+1',
            '0001110' => 'D-1',
            '0110010' => 'A-1',
            '1110010' => 'M-1',
            '0000010' => 'D+A',
            '1000010' => 'D+M',
            '0010011' => 'D-A',
            '1010011' => 'D-M',
            '0000111' => 'A-D',
            '1000111' => 'M-D',
            '0000000' => 'D&A',
            '1000000' => 'D&M',
            '0010101' => 'D|A',
            '1010101' => 'D|M'
        );

        # Destination Dictionary
        my %destTable = (
            '000' => '',
            '001' => 'M=',
            '010' => 'D=',
            '011' => 'DM=',
            '100' => 'A=',
            '101' => 'AM=',
            '110' => 'AD=',
            '111' => 'ADM='
        );

        # Jump Dictionary
        my %jumpTable = (
            '000' => '',
            '001' => ';JGT',
            '010' => ';JEQ',
            '011' => ';JGE',
            '100' => ';JLT',
            '101' => ';JNE',
            '110' => ';JLE',
            '111' => ';JMP'
        );

        # Loop through all assembly lines in the HACK file
        for my $line (@lines)
        {
            # A Instruction
            # if - Check instruction op-code (the first char in the string)

                # Get the remaining substring and convert to decimal 
                # Conversion (just uncomment)
                #       my $value = eval('0b' . substr($line,1,15));

                # Construct the appropriate HACK instruction
                # https://www.geeksforgeeks.org/python-string-concatenation/

                # Append to hackList
                # https://www.geeksforgeeks.org/python-list-append-method/


            # C Instruction
            # elif - Check instruction op-code (the first char in the string)

                # Create strings from the appropriate substrings
                # cBit, dBit, jBit

                # Return HACK destination string from destTable using dBit
                # https://www.geeksforgeeks.org/python-dictionary/?ref=lbp

                # Return HACK computation string from compTable using cBit 

                # Return HACK jump string from jumpTable using jBit

                # Construct the appropriate HACK instruction

                # Append to hackList
        }

        # Create new file name to write to
        my $newFileName = $ARGV[0] =~ s/.hack/.asm/r;

        # Write to file
        open (my $handle, '>', $newFileName) or die $!;
        print $handle join('', @hackList);
        close($handle);
    }
}
