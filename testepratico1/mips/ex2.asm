# Mapa de registos
# i:		$t0
# v:		$t1
# &(val[0]):	$t2
# val:		$t3
# val[i]:	$t4
# val+i+SIZE/2:	$t5
# val[i+SIZE/2]:$t6	
	.data
	.eqv	SIZE,	32
	.eqv	SIZE_2, 16
	.eqv	print_string,	4
	.eqv	print_int10,	1
	.eqv	print_char,	11
val:	.word 	8, 4, 15, -1987, 327, -9, 27, 16
str1:	.asciiz	"Result is: "
	.text
	.globl 	main
	
main:					# void main(void) {
	li	$t0,0			# 	i = 0;
	
	la	$t3,val			#	// $t3 = val
	
do1:					# 	do {
	addu	$t4,$t3,$t0		#		// $t4 = val+i
	lw	$t1,0($t4)		#		v = val[i];
	
	addiu	$t5,$t4,SIZE_2		#		// $t5 = val+i+SIZE/2		
	lw	$t6,0($t5)		#		// $t6 = val[i+SIZE/2]
	
	sw	$t6,0($t4)		#		val[i] = val[i+SIZE/2];
	sw	$t1,0($t5)		#		val[i+SIZE/2] = v;		
		
while1:	addiu	$t0,$t0,4		#		i++;	
	blt	$t0,16,do1		#	} while(i < (SIZE/2));
	
	la	$a0,str1
	li	$v0,print_string
	syscall				#	print_string("Result is: ");
	
	li	$t0,0			#	i = 0;
	
do2:					#	do {
	addu	$t4,$t3,$t0		#		// $t4 = val+i
	lw	$a0,0($t4)		#		// $a0 = val[i]
	li	$v0,print_int10
	syscall				#		print_int10(val[i]);	

	addiu	$t0,$t0,4		#		i++;

	li	$a0,','
	li	$v0,print_char
	syscall				#		print_char(',');
while2:	
	blt	$t0,SIZE,do2		#	} while(i < SIZE);
	jr	$ra