
TITLE Project5p2(Project5p2.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - Project5p2-Rohweller", 0Dh, 0Ah, 0
myStr1 BYTE "Fast method: ", 0Dh, 0Ah, 0
myStr2 BYTE "Slow method: ", 0Dh, 0Ah, 0
myStr3 BYTE "The first digit seen is the remainder, the second is the result. Ignore the number on the next line.", 0Dh, 0Ah, 0
myStr4 BYTE "The number seen on the first line is the result, the second line number is the remainder.", 0Dh, 0Ah, 0
.code

main PROC

; / //HEADER
MOV edx, OFFSET myStr
CALL WriteString
; / // example 1
; / // mov numbers into respective locations
CALL Crlf
MOV eax, 0
MOV ax, 15d
MOV bl, 2d
; / // call method
CALL FastDiv
; / // write out the eax register
MOV eax, ecx
CALL WriteHex
CALL Crlf
; / //  move edx into eax and write out
MOV eax, 0
MOV eax, edx
CALL WriteHex
CALL Crlf

; / // example 2
; / // these do the same as the previous example but with different numbers
CALL Crlf
MOV eax, 0
MOV ax, 11d
MOV bl, 3d

CALL FastDiv
MOV eax, ecx
CALL WriteHex
CALL Crlf

MOV eax, 0
MOV eax, edx
CALL WriteHex
CALL Crlf

; / // example 3
; / // these do the same as the previous example but with different numbers
CALL Crlf
MOV eax, 0
MOV ax, 56d
MOV bl, 7d

CALL FastDiv
MOV eax, ecx
CALL WriteHex
CALL Crlf

MOV eax, 0
MOV eax, edx
CALL WriteHex
CALL Crlf

; / // example 4
; / // these do the same as the previous example but with different numbers
CALL Crlf
MOV eax, 0
MOV ax, 10d
MOV bl, 2d

CALL FastDiv
MOV eax, ecx
CALL WriteHex
CALL Crlf

MOV eax, 0
MOV eax, edx
CALL WriteHex
CALL Crlf

exit
main ENDP

; / // FastDiv Procedure - Finds fast division of two numbers
; / // Receives: AX: contains the first number
; / // BL: contains the second number
; / // Returns: AL quotient and AH remainder
; / // Pre-conditions:NONE
FastDiv PROC USES eax ebx
; / //if divisor is 2, do this one
.IF bl == 2
; / // print how to read output and that it is fast way
	MOV edx, OFFSET myStr1
	CALL WriteString
	MOV edx, OFFSET myStr4
	CALL WriteString
; / //move inputs into a way that can be shifted and shift
	MOV dl, al
	SHR dl, 1
	MOV al, dl
; / //mov result into ecx so that it can escape the method
	MOV ecx, eax
; / //if there is remainder, set edx to 1
	JNC L2
	JC L1
	L1: 
	  MOV edx, 1
	  JMP L3
	L2:
	  MOV edx, 0
	L3:
		  ; / // if divisor is not 2 do long way
.ELSE
; / // print how to read output and that it is slow way
	MOV edx, OFFSET myStr2
	CALL WriteString
	MOV edx, OFFSET myStr3
	CALL WriteString
; / // do the division
	MOV dx, 0
	DIV bl
; / //mov result into ecx so that it can escape the method
	MOV ecx, eax
	MOV edx, 0
.ENDIF
ret
FastDiv ENDP

END main