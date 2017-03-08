
TITLE ProjectTemplate(ProjectTemplate.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE " ", 0Dh, 0Ah, 0
source BYTE "This is the source string", 0
target BYTE SIZEOF source DUP(0)
.code

main PROC
mov esi,0
mov ecx, SIZEOF source

L1:
	mov al, source[esi]
	mov target[esi], al
	CALL WriteChar
	inc esi
	Loop L1

exit
main ENDP
END main