// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(RESTART)
@SCREEN //get value of where our screen begins
D=A

@position //set pointer of our variable to SCREEN
M=D

(KBDCHECK) //check if keyboard is being pressed
@KBD //get input from keyboard
D=M

@BLACK //if the keyboard input > 0, then go to black
D; JGT

@WHITE //else go to white
0; JMP 

(BLACK) //fill black
@position //get value position
D=M

@KBD //check if our current pixel is at KBD
D=A-D

@RESTART //restart if our position is at the KBD position in memory
D; JLE

@position //set pixel to black
A=M
M=-1

@position //move to next pixel
M=M+1

@KBDCHECK //jmp to KBDCHECK
0; JMP

(WHITE) //fill white
@position //get value position
D=M

@KBD //check if our current pixel is at KBD
D=A-D

@RESTART //restart if our position is at the KBD position in memory
D; JLE

@position //set pixel to white
A=M
M=0

@position //move to next pixel
M=M+1

@KBDCHECK //jmp to KBDCHECK
0; JMP