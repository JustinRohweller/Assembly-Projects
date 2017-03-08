
TITLE Project3p4(Project3p4.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - Project3p4-Rohweller", 0Dh, 0Ah, 0
dArray1 DWORD 1, 2, 3, 4, 5
; / // 15
dArray2 DWORD 2, 3, 3, 4
; / // 12
dArray3 DWORD 5, 5, 5, 5, 5, 7
; / // 32
dArray4 DWORD 3, 28, 8
; / // 39

.code

main PROC

; / //HEADER
MOV edx, OFFSET myStr
CALL WriteString

; / // get input
MOV edx, OFFSET promptStr
CALL WriteString
CALL ReadInt
CALL WriteInt
CALL Crlf

MOV ebx, eax

MOV edx, OFFSET promptStr
CALL WriteString
CALL ReadInt
CALL WriteInt
CALL Crlf

MOV ebx, eax

























exit
main ENDP

END main