.eqv 	val_1, 0x01
	
	.data
	.text
	.globl main

main:	ori 	$t0,$0,val_1
	
	xori	$t2,$t0,0xFFFF	
	
	jr	$ra
	

	