.section .data
SECURITY_REG: .byte 0x00

.text
.global _start
_start:
	
	LDR R0, =SECURITY_REG
	LDRB R1, [R0]
	
	ORR R1, R1, #0b00100001
	
	TST R1, #0b00001000
	BICEQ R1, R1, #0b00001000
	
	EOR R1, R1, #0b00010000
	
	TST R1, #0b10000000
	ORREQ R1, R1, #0b01000000
	
	STRB R1, [R0]
	
	SWI 0