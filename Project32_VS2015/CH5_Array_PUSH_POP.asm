
TITLE ProjectTemplate(ProjectTemplate.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - DataTypes.asm- In Lecture Code", 0Dh, 0Ah, 0

wArray WORD 1, 2, 3, 4, 5
dArray DWORD 6, 7, 8, 9, 10, 11, 12

.code

main PROC
; / // Writes string in edx
MOV edx, OFFSET myStr
CALL WriteString
CALL PrintArray
exit
main ENDP

PrintArray PROC

CALL WriteInt
ret
PrintArray ENDP

END main
