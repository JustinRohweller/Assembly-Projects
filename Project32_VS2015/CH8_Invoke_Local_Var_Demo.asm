
TITLE ProjectTemplate(ProjectTemplate.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - DataTypes.asm- In Lecture Code", 0Dh, 0Ah, 0
a1 DWORD 2, 5, 1, 8, 3
a2 DWORD 200, 22, 45, 34, 57
a3 DWORD 67, 94, 20, 99
result DWORD ?
.code
MAX PROTO arrayAddr : DWORD, len : DWORD, returnVal : PTR DWORD
main PROC
; / // Writes string in edx
MOV edx, OFFSET myStr
CALL WriteString

; / // use code from online ch8 code is good and commented
INVOKE MAX, OFFSET a1, LENGTHOF a1, ADDR result
MOV eax, result
CALL WriteInt
CALL Crlf

exit
main ENDP

MAX PROC USES esi ecx eax, arrayAddr: DWORD, len: DWORD, returnVal: PTR DWORD
	LOCAL curMax: DWORD
; / //my init components for loop and local var
	MOV ecx, len
	MOV esi, arrayAddr
	MOV curMax, 0
	; / // loop through and gets max into curMax
	L1:
		MOV eax, [esi]
		.IF eax > curMax
			MOV curMax, eax
		.ENDIF
		add esi, 4
	LOOP L1	
; / //Move the curMax into my returnVal parameter
; / // (this is really just the result global variable)
MOV esi, returnVal
MOV eax, curMax
MOV [esi], eax
ret
MAX ENDP
END main