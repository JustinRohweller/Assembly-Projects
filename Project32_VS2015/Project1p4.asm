TITLE Project1p4(Project1p4.asm)
INCLUDE Irvine32.inc


.data

nl EQU <0dh, 0Ah, 0>
nlStr BYTE nl
myStr BYTE "CS340 - Project1p4.asm", nl

; / // Creating the array, strings for each item
nums DWORD 1, 2, 3, 4, 5
myNumOne BYTE "The first item in the array:", 0
myNumTwo BYTE "The second item in the array:", 0
myNumThree BYTE "The third item in the array:", 0
myNumFour BYTE "The fourth item in the array:", 0
myNumFive BYTE "The fifth item in the array:", 0

.code

main PROC
; / // Printing the file title
MOV edx, OFFSET myStr
CALL WriteString

; / // Printing the number one string, value
MOV edx, OFFSET myNumOne
CALL WriteString

MOV eax, nums
CALL WriteInt

MOV edx, OFFSET nlStr
CALL WriteString

; / // Printing the number two string, value
MOV edx, OFFSET myNumTwo
CALL WriteString

MOV eax, nums + 4
CALL WriteInt

MOV edx, OFFSET nlStr
CALL WriteString

; / // Printing the number three string, value
MOV edx, OFFSET myNumThree
CALL WriteString

MOV eax, nums + 8
CALL WriteInt

MOV edx, OFFSET nlStr
CALL WriteString

; / // Printing the number four string, value
MOV edx, OFFSET myNumFour
CALL WriteString

MOV eax, nums + 12
CALL WriteInt

MOV edx, OFFSET nlStr
CALL WriteString

; / // Printing the number five string, value
MOV edx, OFFSET myNumFive
CALL WriteString

MOV eax, nums + 16
CALL WriteInt

MOV edx, OFFSET nlStr
CALL WriteString



exit
main ENDP
END main