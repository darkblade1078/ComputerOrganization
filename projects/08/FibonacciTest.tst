
load FibonacciTest.hack,
output-file FibonacciTest.out,
compare-to FibonacciTest.cmp,
output-list RAM[8]%D2.6.2 RAM[32]%D2.6.2 RAM[35]%D2.6.2 RAM[38]%D2.6.2 RAM[41]%D2.6.2 RAM[44]%D2.6.2 RAM[47]%D2.6.2 RAM[50]%D2.6.2 ;

set RAM[0] 1023,
set RAM[1] 0,

set RAM[6] 32,
set RAM[7] 35,
set RAM[8] 0,

set RAM[32] 0,
set RAM[33] 1,
set RAM[35] 0,
set RAM[38] 0,
set RAM[41] 0,
set RAM[44] 0,
set RAM[47] 0,
set RAM[50] 0,

repeat 5000 {
  ticktock;
}
output;

set PC 0,
set RAM[6] 32,
set RAM[7] 41,
set RAM[8] 0,

set RAM[32] 0,
set RAM[33] 1,
set RAM[35] 0,
set RAM[38] 0,
set RAM[41] 0,
set RAM[44] 0,
set RAM[47] 0,
set RAM[50] 0,

repeat 10000 {
   ticktock ;
}
output;

set PC 0,
set RAM[6] 32,
set RAM[7] 50,
set RAM[8] 0,

set RAM[32] 0,
set RAM[33] 1,
set RAM[35] 0,
set RAM[38] 0,
set RAM[41] 0,
set RAM[44] 0,
set RAM[47] 0,
set RAM[50] 0,

repeat 10000 {
   ticktock ;
}
output;


