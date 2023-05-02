#Implementation of CORDIC Algorithm in RISC-V Assembly using fixed-point arithmetic
#Author: Konrad Jurczyñski-Chu
#Input in pi radians [-1, 1)*pi
#n = 32 rotations
.data
ARCTAN_ARR: .word 0x0ee6b280,0x57f77910,0x2e7aabc7,0x1797f381,0x0bd7b23b,0x05ed5376,0x02f6d920,0x017b727d,0x00bdb9fc,0x005edd16,0x002f6e8d,0x0017b747,0x000bdba3,0x0005edd1,0x0002f6e8,0x00017b74,0x0000bdba,0x00005edd,0x00002f6e,0x000017b7,0x00000bdb,0x000005ed,0x000002f6,0x0000017b,0x000000bd,0x0000005e,0x0000002f,0x00000017,0x0000000b,0x00000005,0x00000002,0x00000001
PI: .word 
angle: .word 
sine: .word

.text
#step 1 - convert input to radians
#step 2 - compute the sine/cosine

	li t0, 32
main_loop:
	
	addi t0, -1
	bnez t0, main_loop
	
