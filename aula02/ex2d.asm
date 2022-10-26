	.data
	.text
	.globl main

main:	li	$t0,6			# $t0 = gray 

	move	$t1,$t0			# num = gray
	srl	$t3,$t1,4		# num >> 4
	xor	$t1,$t1,$t3		# num = num ^ (num >> 4)
	srl	$t4,$t1,2		# num >> 2
	xor	$t1,$t1,$t4		# num = num ^ (num >> 2)
	srl	$t5,$t1,1		# num >> 1
	xor	$t1,$t1,$t5		# num = num ^ (num >> 1)
	move	$t2,$t1			# bin = num
	
	
	
	jr	$ra
	
	
	