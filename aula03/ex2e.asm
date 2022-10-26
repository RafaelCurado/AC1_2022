# Mapa de registos:
# $t0 – value
# $t1 – bit
# $t2 - i
# $t3 - flag
	
	.data
str1:	.asciiz	"Introduza um numero: "
str2:	.asciiz	"\nO valor em binario é: "
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
	syscall					# print_string("\nO valor em binário e': ");
	
	li	$t2,0				# i = 0;
	li	$t3,0				# flag = 0;

do:						# do {
	andi	$t1,$t0,0x80000000		#	bit = value & 0x80000000 // isola bit 31
	srl	$t1,$t1,31			#	bit = bit >> 31;

if1:	bne	$t3,1,if2			#	if(flag	== 1)
	j	if
if2:	beqz	$t1,endif			#	if(bit != 0)

if:	li	$t3,1				#		flag = 1;	

	rem	$t4,$t2,4			#		$t4 = i%4
ifrem4:	bne	$t4,0,erem4			#		if((i % 4) == 0) // resto da divisão inteira
	li	$a0,' '
	li	$v0,print_char
	syscall					#			print_char(' ');
erem4:
	addi	$a0,$t1,0x30			#	$a0 = 0x30 + bit
	li	$v0,print_char
	syscall					#	print_char(0x30 + bit);


endif:	sll	$t0,$t0,1			#	value = value << 1;
	addi	$t2,$t2,1			#	i++;

	blt	$t2,32,do			# } while(i < 32)	

endfor:	jr	$ra				# 	-- fim do programa --  
	 
	    
	     
	      
	       
	         
