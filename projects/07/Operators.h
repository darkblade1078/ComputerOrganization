$include Stack.h

//-----------------------------------------------------------------------------
// Arithmetic Operators
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Pop two items off of the stack (x and y), add them and push the result (x+y) on the stack
$def add
// pop ptr (store in R15)

// pop value (store in D reg)

// get value from R15

// add x and y

// pushes x+y

$end

//-----------------------------------------------------------------------------
// Pop two items off of the stack (x and y), subtract them and push result (x-y) onto stack
$def sub
// pop ptr (store in R15)

// pop value (store in D reg)

// get value from R15

// subtract x and y

// pushes X - Y

$end

//-----------------------------------------------------------------------------
// Pop one item off of the stack (x), negate it and push result (-x) onto stack
$def neg
// pop value (store in D reg)

// negate x

// pushes -x

$end

//-----------------------------------------------------------------------------
// Comparison Operators
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Pop two items off of the stack (x and y), if x==y push -1 ; else push 0
$def eq
// subtracts the two values and pops the result

// jump to TRUE if the result is 0

// jump to FALSE otherwise

// D=-1 if x==y else D=0

// jump to end

// pushes result onto stack

$end

//-----------------------------------------------------------------------------
// Pop two items off of the stack (x and y), if y<x push -1 ; else push 0
$def lt
// subtracts the two values and pops the result

// jump to TRUE if the result is < 0

// jump to FALSE otherwise

// D=-1 if x-y<0 else D=0

// jump to end

// pushes result onto stack

$end

//-----------------------------------------------------------------------------
// Pop two items off of the stack (x and y), if y>x push -1 ; else push 0
$def gt
// subtracts the two values and pops the result

// jump to TRUE if the result is > 0

// jump to FALSE otherwise

// D=-1 if x-y>0 else D=0

// jump to end

// pushes result onto stack

$end

//-----------------------------------------------------------------------------
// Boolean Operators
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Pop two items off of the stack (x and y), bitwise-and them and push result (x&y) onto stack
$def and
// pop ptr (store in R15)

// pop value (store in D reg)

// get value from R15

// and x and y

// pushes x&y

$end

//-----------------------------------------------------------------------------
// Pop two items off of the stack (x and y), bitwise-or them and push result (x|y) onto stack
$def or
// pop ptr (store in R15)

// pop value (store in D reg)

// get value from R15

// or x and y

// pushes x|y

$end

//-----------------------------------------------------------------------------
// Pop one item off of the stack (x), bitwise-not it and push result (!x) onto stack
$def not
// pop value (store in D reg)

// not x

// pushes !x

$end

//-----------------------------------------------------------------------------
// Go into infinite loop to halt the program
$def halt

$end
