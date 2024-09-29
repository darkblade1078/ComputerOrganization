// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/QU02/loop/Loop.asm

// Loops R0 times and stores -1 in R1 upon completion.
// (R0, R1 refer to RAM[0] and RAM[1] respectively.)
// (LOOP and END refer to labels to be jumped to.)
// (i refers to the variable used for the counter.)

// Basic Direction:
// Initialize the i counter variable outside of the loop and set it to 0.
// (This is to account for repeated runs via the CPUEmulator. It's a safety
// net for reseting the memory value at your variable.)

// Begin LOOP

//   Store value in i to D register to use for later
//   Store the difference of R0 and i (R0 - i)

//   CONDITIONAL STATEMENT
//   if (R0 - i) <= 0 goto END

//   else (this stays in loop after the CONDITIONAL JUMP)
//   Increment i

//   goto LOOP (Restarts LOOP)

// End LOOP 

// Begin END 

//  Store value of i in D register
//  Store value in D register in R1

// End END

// Put your code here.
@i
M=0 //set i to 0

//start loop
(LOOP)
@0
D=M //R0 is how many times we are going to loop

@i
D=D-M //get the difference between R0 and i

@END
D; JEQ //jump to the end if R0 == 0

@i
M=M+1 //incriment i by 1

@LOOP
0; JMP //jumps back to LOOP until our condition is met

//end loop
(END)
@i
D=M //load i into our data register

@1
M=D //load i from our data register into R1