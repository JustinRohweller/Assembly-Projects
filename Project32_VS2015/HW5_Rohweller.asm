
TITLE Project5p4(Project5p4.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - Project5p4-Rohweller", 0Dh, 0Ah, 0
case1 DWORD 29, 92, 34, 18, 30, 28, 93, 45
case2 DWORD 25
case3 DWORD 22, 60
case4 DWORD 14, 88, 0, 5, 3, 8

.code

main PROC

; / //HEADER
MOV edx, OFFSET myStr
CALL WriteString

MOV edx, OFFSET case1
MOV ecx, LENGTHOF case1
CALL FindFirstMultOfTen
CALL WriteInt
MOV eax, ebx
CALL WriteInt
CALL Crlf

MOV edx, OFFSET case2
MOV ecx, LENGTHOF case2
CALL FindFirstMultOfTen
CALL WriteInt
MOV eax, ebx
CALL WriteInt
CALL Crlf

MOV edx, OFFSET case3
MOV ecx, LENGTHOF case3
CALL FindFirstMultOfTen
CALL WriteInt
MOV eax, ebx
CALL WriteInt
CALL Crlf

MOV edx, OFFSET case4
MOV ecx, LENGTHOF case4
CALL FindFirstMultOfTen
CALL WriteInt
MOV eax, ebx

CALL WriteInt




exit
main ENDP




; / // FindFirstMultOfTen Procedure - Prints decimal version of binary number
; / // Receives: EDX: contains a pointer to the beginning of the array
; / // ECX: length of the array (number of elements
; / // Returns: EAX: first number which is a multiple of 5, if no number is found sets to 1
; / // EBX: Contains the index of the number returned in EAX
; / // Pre-conditions:NONE
FindFirstMultOfTen PROC USES edx ecx

MOV esi, ecx
L1 :
MOV eax, [edx]
CALL divideByTen

.IF ebx == 0
JMP J1
.ENDIF

MOV ebx, 4
; / //increment to next value in array
ADD edx, ebx
MOV eax, 1
MOV ebx, -1
LOOP L1
JMP J2

J1 :
; / // divide edx by 4
SUB esi, ecx
MOV ebx, esi
JMP J2

J2 :
ret
FindFirstMultOfTen ENDP






; / // divideByTen Procedure - Gets remainder of a division by 5
; / // Receives: EAX: the number to be divided
; / // Returns: EBX: 0 if there is no remainder (divisible by 5)
; / // or 1 if there is a remainder(not divisible by 5)
; / // Pre-conditions:NONE
divideByTen PROC USES eax ecx edx

; / // get remainder (modulus) result stored in edx
MOV edx, 0
MOV ecx, 10d
DIV ecx

; / // set y = to remainder
MOV eax, edx
.IF eax == 0
MOV ebx, 0
.ELSE
MOV ebx, 1
.ENDIF
MOV ecx, 0
MOV eax, 0
MOV edx, 0
ret
divideByTen ENDP



END main