#![allow(non_snake_case)]
use std::collections::HashMap;
use std::env;
use std::path::Path;
use std::fs::File;
use std::io::{BufRead, BufReader};
use std::io::Write;

fn main()
{
    let args: Vec<String> = env::args().collect();

    if args[1].contains(".hack")
    {
        if Path::new(&args[1]).exists()
        {
            let mut file = File::open(&args[1]).unwrap();
            let Lines = BufReader::new(file);

            let mut hackList = Vec::<String>::new();

            let compTable = HashMap::from
            ([
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
                ("1010101", "D|M")
            ]);

            let destTable = HashMap::from
            ([
                ("000", ""),
                ("001", "M="),
                ("010", "D="),
                ("011", "DM="),
                ("100", "A="),
                ("101", "AM="),
                ("110", "AD="),
                ("111", "ADM=")
            ]);

            let jumpTable = HashMap::from
            ([
                ("000", ""),
                ("001", ";JGT"),
                ("010", ";JEQ"),
                ("011", ";JGE"),
                ("100", ";JLT"),
                ("101", ";JNE"),
                ("110", ";JLE"),
                ("111", ";JMP")
            ]);


            for line in Lines.lines() 
            {                
                let line = line.unwrap();

                if line.chars().count() == 0 {
                    continue;
                }

                if line.chars().nth(0).unwrap() != '1' {

                    let value = isize::from_str_radix(&line[1..16], 2).unwrap();

                    let newAValue = format!("@{}\n", value);

                    hackList.push(newAValue);
                }
                else {

                    let cBit = &line[3..10];
                    let dBit = &line[10..13];
                    let jBit = &line[13..16];

                    let compValue = compTable.get(cBit).unwrap();
                    let destValue = destTable.get(dBit).unwrap();
                    let jumpValue = jumpTable.get(jBit).unwrap();

                    let combinedValue = format!("{}{}{}\n", destValue, compValue, jumpValue);

                    hackList.push(combinedValue);
                }
            }

            file = File::create(args[1].replace(".hack", ".asm")).expect("Unable to create file");

            if let Err(e) = write!(file, "{}", hackList.join(""))
            {
                println!("Writing error: {}", e.to_string());
            }
        }
    }
}
