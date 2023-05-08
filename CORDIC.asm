#Implementation of CORDIC Algorithm in RISC-V Assembly using fixed-point arithmetic
#Author: Konrad Jurczynski-Chu
#Input in pi radians [-1, 1)*pi
#n = 30 rotations
.data
ARCTAN_ARR: .word 0x3243F6A8, 0x1DAC6705, 0x0FADBAFC, 0x07F56EA6, 0x03FEAB76, 0x01FFD55B, 0x00FFFAAA, 0x007FFF55, 0x003FFFEA, 0x001FFFFD, 0x000FFFFF, 0x0007FFFF, 0x0003FFFF, 0x0001FFFF, 0x0000FFFF, 0x00007FFF, 0x00003FFF, 0x00001FFF, 0x00000FFF, 0x000007FF, 0x000003FF, 0x000001FF, 0x000000FF, 0x0000007F, 0x0000003F, 0x0000001F, 0x0000000F, 0x00000008, 0x00000004, 0x00000002, 0x00000001, 0x00000000
cos: .word 0x26DD3B6A #x = k constant
sin: .word 0 #y
angle: .word 0x0 #45 deg
msg_sin: .asciz "SINUS\n"
msg_cos: .asciz "\nCOSINUS\n"

.text
#t5, t6 rejestry do operacji
	li t0, 1 #loop counter
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
	la a0, msg_cos
	ecall
	
	li a7, 1
	lw a0, cos
	ecall
	
	li a7, 10
	ecall
	
	
	
	
	
