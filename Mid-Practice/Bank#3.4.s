.section .data
IRRIGATION_REG: .byte 0x00

.text
.global _start
_start:
	
	LDR R0, =IRRIGATION_REG
	LDRB R1, [R0]
	
	ORR R1, R1, #0b00000011
	
	TST R1, #0b00010000
	BICEQ R1, R1, #0b00010000
	
	EOR R1, R1, #0b01000000
	
	TST R1, #0b00100000
	BICEQ R1, R1, #0b00000011
	
	STRB R1, [R0]
	
	SWI 0