# Mapa de registos:
# $t0 � value
# $t1 � bit
# $t2 - i
	
	.data
str1:	.asciiz	"Introduza um numero: "
str2:	.asciiz	"\nO valor em binario �: "
	.eqv	print_string, 4
	.eqv	read_int, 5
	.eqv 	print_char, 11
	.text
	.globl main
	
main:
	la	$a0,str1
	li	$v0,print_string
	syscall					# print_string("Introduza um numero: "); 
	
	li	$v0,read_int
	syscall					
	move	$t0,$v0				# value = read_int();
	
	la	$a0,str2
	li	$v0,print_string
	syscall					# print_string("\nO valor em bin�rio e': ");
	
	li	$t2,0				# i = 0;

for:	bge	$t2,32,endfor			# while(i < 32) {

	rem	$t3,$t2,4			#	$t3 = i%4
if4:	bne	$t3,0,endif4			#	if((i % 4) == 0) // resto da divis�o inteira
	li	$a0,' '
	li	$v0,print_char
	syscall					#		print_char(' ');

endif4:
	andi	$t1,$t0,0x80000000		#	bit = value & 0x80000000 // isola bit 31
	srl	$t1,$t1,31			#	bit = bit >> 31;

	addi	$a0,$t1,0x30			#	$a0 = 0x30 + bit
	li	$v0,print_char
	syscall					#	print_char(0x30 + bit);


endif:	sll	$t0,$t0,1			#	value = value << 1;
	addi	$t2,$t2,1			#	i++;

	j	for				# }

endfor:	jr	$ra				# 	-- fim do programa --  
	 
	    
	     
	      
	       
	         
