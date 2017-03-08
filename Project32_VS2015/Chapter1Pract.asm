TITLE Project1(Project1.asm)
INCLUDE Irvine32.inc


.data
nl EQU <0dh, 0Ah, 0>
nlStr BYTE nl
myStr BYTE "CS340 - Project1p1.asm", nl

.code

main PROC
; /
MOV edx, OFFSET myStr
CALL WriteString

exit
main ENDP
END main
