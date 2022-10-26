# Mapa de registos:
# val:	$t0
# n:	$t1
# min:	$t2
# max:	$t3
	
	
	
	.data
	.eqv	print_string,	4
	.eqv	read_int,	5
	.eqv	print_int10,	1
str1:	.asciiz "Digite ate 20 inteiros (zero para terminar):"
str2:	.asciiz	"Máximo/mínimo são: "
str3: 	.asciiz ":"
	.text
	.globl main
	
main:	
	li	$t1,0			# n = 0;
	li	$t2,0x7FFFFFFF		# min = 0x7FFFFFFF;
	li	$t3,0x80000000		# max = 0x80000000;
	
	la	$a0,str1
	li	$v0,print_string
	syscall				# print_string("Digite ate 20 inteiros (zero para terminar):");
	
do:					# do {
	li	$v0,read_int	
	syscall				# 	read_int();
	move	$t0,$v0			#	// $t0 = read_int();
	
if:	beqz	$t0,e_if		#	if (val != 0) {
	
if1:	ble	$t0,$t3,if2		#		if (val > max)
	move	$t3,$t0			#			max = val;

if2:	bge	$t0,$t2,e_if		#		if (val < min)
	move	$t2,$t0			#			min = val;
					
e_if:					#	}
	addiu	$t1,$t1,1		#	n++;
	
while:	
	bge	$t1,20,next
	beqz	$t0,next
	j	do			# while( (n < 20) && (val  != 0) );
	
next:	
	la	$a0,str2
	li	$v0,print_string
	syscall				# print_string("Máximo/minimo sao: ");
		
	move	$a0,$t3			
	li	$v0,print_int10
	syscall				# print_int(max);
	
	la	$a0,str3
	li	$v0,print_string
	syscall				# print_string(";");
		
	move	$a0,$t2			
	li	$v0,print_int10
	syscall				# print_int(min);
	
		
	jr	$ra			# }
								

