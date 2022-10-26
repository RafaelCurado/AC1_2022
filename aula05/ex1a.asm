# i: 		$t0
# lista: 	$t1
# lista + i: 	$t2

	.data
	.eqv 	SIZE,	5
	.eqv	read_int,	5
	.eqv	print_string,	4
lista:	.space	20
str1:	.asciiz	"\nIntroduza um numero: "
 	.text
 	.globl 	main
 	
main:	
	li	$t0,0			# i = 0;
	la	$t1,lista		# $t1 = lista
	
	li	$t3,SIZE		
	mul	$t3,$t3,4		# $t3 = SIZE * 4	

for:	bge	$t0,$t3,e_for		# while( i < SIZE ) {
	
	la	$a0,str1	
	li	$v0,print_string
	syscall				# 	print_string("\nIntroduza um numero: ")
	
	li	$v0,read_int
	syscall				# 	read_int();
		
	add	$t2,$t1,$t0		# 	// $t2 = lista+i
	sw	$v0,0($t2)		#	lista[i] = read_int();
	
	
	addiu	$t0,$t0,4		# 	i++;
	j	for			# }
e_for:	
	jr	$ra			#	// fim do programa