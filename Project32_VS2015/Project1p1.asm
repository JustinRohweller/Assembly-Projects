TITLE Project1(Project1.asm)
INCLUDE Irvine32.inc


.data
nl EQU <0dh, 0Ah, 0>
nlStr BYTE nl
myStr BYTE "CS340 - Project1p1.asm", nl

; / //  Creating the values for nums
num1 WORD 5d
num2 WORD 3d
num3 WORD 1d

.code

main PROC
; / //  Printing the title 
MOV edx, OFFSET myStr
CALL WriteString

; / //  subtract num2 from num1
MOV ax, num1
SUB ax, num2
; / //  subtract num3 from num2
SUB ax, num3
; / //  Dump the register
CALL DumpRegs



exit
main ENDP
END main
