
TITLE ProjectTemplate(ProjectTemplate.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - Project 2", 0Dh, 0Ah, 0
myArr DWORD 1, 2, 3, 4, 5
.code

main PROC
; / //idk bruh
MOV ecx, LENGTHOF myArr
MOV esi, 0


L1:; / // This loop prints out the array
	; / // Print out the character
	MOV eax, myArr[esi]
	; / // changes the register sheet

	CALL WriteInt
	ADD esi, TYPE myArr

	; / // Print out the new line
	MOV al, 0Ah
	CALL WriteChar

	; / // Decrments ECX and then jumps to L1 if ECX != 0
	LOOP L1
	
	
	MOV ecx, LENGTHOF myArr
	MOV esi, SIZEOF myArr- TYPE myArr
L2:; / // This loop reprints out the array
	; / // Print out the character
	MOV eax, myArr[esi]
	; / // changes the register sheet

	CALL WriteInt
	SUB esi, TYPE myArr
	
	; / // Print out the new line
	; / // Print out the new line
	MOV al, 0Ah
	CALL WriteChar

	; / // Decrments ECX and then jumps to L1 if ECX != 0
	LOOP L2

	MOV ecx, LENGTHOF myArr
	MOV esi, 0
L3:; / // This loop reprints out the array
	; / // Print out the character
	MOV eax, myArr[esi]
	; / // changes the register sheet

	CALL WriteInt
	ADD esi, TYPE myArr

	; / // Print out the new line
	MOV al, 0Ah
	CALL WriteChar

	; / // Decrments ECX and then jumps to L1 if ECX != 0
	LOOP L3


exit
main ENDP
END main