# Mapa de registos
# soma:		$t0
# i:		$t1
# array:	$t2
# array+i:	$t3
# array[i]:	$t4
# SIZE:		$t5


	.data
	.eqv	SIZE, 4
	.eqv 	print_int10, 1
array:	.word	7692, 23, 5, 234
	.text
	.globl 	main
	
main:	li	$t0, 0			# soma = 0;
	li	$t1, 0			# i = 0;
	
	li	$t5, SIZE		# $t5 = SIZE
	sll	$t5,$t5, 2		# $t5 = SIZE*4
	
	la	$t2,array		# $t2 = array
	
	
while:	bge	$t1,$t5,endw		# while( i < SIZE) {
	
	addu	$t3,$t2,$t1		#	$t3 = array+i
	lw	$t4,0($t3)		#	$t4 = array[i]
	
	addu	$t0,$t0,$t4		# 	soma = soma + array[i]
	
	addiu	$t1,$t1,4		#	i++;

	j	while			# }
	
endw:	move	$a0,$t0
	li	$v0,print_int10
	syscall				# print_int10(soma);
	
	jr	$ra			#	-- fim do programa -- 