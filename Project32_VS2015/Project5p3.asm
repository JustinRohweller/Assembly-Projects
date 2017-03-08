
TITLE Project5p3(Project5p3.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - Project5p3-Rohweller", 0Dh, 0Ah, 0

val1 BYTE  01010101b
val2 BYTE  10101010b

.code

main PROC

; / //HEADER
MOV edx, OFFSET myStr
CALL WriteString

MOV al, val1
CALL printBinaryToInt
CALL crlf

MOV al, val2
CALL printBinaryToInt
CALL crlf

exit
main ENDP

; / // printBinaryToInt Procedure - Prints decimal version of binary number
; / // Receives: EAX: contains the binary number
; / // Returns: NONE
; / // Pre-conditions:NONE
printBinaryToInt PROC USES eax
MOV ecx, 0

; / // set carry flag to value of least significant bit.
BT eax, 0
; / //if 0 jump to f1
JNC f1
; / //if 1 add 1
JC j1
; / //add 1
j1 :
	ADD ecx, 1
JMP f1
f1 :
; / //repeat this process for each next bit, adding depending on the value

BT eax, 1
JNC f2
JC j2
j2 :
ADD ecx, 2
JMP f2
f2 :

BT eax, 2
JNC f3
JC j3
j3 :
ADD ecx, 4
JMP f3
f3 :

BT eax, 3
JNC f4
JC j4
j4 :
ADD ecx, 8
JMP f4
f4 :

BT eax, 4
JNC f5
JC j5
j5 :
ADD ecx, 16
JMP f5
f5 :

BT eax, 5
JNC f6
JC j6
j6 :
ADD ecx, 32
JMP f6
f6 :

BT eax, 6
JNC f7
JC j7
j7 :
ADD ecx, 64
JMP f7
f7 :

BT eax, 7
JNC f8
JC j8
j8 :
ADD ecx, 128
JMP f8
f8 :
; / //mov ecx back into eax so I can print
MOV eax, ecx
CALL WriteInt
ret
printBinaryToInt ENDP


END main