# Mapa de registos
# n_even:	$t0
# n_odd:	$t1
# p1:		$t2
# p2:		$t3
# a + N:	$t4
# *p1:		$t5	
	
	.data
	.eqv	N,	140		#  = 35 inteiros
	.eqv	read_int,	5
	.eqv	print_int10,	1
arr_a:	.space	N
arr_b:	.space	N	
	.text
	.globl 	main
	
main:					# void main(void) {
	li	$t0,0			#	int n_even = 0;
	li	$t1,0			#	int n_odd = 0;
	
	la	$t2,arr_a		#	p1 = a;
	addiu	$t4,$t2,N		#	// $t4 = a + N
for1:	
	bge	$t2,$t4,e_for1		#	while(p1 < (a+N)) {
	
	li	$v0,read_int	
	syscall				#		read_int();
	
	sw	$v0,0($t2)		#		*p1 = read_int();

	addiu	$t2,$t2,4		#		i++;
	j	for1			#	}
	
e_for1:	
	la	$t2,arr_a		#	p1 = a;
	la	$t3,arr_b		#	p2 = b;
for2:
	bge	$t2,$t4,e_for2		#	while(p1 < (a + N)){
	
	lw	$t5,0($t2)		#		// $t5 = *p1		
	rem	$t6,$t5,2		#		// $t6 = *p1 % 2
	
													
if:	beqz	$t6,else		#		if( (*p1 % 2) != 0) {
	
	sw	$t5,0($t3)		#			*p2 = *p1;		
	addiu	$t3,$t3,4		#			p2++;		
	
	addiu	$t1,$t1,1		#			n_odd++;
	j	e_if			#		}

else:					#		else
	addiu	$t0,$t0,1		#			n_even++;
	
e_if:		
	addiu	$t2,$t2,4		#		p1++;
	j	for2			# 	}	
e_for2:
	la	$t3,arr_b		#	// $t3 = b
	
	mul	$t7,$t1,4		#	// $t7 = n_odd*4
	addu	$t8,$t3,$t7		#	// $t8 = b + n_odd	
for3:
	bge	$t3,$t8,e_for3		#	while( p2 < (b + n_odd)) {
	
	lw	$a0,0($t3)
	li	$v0,print_int10
	syscall				#		print_int10( *p2 );
	
	addiu	$t3,$t3,4		#		p2++;
	j	for3			# 	}
e_for3:
	jr	$ra			# }
	
	
	
	
	
	
	