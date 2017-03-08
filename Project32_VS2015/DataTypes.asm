
TITLE DataTypes(DataTypes.asm)
INCLUDE Irvine32.inc


.data

nl EQU <0Dh, 0Ah, 0>
nlStr BYTE nl
myStr BYTE "CS340 - DataTypes.asm- In Lecture Code", nl
myStrLen = ($- myStr)
testNum SDWORD 10393
myDwordLen = ($ - testNum) / 4
myDecNum WORD 10 + 4
num = 7 + 11

.code

main PROC
; / // Writes string in edx
	MOV edx, OFFSET myStr
	CALL WriteString
; / // Writes the intro string
	MOV eax, myDwordLen
	CALL WriteInt

	exit
main ENDP
END main