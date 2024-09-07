$include Operators.h

//-----------------------------------------------------------------------------
// Push the return address on the stack
// Jump to procedure
// On return, pop nargs-1 arguments off of stack
$def procedureCall nargs procedure
// Push return address onto stack

// Jump to procedure

// Return here

// Remove nargs-1 arguments off of the stack

// Add D to SP to pop off consumed arguments

$end

//-----------------------------------------------------------------------------
// Return from procedure, pop return address off of stack and jump to it.
// Has the effect of returning control flow to the calling procedure
$def return
// pops the address and unconditionally jumps to it

$end

//-----------------------------------------------------------------------------
// Push LCL, ARG, THIS, and THAT onto the stack
// adjust LCL pointer to point to local variable segment
// adjust ARG pointer to point to argument variable segment
$def pushFrame nargs nlocals
// Push LCL

// Push ARG

// Push THIS

// Push THAT

// sets LCL to SP

// moves SP down by nlocals

// sets ARG to LCL+5+nargs

$end

//-----------------------------------------------------------------------------
// Restore LCL, ARG, THIS and THAT pointers to Caller values
// reset SP to the same value as when pushFrame was executed
$def popFrame nargs nlocals
// Restore SP to when stack frame was initialized

// Pop THAT

// Pop THIS

// Pop ARG

// Pop LCL

$end
