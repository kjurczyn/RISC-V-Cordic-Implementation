#Implementation of CORDIC Algorithm in RISC-V Assembly using fixed-point arithmetic
#Author: Konrad Jurczyñski-Chu
#numbers - 32bit word
#accepts angles from -90 to 90 
#n = 32 rotations
.data
val_list: .word 
pi: .word 
angle: .word 
sine: .word

.text
#step 1 - convert input to radians
#step 2 - compute the sine/cosine