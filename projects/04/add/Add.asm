// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/QU02/add/Add.asm

// Adds R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
@0
D = M //set our data register to the value of RAM[0]

@1
D = D + M //add the value of RAM[1] to our data register

@2
M = D //add the value of our data register to RAM[2]