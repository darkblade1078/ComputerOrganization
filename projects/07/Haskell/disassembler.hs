import System.Environment
import System.Directory
import Control.Monad (forM)
import qualified Data.Text as Text(Text, pack, unpack, isSuffixOf, drop, take, index, append, replace)
import qualified Data.Char as Char(digitToInt)
import qualified Data.Map as Map
import qualified Data.List as List(intercalate)


--- How to run the code ---

--  1. Ensure that GHC is setup on your system
--    Run ghc --version to check

--    ghc --version Output
--        The Glorious Glasgow Haskell Compilation System, version 9.2.8


--  2. Go to the directory where your files are located 
--  You can check if your files are there by running 'ls' in the terminal

--  3. Run the following
--  ghc ./disassembler.hs -o ./disassembler.out (this is compiling your program)
--  ./disassembler.out ./Add.hack (this is executing your program)

--  Note: If you are on Windows, please use .exe rather .out for your 
--        compiled binary




-- Help function for extracting substrings
getSubstring :: Int -> Int -> Text.Text -> Text.Text
getSubstring start length = Text.take length . Text.drop start

-- Help function for converting Binary String to Decimal Integer
binToDec :: String -> Int
binToDec = foldl (\acc x -> 2*acc + Char.digitToInt x) 0


-- Main Function
main = do

    -- Check if appropriate file extension
    args <- getArgs
    if Text.pack ".hack" `Text.isSuffixOf` Text.pack (args !! 0)
        then do
            -- Check if file exists and read
            exists <- doesFileExist (args !! 0)
            if exists
                then do
                    content <- readFile (args !! 0)
                    let linesOfFiles = lines content

                -- Computation Map
                let compTable = Map.fromList [
                                ("0101010", "0"),
                                ("0111111", "1"),
                                ("0111010", "-1"),
                                ("0001100", "D"),
                                ("0110000", "A"),
                                ("1110000", "M"),
                                ("0001101", "!D"),
                                ("0110001", "!A"),
                                ("1110001", "!M"),
                                ("0001111", "-D"),
                                ("0110011", "-A"),
                                ("1110011", "-M"),
                                ("0011111", "D+1"),
                                ("0110111", "A+1"),
                                ("1110111", "M+1"),
                                ("0001110", "D-1"),
                                ("0110010", "A-1"),
                                ("1110010", "M-1"),
                                ("0000010", "D+A"),
                                ("1000010", "D+M"),
                                ("0010011", "D-A"),
                                ("1010011", "D-M"),
                                ("0000111", "A-D"),
                                ("1000111", "M-D"),
                                ("0000000", "D&A"),
                                ("1000000", "D&M"),
                                ("0010101", "D|A"),
                                ("1010101", "D|M")]

                -- Destination Map
                let destTable = Map.fromList [
                                ("000", ""),
                                ("001", "M="),
                                ("010", "D="),
                                ("011", "DM="),
                                ("100", "A="),
                                ("101", "AM="),
                                ("110", "AD="),
                                ("111", "ADM=")]

                -- Jump Map
                let jumpTable = Map.fromList [
                                ("000", ""),
                                ("001", ";JGT"),
                                ("010", ";JEQ"),
                                ("011", ";JGE"),
                                ("100", ";JLT"),
                                ("101", ";JNE"),
                                ("110", ";JLE"),
                                ("111", ";JMP")]

                --  Loop through all assembly lines in the HACK file whilst returning to hackList
                hackList <- forM linesOfFiles $ \curLine -> do

                    -- Set line as Text
                    let line = Text.pack curLine

                    -- A Instruction
                    -- if - Check instruction op-code (the first char in the string)

                            -- Get the remaining substring and convert to decimal
                            -- Conversion (just uncomment)
                            -- let decVal = binToDec (Text.unpack (getSubstring 1 15 line))

                            -- Construct the appropriate HACK instruction
                            -- https://forkful.ai/en/haskell/strings/concatenating-strings/

                            -- Return to hackList Monad (just uncomment)
                            -- return ins

                    -- C Instruction
                    -- else if - Check instruction op-code (the first char in the string)

                            -- Create strings from the appropriate substrings
                            -- cBit, dBit, jBit
                            -- https://forkful.ai/en/haskell/strings/extracting-substrings/

                            -- Return HACK destination string from destTable using dBit
                            -- https://hackage.haskell.org/package/containers-0.4.0.0/docs/Data-Map.html

                            -- Return HACK computation string from compTable using cBit

                            -- Return HACK jump string from jumpTable using jBit

                            -- Construct the appropriate HACK instruction

                            -- Return to hackList Monad

                -- Write to file
                let curFile = Text.replace (Text.pack ".hack") (Text.pack ".asm") (Text.pack (args !! 0))
                writeFile (Text.unpack curFile) $ List.intercalate "\n" hackList

            else do
                print "File Does Not Exist"
    else do
        print "Invalid File Type"