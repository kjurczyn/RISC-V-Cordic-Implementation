#Implementation of CORDIC Algorithm in RISC-V Assembly using fixed-point arithmetic
#Author: Konrad Jurczynski-Chu
#Input in pi radians [-1, 1)*pi
#n = 30 rotations
.data
ARCTAN_ARR: .word 0x0ee6b280,0x57f77910,0x2e7aabc7,0x1797f381,0x0bd7b23b,0x05ed5376,0x02f6d920,0x017b727d,0x00bdb9fc,0x005edd16,0x002f6e8d,0x0017b747,0x000bdba3,0x0005edd1,0x0002f6e8,0x00017b74,0x0000bdba,0x00005edd,0x00002f6e,0x000017b7,0x00000bdb,0x000005ed,0x000002f6,0x0000017b,0x000000bd,0x0000005e,0x0000002f,0x00000017,0x0000000b,0x00000005,0x00000002
cos: .word 0x21e5a842 #x
sin: .word 0 #y
angle: .word 0x0 #45deg = 0.25 pi rad
msg_sin: .asciz "SINUS\n"
msg_cos: .asciz "COSINUS\n"
newline: .asciz "\n"

.text
#t5, t6 rejestry do operacji
	li t0, 0 #loop counter
	la t1, ARCTAN_ARR #array begin
	
	
main_loop:
	addi t0, t0, 1
	lw t2, angle #t2 := current angle
	srai t3, t2, 31 #t3 := bitmask
	srli t5, t2, 31 #t5 := sign
	
	#computing new x
	lw t4, sin #t4 := current y
	lw t6, cos # t6 := current x
	mv a3, t6 #a3 := current x
	sra t4, t4, t0 # t4 := y/2^i
	xor t4, t4, t3
	add t4, t4, t5 # t4 := y/2^i * sign
	sub t6, t6, t4 # t6 := x - y/2^i * sign
	sw  t6, cos, a2 # store new x into memory
	
	#computing new y
	lw t4, sin # t4 := current y
	mv t6, a3 #t6 := old(current) x
	sra t6, t6, t0 # t6 := x/2^i
	xor t6, t6, t3 
	add t6, t6, t5 # t6 := x/2^i * sign
	add t4, t4, t6 # t4 := y + x/2^i * sign
	sw t4, sin, a2 # store new y into memory
	
	#computing new beta
	lw t4, (t1) # t4 := arctan_arr[i]
	xor t4, t4, t3
	add t4, t4, t5 # t4 := sign * arctan_arr[i]
	sub t2, t2, t4
	sw t2, angle, a2
	
	#loop end
	addi t1, t1, 4
	li t4, 32
	blt t0, t4, main_loop
#end main_loop
	
	li a7, 4
	la a0, msg_sin
	ecall
	
	li a7, 1
	lw a0, sin
	ecall
	
	li a7, 4
	la a0, newline
	ecall
	
	li a7, 4
	la a0, msg_cos
	ecall
	
	li a7, 1
	lw a0, cos
	ecall
	
	li a7, 10
	ecall
