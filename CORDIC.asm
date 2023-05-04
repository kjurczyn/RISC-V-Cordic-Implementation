#Implementation of CORDIC Algorithm in RISC-V Assembly using fixed-point arithmetic
#Author: Konrad Jurczyñski-Chu
#Input in pi radians [-1, 1)*pi
#n = 32 rotations
.data
ARCTAN_ARR: .word 0x0ee6b280,0x57f77910,0x2e7aabc7,0x1797f381,0x0bd7b23b,0x05ed5376,0x02f6d920,0x017b727d,0x00bdb9fc,0x005edd16,0x002f6e8d,0x0017b747,0x000bdba3,0x0005edd1,0x0002f6e8,0x00017b74,0x0000bdba,0x00005edd,0x00002f6e,0x000017b7,0x00000bdb,0x000005ed,0x000002f6,0x0000017b,0x000000bd,0x0000005e,0x0000002f,0x00000017,0x0000000b,0x00000005,0x00000002
#PI: .word 
N: 31 #(n-1)
angle: .word 0x0 #45deg = 0.25 pi rad

.text
#step 1 - convert input to radians
#step 2 - compute the sine/cosine
	lw t1, angle
	li t2, 0 #angles sum
	la t3, ARCTAN_ARR # array end
	addi t3, t3, 121
	la t4, ARCTAN_ARR #array current
	li a3, 0x80000000 #number to be added/subtracted to/from current x and y
	li a4, 0 #x (cos)
	li a5, 0 #y
	
	
	
main_loop:
	lw a6, (t4) #a6 = current atan angle
	bgt t2, t1, subtract_angle
	beq t2, t1, end
	
	
add_angle:
	add t2, t2, a6
	sub a4, a4, a3
	add a5, a5, a3
	b loop_end

subtract_angle:
	sub t2, t2, a6
	add a4, a4, a3
	sub a5, a5, a3
	
loop_end:

	srli a3, a3, 1
	addi t4, t4, 4
	blt t4, t3, main_loop
	
end:
	li a7, 1
	mv a0, a5
	ecall