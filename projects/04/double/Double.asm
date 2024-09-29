// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/QU02/double/Double.asm

// Doubles R0 and stores the result in R1.
// (R0, R1 refer to RAM[0] and RAM[1] respectively.)

// Put your code here.
@0
D=M //loads the value of R0 into our data register
D=D+M //loads the current value of our data register plus R0

@1
M=D //loads our value into R1