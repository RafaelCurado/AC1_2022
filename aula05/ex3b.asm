# Mapa de registos
# P:		$t0
# *P:		$t1
# lista+Size: 	$t2
# 
# houve_troca: 	$t4
# i: 		$t5
# lista: 	$t6
# lista + i: 	$t7
# lista[i]:	$t8

	.data
lista:	.space	40
str1:	.asciiz	"\nIntroduza um numero: "
str2:	.asciiz	"\nConteudo do array:\n"
str3:	.asciiz	"; "
	.eqv	SIZE, 	40
	.eqv	TRUE, 	1
	.eqv	FALSE,	0
	.eqv	read_int,	5	
	.eqv	print_string,	4
	.eqv	print_int10,	1
	.text
	.globl main
	
main:
	la	$t0,lista		# // $t0 = p
	addiu	$t2,$t0,SIZE		# // $t2 = lista+SIZE

for1:	bge	$t0,$t2,e_for1		# while(p < lista+SIZE) {
	
	la	$a0,str1		
	li	$v0,print_string
	syscall				#	print_string("\nIntroduza um numero: ");
	
	li	$v0,read_int
	syscall				#	read_int();
	
	sw	$v0,0($t0)		#	p* = read_int();
	
	addiu	$t0,$t0,4		# 	p++;
	j	for1			# }

e_for1:
	la	$t6,lista		# // $t6 = lista
do:					# do {
	li	$t4,FALSE		# 	houveTroca = FALSE;
	li	$t5,0			#	i = 0;

for2:	bge	$t5,36,e_for2		# 	while(i < SIZE-1) {

	addu	$t7,$t6,$t5		#		// $t7 = lista+i
	lw	$t8,0($t7)		#		// $t8 = lista[i]
	lw	$t9,4($t7)		#		// $t9 = lista[i+1]
	
if:	ble	$t8,$t9,e_if		#		if(lista[i] > lista[i+1]) {

	sw	$t8,4($t7)		#			lista[i+1] = $t8
	sw	$t9,0($t7)		#			lista[i] = $t9
	li	$t4,TRUE		#			houveTroca = TRUE;
					#		}	
e_if:		
	addiu	$t5,$t5,4		#		i++;
	j	for2			# 	}
e_for2:		

while:	beq	$t4,TRUE,do		# } while( houveTroca == TRUE);
	
	la	$a0,str2		
	li	$v0,print_string
	syscall				# print_string("\nConteudo do array: \n");

	li	$t5,0			# i = 0;
	la	$t6,lista		# // $t6 = lista	

for3:	bge	$t5,SIZE,e_for3		# while(i < SIZE) {

	addu	$t7,$t6,$t5		# 	// $t7 = lista+i
	lw	$a0,0($t7)		# 	// $a0 = lista[i]
	li	$v0,print_int10		
	syscall				#	print_int10(lista[i]);
	
	la	$a0,str3
	li	$v0,print_string
	syscall				#	print_string("; ");

	addiu	$t5,$t5,4		# 	i++;
	j	for3			# }
e_for3:	
	jr	$ra			# 2// fim do programa 
		
	