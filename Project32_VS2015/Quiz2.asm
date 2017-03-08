
TITLE Quiz2(Quiz2.asm)
INCLUDE Irvine32.inc

; / //force user to input again
; / //ReadDec- reads in a 32 bit unsigned decimal integer from the user
; / //and returns the value in eax.
; / //WriteDec- writes to the console the value of eax as a 32 bit unsigned integer
; / // in decimal format with no leading zeros, similar to writeInt

.data
; / // create blank decimal we will use later
decNum    DWORD ?
; / // what we say when the user has bad input
promptBad BYTE "Invalid input, please enter again", 0
; / // what we say when the user has good input
promptGood BYTE "GOOD INPUT: ", 0
nlString BYTE " ", 0, 0d, 0h

.code
main PROC
; / // take in input from user until they get it right
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
; / // print that the input was good, print the value
MOV edx, OFFSET promptGood
CALL WriteString
; / //print the value
CALL WriteDec
; / //print a space
MOV edx, OFFSET nlString
CALL WriteString




exit
main ENDP
END main