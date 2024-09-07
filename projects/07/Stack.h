// Note for this the stack will be starting at the top of memory and building
// down.  These are the basic stack operations that will be implemented

//-----------------------------------------------------------------------------
// Push D register onto the stack, D remains unchanged by ths operation
$def pushD
// goes to SP

// pushes D onto stack

// decrements SP

$end

//-----------------------------------------------------------------------------
// Push A register onto the stack, D is value pushed on the stack after this
// operation
$def pushA
// saves A to D then pushes D

$end

//-----------------------------------------------------------------------------
// Pop the top of stack into the A and D registers
$def popAD
// increments SP

// goes to last value in the stack

// saves value to D reg and A reg

$end

//-----------------------------------------------------------------------------
// Use push value, push ptr, setPTR pops these off of stack and
// sets *ptr=value
$def setPTR
// pop ptr (store in R15)

// pop value (store in D reg)

// saves the value (D reg) in the pointer (R15) 

$end

//-----------------------------------------------------------------------------
// get pointer pops pointer off of the stack then push *ptr onto the
// stack
$def getPTR
// pops the stack into A and D

// sets the D reg to value at the pointer

// pushes the D reg onto the stack

$end

//-----------------------------------------------------------------------------
// store register D in the local variable id defined by *(LCL-id)
$def setLocal id
// saves D reg into stack

// saves the id num

// pushes to LCL-id onto stack

// sets the value

$end

//-----------------------------------------------------------------------------
// get the local variable id defined by *(LCL-id) into registers A and D
$def getLocal id
// saves the id num

// goes to LCL-id

// saves the value at LCL-id to AD

$end

//-----------------------------------------------------------------------------
// set the argument id (defined by *(ARG-id)) to the value stored in register D
$def setArgument id
// saves D reg into stack

// saves the id num

// pushes to ARG-id onto stack

// sets the value

$end

//-----------------------------------------------------------------------------
// get argument id (defined by *(ARG-id)) and store in registers A and D
$def getArgument id
// saves the id num

// goes to ARG-id

// saves the value at ARG-id to AD

$end

