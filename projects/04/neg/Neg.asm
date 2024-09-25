// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/QU02/neg/Neg.asm

// Negates R0 and stores the result in R1.
// (R0, R1 refer to RAM[0] and RAM[1] respectively.)

// Put your code here.
@0
D = M //set our data register to the value of RAM[0]

@1
M = -D //apparently we can just put a negative infront of our data register and that makes it negative :skull: