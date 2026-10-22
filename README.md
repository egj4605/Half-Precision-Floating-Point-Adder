# Half-Precision-Floating-Point-Adder
For my term project, I created a Floating-Point Adder Calculator with a
KeyPad and HexBoard to input and display the output value after the calculations.
The overall structure of the project had me first figure out the
HalfPrecisionFloatingPointAddSub module, which includes everything required to
add any two numbers by handling logical shifting, incrementing, etc., through a
Half-Precision Floating-Point Number Format of a 16-bit binary input value of the
two A and B inputs to be able to calculate the addition of any two values, and then
output the result. Once I figured out this calculation module, I needed to then
implement the input feature using the keypad keys and implement the output
feature using the hexboard display, as well as additional keys. The keys I used for
this project handled each input and result by loading each one sequentially with
key2, key3, and key4 as specified. Additionally, I had a reset key at key0 to be able
to clear the input/output value to start the next calculation. The inputs and results
shown are all implemented and displayed in Hexadecimal, but handled through
adjusting the binary values of the inputs and outputs. 
