	.data
	.text
	.globl main
main:
	ori	$v0, $0, 5
	syscall			# read_int()
	
	or	$t0, $0, $v0	# $t0 = $v0 (valor lido)
	
	ori	$t2, $0, 8
	add 	$t1,$t0,$t0 	# $t1 = $t0 + $t0 = x + x = 2 * x
 	sub 	$t1,$t1,$t2 	# $t1 = $t1 + $t2 = y = 2 * x - 8
 				# ($t1 tem o valor calculado de y)
 	or 	$a0,$0,$t1 	# $a0 = y
 	ori 	$v0,$0,1 	#
 	syscall 		# chamada ao syscall "print_int10()"
 	
 	ori	$a0,$0,'\n'
 	ori	$v0,$0,11
 	syscall			# print_char("\n")
 	
 	or	$a0,$0,$t1	# $a0 = y
 	ori	$v0,$0,34	
 	syscall			# print_int16(y)
 	
 	ori	$a0,$0,'\n'
 	ori	$v0,$0,11
 	syscall			# print_char("\n")
 	
 	or	$a0,$0,$t1	# $a0 = y
 	ori	$v0,$0,36
 	syscall			# print_intu10(y)
 	
 	
	 			#
 	jr 	$ra 		# fim do programa 
 	
 	