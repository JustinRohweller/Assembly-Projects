
TITLE Project4p2(Project4p2.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - Project4p2-Rohweller", 0Dh, 0Ah, 0
myStr1 BYTE "Bit 1 is clear", 0Dh, 0Ah, 0
myStr2 BYTE "Bit 1 is set", 0Dh, 0Ah, 0

myStr3 BYTE "Bit 2 is clear", 0Dh, 0Ah, 0
myStr4 BYTE "Bit 2 is set", 0Dh, 0Ah, 0

myStr5 BYTE "Bit 3 is clear", 0Dh, 0Ah, 0
myStr6 BYTE "Bit 3 is set", 0Dh, 0Ah, 0

myStr7 BYTE "Bit 4 is clear", 0Dh, 0Ah, 0
myStr8 BYTE "Bit 4 is set", 0Dh, 0Ah, 0

myStr9 BYTE "Bit 5 is clear", 0Dh, 0Ah, 0
myStr10 BYTE "Bit 5 is set", 0Dh, 0Ah, 0

myStr11 BYTE "Bit 6 is clear", 0Dh, 0Ah, 0
myStr12 BYTE "Bit 6 is set", 0Dh, 0Ah, 0

myStr13 BYTE "Bit 7 is clear", 0Dh, 0Ah, 0
myStr14 BYTE "Bit 7 is set", 0Dh, 0Ah, 0

myStr15 BYTE "Bit 8 is clear", 0Dh, 0Ah, 0
myStr16 BYTE "Bit 8 is set", 0Dh, 0Ah, 0
val BYTE  10101100b
.code

main PROC

; / //HEADER
MOV edx, OFFSET myStr
CALL WriteString

MOV al, val
; / //MOV eax, 1
; / // CALL WriteInt
CALL printBitValues

exit
main ENDP
; / // PrintBitValues Procedure - Prints a line for each of the eight bit values
; / // saying whether they are set or not
; / // Receives: AL: contains a byte
; / // Returns:  NONE
; / // Pre-conditions: NONE

printBitValues PROC USES eax
; / // set carry flag to value of least significant bit.
BT eax, 0
; / //if 0 jump to mystring 1
JNC j1
; / //if 1 jump to mystring 2
JC j2
; / //print the first bit is clear or set
j1:
MOV edx, OFFSET myStr1
CALL WriteString
JMP f1
j2:
MOV edx, OFFSET myStr2
CALL WriteString
JMP f1
f1:
; / //repeat this process for each next bit
BT eax, 1
JNC j3
JC j4
j3 :
MOV edx, OFFSET myStr3
CALL WriteString
JMP f2
j4 :
MOV edx, OFFSET myStr4
CALL WriteString
JMP f2
f2 :

BT eax, 2
JNC j5
JC j6
j5 :
MOV edx, OFFSET myStr5
CALL WriteString
JMP f3
j6 :
MOV edx, OFFSET myStr6
CALL WriteString
JMP f3
f3 :

BT eax, 3
JNC j7
JC j8
j7 :
MOV edx, OFFSET myStr7
CALL WriteString
JMP f4
j8 :
MOV edx, OFFSET myStr8
CALL WriteString
JMP f4
f4 :

BT eax, 4
JNC j9
JC j10
j9 :
MOV edx, OFFSET myStr9
CALL WriteString
JMP f5
j10 :
MOV edx, OFFSET myStr10
CALL WriteString
JMP f5
f5 :

BT eax, 5
JNC j11
JC j12
j11 :
MOV edx, OFFSET myStr11
CALL WriteString
JMP f6
j12 :
MOV edx, OFFSET myStr12
CALL WriteString
JMP f6
f6 :

BT eax, 6
JNC j13
JC j14
j13 :
MOV edx, OFFSET myStr13
CALL WriteString
JMP f7
j14 :
MOV edx, OFFSET myStr14
CALL WriteString
JMP f7
f7 :

BT eax, 7
JNC j15
JC j16
j15 :
MOV edx, OFFSET myStr15
CALL WriteString
JMP f8
j16 :
MOV edx, OFFSET myStr16
CALL WriteString
JMP f8
f8 :

MOV eax, 1
CALL WriteInt
ret
printBitValues ENDP

END main