$include Operators.h

//-----------------------------------------------------------------------------
// Push the return address on the stack
// Jump to procedure
// On return, pop nargs-1 arguments off of stack
$def procedureCall nargs procedure
// Push return address onto stack
@RETURN 
$pushA
// Jump to procedure
@procedure
0;JMP
// Return here
(RETURN)
// Remove nargs-1 arguments off of the stack
@nargs
D=A-1
// Add D to SP to pop off consumed arguments
@SP
M=D+M
$end

//-----------------------------------------------------------------------------
// Return from procedure, pop return address off of stack and jump to it.
// Has the effect of returning control flow to the calling procedure
$def return
// pops the address and unconditionally jumps to it
$popAD
0;JMP
$end

//-----------------------------------------------------------------------------
// Push LCL, ARG, THIS, and THAT onto the stack
// adjust ARG pointer to point to argument variable segment
// adjust LCL pointer to point to local variable segment
$def pushFrame nargs nlocals
// Push LCL
@LCL
D=M
$pushD
// Push ARG
@ARG
D=M
$pushD
// Push THIS
@THIS
D=M
$pushD
// Push THAT
@THAT
D=M
$pushD
// sets LCL to SP
@SP
D=M
@LCL
M=D
// moves SP down by nlocals
@nlocals
D=A 
@SP
M=M-D
// sets ARG to LCL+5+nargs
@LCL
D=M
@5
D=D+A
@nargs
D=D+A
@ARG
M=D
$end

//-----------------------------------------------------------------------------
// Restore LCL, ARG, THIS and THAT pointers to Caller values
// reset SP to the same value as when pushFrame was executed
$def popFrame nargs nlocals
// Restore SP to when stack frame was initialized
@LCL
D=M 
@SP
M=D
// Pop THAT
$popAD
@THAT
M=D
// Pop THIS
$popAD
@THIS
M=D
// Pop ARG
$popAD
@ARG
M=D
// Pop LCL
$popAD
@LCL
M=D
$end
