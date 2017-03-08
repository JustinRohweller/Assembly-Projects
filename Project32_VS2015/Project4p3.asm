
TITLE Project4p3(Project4p3.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - Project4p3-Rohweller", 0Dh, 0Ah, 0

myStr1 BYTE "Please enter an two integers that you would like to calculate with.", 0Dh, 0Ah, 0
myStr2 BYTE "Please choose an option by entering an integer that corresponds to the options.", 0Dh, 0Ah, 0
myStr3 BYTE "x AND y", 0Dh, 0Ah, 0
myStr4 BYTE "x OR y", 0Dh, 0Ah, 0
myStr5 BYTE "NOT x", 0Dh, 0Ah, 0
myStr6 BYTE "x XOR y", 0Dh, 0Ah, 0
myStr7 BYTE "You chose:", 0Dh, 0Ah, 0

decNum    DWORD ?
; / // what we say when the user has bad input
promptBad BYTE "Invalid input, please enter again", 0
; / // what we say when the user has good input
promptGood BYTE "GOOD INPUT: ", 0

.code

main PROC

; / //HEADER
MOV edx, OFFSET myStr
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



read : CALL ReadDec
	; / //jump no carry (jumps when carry flag is not set) out of jump loop
	JNC  goodInput
	; / // carry flag gets set if the value is bad (blank integer, only spaces, too big)
	MOV  edx, OFFSET promptBad
	CALL WriteString
	; / //force user to input again
	JMP  read

	goodInput :
	; / // store good value
	MOV  decNum, eax

	CALL WriteInt
	CALL PromptUser

exit
main ENDP
; / // promptUser Procedure - Choose an option and print it
; / // Receives: EAX: contains the option
; / // Returns: NONE
; / // Pre-conditions:NONE
PromptUser PROC USES eax
.IF eax == 1
MOV edx, OFFSET myStr7
CALL WriteString
MOV edx, OFFSET myStr3
CALL WriteString

.ELSEIF eax == 2
MOV edx, OFFSET myStr7
CALL WriteString
MOV edx, OFFSET myStr4
CALL WriteString

.ELSEIF eax == 3
MOV edx, OFFSET myStr7
CALL WriteString
MOV edx, OFFSET myStr5
CALL WriteString

.ELSEIF eax == 4
MOV edx, OFFSET myStr7
CALL WriteString
MOV edx, OFFSET myStr6
CALL WriteString

.ENDIF
ret
PromptUser ENDP

END main