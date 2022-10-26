	.data
	.text
	.globl main

main:	li	$t0,0x2

	srl	$t2,$t0,1		# bin = bin >> 1
	
	xor	$t1,$t0,$t2		# gray = bin ^ (bin >> 1)
	
	jr	$ra
	
	
	