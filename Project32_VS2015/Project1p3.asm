TITLE Project1(Project1.asm)
INCLUDE Irvine32.inc


.data
nl EQU <0dh, 0Ah, 0>
nlStr BYTE nl
myStr BYTE "CS340 - Project1p3.asm", nl


; / //  Defining symbolic constants for days of the week

Sunday EQU <1h>
Monday EQU <2h>
Tuesday EQU <3h>
Wednesday EQU <4h>
Thursday EQU <5h>
Friday EQU <6h>
Saturday EQU <7h>

; / //  Day of week array
arrayW WORD Sunday, Monday, Tuesday, Wednesday, Thursday, Friday



.code

main PROC
; / //  Printing file title
MOV edx, OFFSET myStr
CALL WriteString

exit
main ENDP
END main
