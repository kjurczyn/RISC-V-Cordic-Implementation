# RISC-V CORDIC Implememtation
Calculating sine and cosine of angles using the CORDIC algorithm <br />
Author: Konrad Jurczyński-Chu

### Angles 
- 32-bit words, oldest 1 bit is integer part, remaining 31 bits fraction part, using 2s complement representation
- Units: rad/(pi/2)
### Calculations
- Permitted operations: addition, subtraction, bitshift
- No floating point numbers
### Input
- Passed in angles, covnerted to rad/(pi/2) through division by 90 using bitshift
### Output
- Fraction part (output should be divided by 10^9)
### Versions
- Branches version uses checks and branches to perform correct operation
- [<b>Broken</b>] XOR version uses bitwise logic operations which produces the same result as the desired operation 
### Angle values and k-constant
- Angle values, the k-constant and multiplier were generated using arctan_angles.py 
- K-constant = 0x4dba76d4
- Multiplier = 2147483648 (divide the unadjusted reults by this)
- Angles (in radians/(pi/2)): 0x40000000,0x25c80a3b,0x13f670b6,0x0a2223a8,0x05161a86,0x028bafc2,0x0145ec3c,0x00a2f8aa,0x00517ca6,0x0028be5d,0x00145f30,0x000a2f98,0x000517cc,0x00028be6,0x000145f3,0x0000a2f9,0x0000517c,0x000028be,0x0000145f,0x00000a2f,0x00000517,0x0000028b,0x00000145,0x000000a2,0x00000051,0x00000028,0x00000014,0x0000000a,0x00000005,0x00000002,0x00000001,0x00000000
