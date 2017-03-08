
TITLE Project4p3(Project4p3.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - Project4p3-Rohweller", 0Dh, 0Ah, 0

myStr0 BYTE "Please enter the first integer that you would like to calculate with.", 0Dh, 0Ah, 0
myStr1 BYTE "Please enter the second integer that you would like to calculate with.", 0Dh, 0Ah, 0
myStr2 BYTE "Please choose an option by entering an integer that corresponds to the options.", 0Dh, 0Ah, 0
myStr3 BYTE "x AND y", 0Dh, 0Ah, 0
myStr4 BYTE "x OR y", 0Dh, 0Ah, 0
myStr5 BYTE "NOT x", 0Dh, 0Ah, 0
myStr6 BYTE "x XOR y", 0Dh, 0Ah, 0
myStr7 BYTE "equals:", 0Dh, 0Ah, 0

decNum1    DWORD ?
decNum2    DWORD ?
decNum3    DWORD ?

; / // what we say when the user has bad input
promptBad BYTE "Invalid input, please enter again", 0
; / // what we say when the user has good input
promptGood BYTE "GOOD INPUT: ", 0

.code

main PROC

MOV eax, 3
CALL WriteInt

; / //HEADER
MOV edx, OFFSET myStr0
CALL WriteString

; / //taking in input1
read1 : CALL ReadHex
	; / //jump no carry (jumps when carry flag is not set) out of jump loop
	JNC  goodInput1
	; / // carry flag gets set if the value is bad (blank integer, only spaces, too big)
	MOV  edx, OFFSET promptBad
	CALL WriteString
	; / //force user to input again
	JMP  read1

	goodInput1 :
; / // store good value
MOV  decNum1, eax
CALL WriteInt

; / //taking in input2
MOV edx, OFFSET myStr1
CALL WriteString

read2 : CALL ReadHex
	; / //jump no carry (jumps when carry flag is not set) out of jump loop
	JNC  goodInput2
	; / // carry flag gets set if the value is bad (blank integer, only spaces, too big)
	MOV  edx, OFFSET promptBad
	CALL WriteString
	; / //force user to input again
	JMP  read2

	goodInput2 :
; / // store good value
MOV  decNum2, eax
CALL WriteInt


; / //taking in choice
MOV edx, OFFSET myStr2
CALL WriteString



MOV edx, OFFSET myStr2
CALL WriteString

MOV edx, OFFSET myStr3
CALL WriteString

MOV edx, OFFSET myStr4
CALL WriteString

MOV edx, OFFSET myStr5
CALL WriteString

MOV edx, OFFSET myStr6
CALL WriteString



read3 : CALL ReadDec
	; / //jump no carry (jumps when carry flag is not set) out of jump loop
	JNC  goodInput3
	; / // carry flag gets set if the value is bad (blank integer, only spaces, too big)
	MOV  edx, OFFSET promptBad
	CALL WriteString
	; / //force user to input again
	JMP  read3

	goodInput3 :
; / // store good value
MOV  decNum3, eax
MOV decNum2, ebx
MOV decNum1, ecx
CALL WriteInt


CALL PromptUser

exit
main ENDP

; / // promptUser Procedure - Choose an option and print it
; / // Receives: EAX: contains the option
; / // ECX: first number
; / // EBX: second number
; / // Returns: NONE
; / // Pre-conditions:NONE
PromptUser PROC USES eax ebx ecx
.IF eax == 1
MOV edx, OFFSET myStr3
CALL WriteString
MOV edx, OFFSET myStr7
CALL WriteString

AND ecx, ebx
MOV eax, ecx
CALL WriteHex

.ELSEIF eax == 2
MOV edx, OFFSET myStr4
CALL WriteString
MOV edx, OFFSET myStr7
CALL WriteString

OR ecx, ebx
MOV eax, ecx
CALL WriteHex

.ELSEIF eax == 3
MOV edx, OFFSET myStr5
CALL WriteString
MOV edx, OFFSET myStr7
CALL WriteString

NEG ecx
MOV eax, ecx
CALL WriteHex

.ELSEIF eax == 4
MOV edx, OFFSET myStr6
CALL WriteString
MOV edx, OFFSET myStr7
CALL WriteString

XOR ecx, ebx
MOV eax, ecx
CALL WriteHex

.ENDIF
ret
PromptUser ENDP

END main