
TITLE Project4p1(Project4p1.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - Project4p1-Rohweller", 0Dh, 0Ah, 0
dVal1 DWORD 3
dVal2 DWORD 5

.code

main PROC

; / //HEADER
MOV edx, OFFSET myStr
CALL WriteString

MOV ebx, dVal1
MOV ecx, dVal2

CALL absValueSub
CALL WriteInt

exit
main ENDP
; / // absValueSub Procedure - Finds absolute value of subtraction of two values
; / // Receives: EBX: contains the first number
; / // ECX: contains the second number
; / // Returns: absolute value of subtraction of two values
; / // Pre-conditions:NONE
absValueSub PROC USES ebx ecx
; / // clear eax
MOV eax, 0
; / //move first value into eax
MOV eax, ebx
; / //subtract second value from first value
SUB eax, ecx
; / //make number absolute value (positive)
L1 :
; / //negate eax
neg eax
; / // while not positive loop back
jl L1

ret
absValueSub ENDP

END main