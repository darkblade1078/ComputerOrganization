// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

@SUM //Initialize sum variable
M = 0

@0 //Load value from R0
D=M

@END //End prorgam if R0 = 0
D; JEQ

@1 //Load value from R1
D=M

@END //End prorgam if R1 = 0
D; JEQ

(LOOP) //LOOP
@0 //Load value from R0
D=M

@SUM //Add R0 to our sum
M=D+M

@1 //Load (R1 - 1) into our M and D register
MD=M-1

@LOOP //Jump back to LOOP if R1 != 0
D; JNE

(END) //END
@SUM //Load sum into our D registers
D=M

@2 //Load sum into R2
M=D