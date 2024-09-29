// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
@0
D=M //load R0 into our data register

@i
M=D //set i to R0

@1
D=M //load R1 into our data register

@VALUE
M=D //store R1 into our VALUE

//start loop
(LOOP)
@0
D=M //loads the value of R0 into our data register

@VALUE
M=D+M //loads the current value of our data register plus R0

@i
D=M //load i into our data register

@END
D; JEQ //jump to the end if i == 0

@i
M=M-1 //decriment i by 1

@LOOP
0; JMP //jumps back to LOOP until our condition is met

//end loop
(END)