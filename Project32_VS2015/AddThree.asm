
TITLE ProjectTemplate(ProjectTemplate.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - DataTypes.asm- In Lecture Code", 0Dh, 0Ah, 0

.code

main PROC
	; / // Writes string in edx
	MOV edx, OFFSET myStr
	CALL WriteString
	CALL AddThree
	exit
main ENDP

AddThree PROC
	MOV edx, 2
	MOV ebx, 3
	MOV ecx, 1
	ADD ebx, ecx
	ADD ebx, edx
	MOV eax, ebx
	CALL WriteInt
	ret
AddThree ENDP

END main
