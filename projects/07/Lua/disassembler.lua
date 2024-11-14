---  How to run the code ---

--   1. Ensure that Lua is setup on your system
--   Run lua -v to check

--   lua -v Output
--       Lua 5.4.7  Copyright (C) 1994-2024 Lua.org, PUC-Rio


--   2. Go to the directory where your files are located 
--   You can check if your files are there by running 'ls' in the terminal

--   3. Run the following
--   lua ./disassembler.py ./Add.hack (this is executing your program)



--  Check if appropriate file extension
if arg[1]:find(".hack") then

    local file = assert( io.open( arg[1], "r" ) )
    local Lines = {}
    for line in file:lines() do
        table.insert (Lines, line);
    end
    file:close()

    -- List to be used for storing HACK instructions
    hackList = {}

    -- Computation Dictionary
    compTable = {
        ["0101010"] = "0",
        ["0111111"] = "1",
        ["0111010"] = "-1",
        ["0001100"] = "D",
        ["0110000"] = "A",
        ["1110000"] = "M",
        ["0001101"] = "!D",
        ["0110001"] = "!A",
        ["1110001"] = "!M",
        ["0001111"] = "-D",
        ["0110011"] = "-A",
        ["1110011"] = "-M",
        ["0011111"] = "D+1",
        ["0110111"] = "A+1",
        ["1110111"] = "M+1",
        ["0001110"] = "D-1",
        ["0110010"] = "A-1",
        ["1110010"] = "M-1",
        ["0000010"] = "D+A",
        ["1000010"] = "D+M",
        ["0010011"] = "D-A",
        ["1010011"] = "D-M",
        ["0000111"] = "A-D",
        ["1000111"] = "M-D",
        ["0000000"] = "D&A",
        ["1000000"] = "D&M",
        ["0010101"] = "D|A",
        ["1010101"] = "D|M"
    }

    -- Destination Dictionary
    destTable = {
        ["000"] = "",
        ["001"] = "M=",
        ["010"] = "D=",
        ["011"] = "DM=",
        ["100"] = "A=",
        ["101"] = "AM=",
        ["110"] = "AD=",
        ["111"] = "ADM="
    }

    -- Jump Dictionary
    jumpTable = {
        ["000"] = "",
        ["001"] = ";JGT",
        ["010"] = ";JEQ",
        ["011"] = ";JGE",
        ["100"] = ";JLT",
        ["101"] = ";JNE",
        ["110"] = ";JLE",
        ["111"] = ";JMP"
    }

    -- Loop through all assembly lines in the HACK file
    for key, value in pairs(Lines) do

        print(key)

        -- A Instruction
        -- if - Check instruction op-code (the first char in the string)

            -- Get the remaining substring and convert to decimal
            -- Conversion (just uncomment)
            --      value = tonumber(value:sub(2, 16), 2)

            -- Construct the appropriate HACK instruction
            -- https://www.lua.org/pil/3.4.html

            -- Append to hackList
            -- https://www.lua.org/pil/19.2.html

        -- C Instruction
        -- elseif - Check instruction op-code (the first char in the string)
            
            -- Create strings from the appropriate substrings
            -- cBit, dBit, jBit
            -- https://www.tutorialspoint.com/string-sub-function-in-lua

            -- Return HACK destination string from destTable using dBit
            -- https://www.tutorialspoint.com/lua/lua_tables.htm

            -- Return HACK computation string from compTable using cBit

            -- Return HACK jump string from jumpTable using jBit

            -- Construct the appropriate HACK instruction

            -- Append to hackList
    end

    -- Write to file

    local newfile = string.sub(arg[1], 1, -5) .. 'asm'
    local writefile = io.open(newfile, "w")
    writefile:write(table.concat(hackList))
    writefile:close()
end
