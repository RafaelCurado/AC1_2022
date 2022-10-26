# Mapa de registos
# p: 		$t0
# pultimo:	$t1
# *p: 		$t2
# soma: 	$t3

	.data
	.eqv	SIZE, 4
	.eqv 	print_int10, 1
array:	.word	7692, 23, 5, 234
	.text
	.globl 	main
	
main:	li	$t3, 0			# soma = 0;
	la	$t0,array		# $t0 = p
	
	li	$t4,SIZE
	sub	$t4,$t4,1
	sll	$t4,$t4,2		# $t4 = 3*4 = 12
	addu	$t1,$t0,$t4		# pultimo = array+SIZE-1

while:	bgt	$t0,$t1,endw		# while( p <= pultimo) {
	
	lw	$t2,0($t0)		#	
	addu	$t3,$t3,$t2		# 	soma = soma + (*p)
	
	addiu	$t0,$t0,4		#	p++;

	j	while			# }
	
endw:	move	$a0,$t3
	li	$v0,print_int10
	syscall				# print_int10(soma);
	
	jr	$ra			#	-- fim do programa -- 