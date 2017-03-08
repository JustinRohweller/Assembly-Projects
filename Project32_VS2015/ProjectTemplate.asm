
TITLE ProjectTemplate(ProjectTemplate.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - DataTypes.asm- In Lecture Code", 0Dh, 0Ah, 0

.code

main PROC
; / // Writes string in edx
MOV edx, OFFSET myStr
CALL WriteString

exit
main ENDP
END main