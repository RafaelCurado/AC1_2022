# Mapa de registos:
# p:	$t0
# *P:	$t1
# lista+Size: 	$t2
	
	.data
lista:	.word 	8, -4, 3, 5, 124, -15, 87, 9, 27, 15
str1:	.asciiz	"\nConteudo do array:\n"
str2:	.asciiz	"; "
	.eqv	SIZE, 40
	.eqv	print_int10,	1
	.eqv	print_string,	4
	.text
	.globl main
	
main:	la	$t0,lista		# // $t0 = lista
	addiu	$t2,$t0,SIZE		# // $t2 = lista+SIZE
	
for:	bge	$t0,$t2,e_for		# while(p < lista + SIZE) {
	
	lw	$t1,0($t0)		#	// $t1 = *p
	
	move	$a0,$t1
	li	$v0,print_int10
	syscall				#	print_int10( *p );
	
	la	$a0,str2
	li	$v0,print_string
	syscall				#	print_string("; ");
	
	addiu	$t0,$t0,4		# 	p++;
	j	for			# }
e_for:	jr	$ra
	