
TITLE ProjectTemplate(ProjectTemplate.asm)
INCLUDE Irvine32.inc

.data
; / // Code begins here 
fibToCompute = 5
fibArray DWORD 1, 1, fibToCompute dup (?)
.code

main PROC
	MOV ecx, fibToCompute
MOV esi, 0
	L2:
	MOV ebx, fibArray[esi]
	ADD ebx, fibArray[esi+4]
	ADD fibArray[esi+8], ebx
	ADD esi, TYPE fibArray
LOOP L2

	; / // Print stuff
	MOV ecx, LENGTHOF fibArray
	MOV esi, 0
	L1:
		MOV eax, fibArray[esi]
		CALL WriteInt
		ADD esi, TYPE fibArray
		
		MOV al, 0ah
		CALL WriteChar
	LOOP L1


	exit
	main ENDP
	END main