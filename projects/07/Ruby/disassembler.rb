### How to run the code ###

#  1. Ensure that Ruby is setup on your system
#    Run ruby --version to check

#    ruby --version Output
#        ruby 2.6.10p210 (2022-04-12 revision 67958)


#  2. Go to the directory where your files are located 
#  You can check if your files are there by running "ls" in the terminal

#  3. Run the following
#  ruby ./ruby.rb ./Add.hack (this is executing your program)



# Check if appropriate file extension
if ARGV[0].end_with? ".hack"

    # Check if file exists
    if File.file?(ARGV[0])

        Lines = File.readlines(ARGV[0])

        # List to be used for storing HACK instructions
        hackList = []

        # Computation Dictionary
        compTable = {
            "0101010" => "0",
            "0111111" => "1",
            "0111010" => "-1",
            "0001100" => "D",
            "0110000" => "A",
            "1110000" => "M",
            "0001101" => "!D",
            "0110001" => "!A",
            "1110001" => "!M",
            "0001111" => "-D",
            "0110011" => "-A",
            "1110011" => "-M",
            "0011111" => "D+1",
            "0110111" => "A+1",
            "1110111" => "M+1",
            "0001110" => "D-1",
            "0110010" => "A-1",
            "1110010" => "M-1",
            "0000010" => "D+A",
            "1000010" => "D+M",
            "0010011" => "D-A",
            "1010011" => "D-M",
            "0000111" => "A-D",
            "1000111" => "M-D",
            "0000000" => "D&A",
            "1000000" => "D&M",
            "0010101" => "D|A",
            "1010101" => "D|M"
        }

        # Destination Dictionary
        destTable = {
            "000" => "",
            "001" => "M=",
            "010" => "D=",
            "011" => "DM=",
            "100" => "A=",
            "101" => "AM=",
            "110" => "AD=",
            "111" => "ADM="
        }

        # Jump Dictionary
        jumpTable = {
            "000" => "",
            "001" => ";JGT",
            "010" => ";JEQ",
            "011" => ";JGE",
            "100" => ";JLT",
            "101" => ";JNE",
            "110" => ";JLE",
            "111" => ";JMP"
        }

        # Loop through all assembly lines in the HACK file
        for line in Lines do

            # A Instruction
            # if - Check instruction op-code (the first char in the string)

                # Get the remaining substring and convert to decimal 
                # Conversion (just uncomment)
                # value = line[1, 15].to_i(2)

                # Construct the appropriate HACK instruction
                # https://www.delftstack.com/howto/ruby/ruby-string-concatenate/

                # Append to hackList
                # https://www.geeksforgeeks.org/add-array-elements-in-ruby/


            # C Instruction

            # elsif - Check instruction op-code (the first char in the string)

                # Create strings from the appropriate substrings
                # cBit, dBit, jBit
                # https://www.delftstack.com/howto/ruby/substring-in-ruby/

                # Return HACK destination string from destTable using dBit
                # https://www.rubyguides.com/2020/05/ruby-hash-methods/

                # Return HACK computation string from compTable using cBit

                # Return HACK jump string from jumpTable using jBit

                # Construct the appropriate HACK instruction

                # Append to hackList
            # end
        end

        # Write to file
        fileName = ARGV[0].dup.sub! ".hack", ".asm"
        File.write(fileName, hackList.join(""))

    end
end
