#Implementation of CORDIC Algorithm in RISC-V Assembly using fixed-point arithmetic
#Author: Konrad Jurczynski-Chu
#Input in pi radians [-1, 1)*pi
#n = 30 rotations
.data
ARCTAN_ARR: .word 0x20000000,0x12e4051d,0x09fb385b,0x051111d4,0x028b0d43,0x0145d7e1,0x00a2f61e,0x00517c55,0x0028be53,0x00145f2e,0x000a2f98,0x000517cc,0x00028be6,0x000145f3,0x0000a2f9,0x0000517c,0x000028be,0x0000145f,0x00000a2f,0x00000517,0x0000028b,0x00000145,0x000000a2,0x00000051,0x00000028,0x00000014,0x0000000a,0x00000005,0x00000002,0x00000001,0x00000000,0x00000000
cos: .word 0x48cb2087 #x = k constant
sin: .word 0 #y
angle: .word 0x20000000 #45 deg
msg_sin: .asciz "SINUS\n"
msg_cos: .asciz "\nCOSINUS\n"
msg_sin1: .asciz "\nSINUS ADJUSTED\n"
msg_cos1: .asciz "\nCOSINUS ADJUSTED\n"

.text
#t5, t6 rejestry do operacji
	li t0, 0 #loop counter
	la t1, ARCTAN_ARR #array begin
	
main_loop:
	lw t2, angle
	lw t6, (t1)
	bgtz t2, angle_positive
angle_not_positive: #d = -1
	add t2, t2, t6 #add angle
	sw t2, angle, t4
	#calculate new x
	lw t4, sin #y
	lw t5, cos #x
	sra t4, t4, t0 #y/2^i
	add t4, t4, t5   
	sw t4, cos, t3 #save x
	
	#calculate new y
	lw t4, sin #y, x is in t5
	sra t5, t5, t0 #x/2^i
	sub t5, t4, t5
	sw t5, sin, t4 #save y 	
	
	b loop_end
angle_positive: #d = 1
	sub t2, t2, t6
	sw t2, angle, t4
	#calculate new x
	lw t4, sin #y
	lw t5, cos #x
	sra t4, t4, t0 #y/2^i
	sub t4, t5, t4   
	sw t4, cos, t3 #save x
	
	#calculate new y
	lw t4, sin #y, x is in t5
	sra t5, t5, t0 #x/2^i
	add t5, t4, t5
	sw t5, sin, t4 #save y 	

loop_end:
	addi t0, t0, 1
	addi t1, t1, 4
	li t3, 32
	bne t0, t3, main_loop
	
	
end:
#end main_loop
	
	li a7, 4
	la a0, msg_sin
	ecall
	
	li a7, 1
	lw a0, sin
	ecall
	
	li a7, 4
	la a0, msg_sin1
	ecall
	
	li a7, 1
	li t2, 0
	lw t0, sin
	srai t1, t0, 2
	add t2, t2, t1
	srai t1, t0, 3
	add t2, t2, t1
	srai t1, t0, 4
	add t2, t2, t1
	srai t1, t0, 6
	add t2, t2, t1
	srai t1, t0, 7
	add t2, t2, t1	
	srai t1, t0, 8
	add t2, t2, t1
	srai t1, t0, 13
	add t2, t2, t1
	srai t1, t0, 15
	add t2, t2, t1
	srai t1, t0, 19
	add t2, t2, t1
	srai t1, t0, 20
	add t2, t2, t1
	srai t1, t0, 21
	add t2, t2, t1
	srai t1, t0, 22
	add t2, t2, t1
	srai t1, t0, 24
	add t2, t2, t1
	srai t1, t0, 26
	add t2, t2, t1
	srai t1, t0, 27
	add t2, t2, t1
	srai t1, t0, 28
	add t2, t2, t1
	mv a0, t2
	ecall
	
	li a7, 4
	la a0, msg_cos
	ecall
	
	li a7, 1
	lw a0, cos
	ecall
	
	li a7, 4
	la a0, msg_cos1
	ecall
	
	li a7, 1
	li t2, 0
	lw t0, cos
	srai t1, t0, 2
	add t2, t2, t1
	srai t1, t0, 3
	add t2, t2, t1
	srai t1, t0, 4
	add t2, t2, t1
	srai t1, t0, 6
	add t2, t2, t1
	srai t1, t0, 7
	add t2, t2, t1	
	srai t1, t0, 8
	add t2, t2, t1
	srai t1, t0, 13
	add t2, t2, t1
	srai t1, t0, 15
	add t2, t2, t1
	srai t1, t0, 19
	add t2, t2, t1
	srai t1, t0, 20
	add t2, t2, t1
	srai t1, t0, 21
	add t2, t2, t1
	srai t1, t0, 22
	add t2, t2, t1
	srai t1, t0, 24
	add t2, t2, t1
	srai t1, t0, 26
	add t2, t2, t1
	srai t1, t0, 27
	add t2, t2, t1
	srai t1, t0, 28
	add t2, t2, t1
	mv a0, t2
	ecall
	
	li a7, 10
	ecall
	
	
	
	
	
