
TITLE Project5p1(Project5p1.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - Project5p1-Rohweller", 0Dh, 0Ah, 0
value1 DWORD 15d
value2 DWORD 5d
value3 DWORD 81d
value4 DWORD 63d
value5 DWORD 234d
value6 DWORD 929d
value7 DWORD 100d
value8 DWORD 100d
.code

main PROC

; / //HEADER
MOV edx, OFFSET myStr
CALL WriteString

; / // test first values
MOV eax, value1
MOV ebx, value2

CALL GCD
MOV eax, ecx
CALL WriteInt
CALL Crlf

; / // test second values
MOV eax, value3
MOV ebx, value4

CALL GCD
MOV eax, ecx
CALL WriteInt
CALL Crlf

; / // test third values
MOV eax, value5
MOV ebx, value6

CALL GCD
MOV eax, ecx
CALL WriteInt
CALL Crlf

; / // test last values
MOV eax, value7
MOV ebx, value8

CALL GCD
MOV eax, ecx
CALL WriteInt
CALL Crlf


exit
main ENDP

; / // GCD Procedure - Returns greatest common divisor
; / // Receives: EAX: contains the first number
; / // EBX: contains the second number
; / // Returns: GCD of values in ECX
; / // Pre-conditions:NONE
GCD PROC USES eax ebx
; / // do first absolute value on ecx
CALL absValue; / // this returns absvalue in ecx

; / //store abs first value in ebx after putting ebx into ecx
MOV eax, ebx; / // move into eax the second value.
MOV ebx, ecx; / // move into ebx the previous eax value
CALL absValue
; / // now the abs(x) is in ebx and abs(y) is in ecx
L1:

	; / // get remainder (modulus) result stored in edx
	; / //8000/100 = 80
	MOV edx, 0
	MOV eax, ebx
	DIV ecx
	

	; / // set x = to y
	MOV ebx, ecx

	; / // set y = to remainder
	MOV ecx, edx

	.IF ecx == 0
		JMP L2
	.ENDIF
JMP L1
L2:

; / // return x
MOV ecx, 0
MOV ecx, ebx

ret
GCD ENDP


; / // absValue Procedure - Finds absolute value of a value
; / // Receives: ECX: contains the first number
; / // Returns: absolute value of number in eax
; / // Pre-conditions:NONE
absValue PROC USES eax

MOV ecx, 0; / // clear eax

MOV ecx, eax; / //move first value into eax

; / //make number absolute value (positive)
L1 :
neg ecx; / //negate eax
jl L1; / // while not positive loop back
ret
absValue ENDP



END main