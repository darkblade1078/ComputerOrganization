import java.io.IOException;
import java.nio.file.*;
import java.util.*;

public class disassembler
{
    public static void main(String[] args) throws IOException 
    {
        if (args[0].contains(".hack"))
        {
            if (Files.exists(Paths.get(args[0])))
            {
                List<String> Lines = Files.readAllLines(Paths.get(args[0]));

                ArrayList<String> hackList = new ArrayList<String>();

                Hashtable<String,String> compTable = new Hashtable<String, String>();
                    compTable.put("0101010", "0");
                    compTable.put("0111111", "1");
                    compTable.put("0111010", "-1");
                    compTable.put("0001100", "D");
                    compTable.put("0110000", "A");
                    compTable.put("1110000", "M");
                    compTable.put("0001101", "!D");
                    compTable.put("0110001", "!A");
                    compTable.put("1110001", "!M");
                    compTable.put("0001111", "-D");
                    compTable.put("0110011", "-A");
                    compTable.put("1110011", "-M");
                    compTable.put("0011111", "D+1");
                    compTable.put("0110111", "A+1");
                    compTable.put("1110111", "M+1");
                    compTable.put("0001110", "D-1");
                    compTable.put("0110010", "A-1");
                    compTable.put("1110010", "M-1");
                    compTable.put("0000010", "D+A");
                    compTable.put("1000010", "D+M");
                    compTable.put("0010011", "D-A");
                    compTable.put("1010011", "D-M");
                    compTable.put("0000111", "A-D");
                    compTable.put("1000111", "M-D");
                    compTable.put("0000000", "D&A");
                    compTable.put("1000000", "D&M");
                    compTable.put("0010101", "D|A");
                    compTable.put("1010101", "D|M");

                Hashtable<String,String> destTable = new Hashtable<String, String>();
                    destTable.put("000", "");
                    destTable.put("001", "M=");
                    destTable.put("010", "D=");
                    destTable.put("011", "DM=");
                    destTable.put("100", "A=");
                    destTable.put("101", "AM=");
                    destTable.put("110", "AD=");
                    destTable.put("111", "ADM=");

                Hashtable<String,String> jumpTable = new Hashtable<String, String>();
                    jumpTable.put("000", "");
                    jumpTable.put("001", ";JGT");
                    jumpTable.put("010", ";JEQ");
                    jumpTable.put("011", ";JGE");
                    jumpTable.put("100", ";JLT");
                    jumpTable.put("101", ";JNE");
                    jumpTable.put("110", ";JLE");
                    jumpTable.put("111", ";JMP");

                for (String lineStr : Lines)
                {

                    if(lineStr.length() == 0)
                        continue;

                    if(lineStr.charAt(0) == '0') {

                        String value = lineStr.substring(1, 16);
                        int binVal = Integer.parseInt(value, 2);
                        String val = Integer.toString(binVal);

                        hackList.add("@" + val);
                    }
                    else {

                        String cBit = lineStr.substring(3, 10);
                        String dBit = lineStr.substring(10, 13);
                        String jBit = lineStr.substring(13, 16);
    
                        hackList.add(destTable.get(dBit) + compTable.get(cBit) + jumpTable.get(jBit));
                    }
                }

                Files.write(Paths.get(args[0].replaceAll(".hack", ".asm")), hackList);
            }
        }
    }
}
