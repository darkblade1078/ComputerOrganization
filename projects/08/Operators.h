$include Stack.h

//-----------------------------------------------------------------------------
// pop two items off of the stack, add them and push the result on the stack
$def add
// pop ptr (store in R15)
$popAD
@R15
M=D
// pop value (store in D reg)
$popAD
// get value from R15
@R15
// adds x and y
D=D+M
// pushes X + Y
$pushD
$end

//-----------------------------------------------------------------------------
// pop two items off of the stack and subtract them, push result onto stack
$def sub
// pop ptr (store in R15)
$popAD
@R15
M=D
// pop value (store in D reg)
$popAD
// get value from R15
@R15
// subtracts x and y
D=D-M
// pushes X - Y
$pushD
$end

//-----------------------------------------------------------------------------
// Pop the top of the stack and push its bitwise complement on the stack
$def not
$popAD
D=!D
$pushD
$end

//-----------------------------------------------------------------------------
// Pop the top of the stack and push its negation on the stack
$def neg
$popAD
D=-D
$pushD
$end

// comparison operators
//-----------------------------------------------------------------------------
// pop two elements of off the stack and push -1 if they are equal, 0 otherwise
$def eq
// subtracts the two values and pops the result
$sub
$popAD
// jump to TRUE if the result is 0
@TRUE
D;JEQ
// jump to FALSE otherwise
@FALSE
0;JMP
// D=-1 if x==y else D=0
(TRUE)
D=-1
// jump to end
@EXIT
0;JMP
(FALSE)
D=0
(EXIT)
// pushes result onto stack
$pushD
$end

//-----------------------------------------------------------------------------
// Pop a, pop b if b<a push -1 else push 0
$def lt
// subtracts the two values and pops the result
$sub
$popAD
// jump to TRUE if the result is < 0
@TRUE
D;JLT
// jump to FALSE otherwise
@FALSE
0;JMP
// D=-1 if x-y<0 else D=0
(TRUE)
D=-1
// jump to end
@EXIT
0;JMP
(FALSE)
D=0
(EXIT)
// pushes result onto stack
$pushD
$end

//-----------------------------------------------------------------------------
// Pop a, pop b if b>a push -1 else push 0
$def gt
// subtracts the two values and pops the result
$sub
$popAD
// jump to TRUE if the result is > 0
@TRUE
D;JGT
// jump to FALSE otherwise
@FALSE
0;JMP
// D=-1 if x-y>0 else D=0
(TRUE)
D=-1
// jump to end
@EXIT
0;JMP
(FALSE)
D=0
(EXIT)
// pushes result onto stack
$pushD
$end

//-----------------------------------------------------------------------------
// pop two values of the stack and push their bitwise and
$def and
// pop ptr (store in R15)
$popAD
@R15
M=D
// pop value (store in D reg)
$popAD
// get value from R15
@R15
// ands x and y
D=D&M
// pushes X & Y
$pushD
$end

//-----------------------------------------------------------------------------
// pop a, pop b, push a|b
$def or
// pop ptr (store in R15)
$popAD
@R15
M=D
// pop value (store in D reg)
$popAD
// get value from R15
@R15
// ors x and y
D=D|M
// pushes X | Y
$pushD
$end

//-----------------------------------------------------------------------------
// Go into infinite loop to halt the program
$def halt
@HALT
(HALT)
0;JMP
$end
