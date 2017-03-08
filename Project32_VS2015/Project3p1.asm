
TITLE Project3p1(Project3p1.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - Project3p1.asm-Rohweller", 0Dh, 0Ah, 0

.code

main PROC


MOV eax, 2
CALL SetTextColor
; / //HEADER
MOV edx, OFFSET myStr
CALL WriteString

L1:
; / // create random number, put into eax
CALL Random32
; / //print this integer
CALL WriteInt
; / //escape when the use puts in a key
CALL ReadKey
; / //loop back to repeatedly print
JZ L1



exit
main ENDP
END main