INCLUDE Irvine32.inc

.data
headerStr BYTE "CS340 - Justin Rohweller - Homework 4 - Due 4/22/2016", 0
value1 DWORD 10101100b
value2 DWORD 00001110b
value3 DWORD ?
value4 BYTE 2h
value5 BYTE 2h
value6 BYTE ?
value7 WORD 2000h
value8 WORD 100h

myStr1 BYTE "1)", 0
myStr2 BYTE "2)", 0
myStr3 BYTE "3)", 0
myStr4 BYTE "4)", 0
myStr5 BYTE "5)", 0
myStr6 BYTE "6)", 0
myStr7 BYTE "7)", 0
myStr8 BYTE "8)", 0
myStr9 BYTE "9)", 0
myStr10 BYTE "10)", 0
myStr11 BYTE "11)", 0
myStr12 BYTE "12)", 0
myStr13 BYTE "13)", 0
myStr14 BYTE "14)", 0
myStr15 BYTE "15)", 0
myStr16 BYTE "16)", 0
myStr17 BYTE "17)", 0
myStr18 BYTE "18)", 0

.code

main PROC

; / // Write Header String
MOV edx, OFFSET headerStr
CALL WriteString
CALL Crlf

; / // 1) AND (any size), EX: 
MOV edx, OFFSET myStr1
CALL WriteString
CALL Crlf
; / // 10101100 AND 00001110 is 0000 1100
MOV eax, value1
AND eax, value2
CALL WriteBin
CALL Crlf

; / // 2) OR (any size), EX: 
MOV edx, OFFSET myStr2
CALL WriteString
CALL Crlf
; / // 10101100 OR 00001110 is 1010 1110
MOV eax, value1
OR eax, value2
CALL WriteBin
CALL Crlf

; / // 3) XOR (any size), EX: 
MOV edx, OFFSET myStr3
CALL WriteString
CALL Crlf
; / // 10101100 XOR 00001110 is 1010 0010
MOV eax, value1
XOR eax, value2
CALL WriteBin
CALL Crlf

; / // 4) NOT (any size), EX:
MOV edx, OFFSET myStr4
CALL WriteString
CALL Crlf
; / // NOT 10101100 is 0101 0011
MOV eax, value1
NEG eax
CALL WriteBin
CALL Crlf

; / // 5) SHL (any size), EX: 
MOV edx, OFFSET myStr5
CALL WriteString
CALL Crlf
; / // 10101100 SHL is 0010 1011 0000
MOV eax, value1
SHL eax, 2
CALL WriteBin
CALL Crlf

; / // 6) SHR (any size), EX: 
MOV edx, OFFSET myStr6
CALL WriteString
CALL Crlf
; / // 10101100 SHR is 0010 1011
MOV eax, value1
SHR eax, 2
CALL WriteBin
CALL Crlf

; / // 7) SAL (any size), EX: 
MOV edx, OFFSET myStr7
CALL WriteString
CALL Crlf
; / // 10101100 SAL is 0010 1011 0000
MOV eax, value1
SAL eax, 2
CALL WriteBin
CALL Crlf

; / // 8) SAR (any size), EX: 
MOV edx, OFFSET myStr8
CALL WriteString
CALL Crlf
; / // 10101100 SAR is 0010 1011
MOV eax, value1
SAR eax, 2
CALL WriteBin
CALL Crlf

; / // 9) ROL (any size), EX:
MOV edx, OFFSET myStr9
CALL WriteString
CALL Crlf
; / // 10101100 ROL is 0010 1011 0000
MOV eax, value1
ROL eax, 2
CALL WriteBin
CALL Crlf

; / // 10) ROR (any size), EX: 
MOV edx, OFFSET myStr10
CALL WriteString
CALL Crlf
; / // 10101100 ROR is 0010 1011
MOV eax, value1
ROR eax, 2
CALL WriteBin
CALL Crlf

; / // 11) RCL (any size), EX: 
MOV edx, OFFSET myStr11
CALL WriteString
CALL Crlf
; / // 10101100 RCL is 0010 1011 0000
MOV eax, value1
RCL eax, 2
CALL WriteBin
CALL Crlf

; / // 12) RCR (any size), EX: 
MOV edx, OFFSET myStr12
CALL WriteString
CALL Crlf
; / // 10101100 RCR is 0010 1011
MOV eax, value1
RCR eax, 2
CALL WriteBin
CALL Crlf

; / // 13) MUL (8-bit dividend), EX: 
MOV edx, OFFSET myStr13
CALL WriteString
CALL Crlf
; / // 2 * 2 = 4
MOV al, value4
MUL value5
CALL WriteHex
CALL Crlf

; / // 14) MUL (16-bit dividend), EX: 
MOV edx, OFFSET myStr14
CALL WriteString
CALL Crlf
; / // 1234 * 100 = 1234
MOV eax, 0
MOV ax, 1234h
MOV bx, 100h
MUL bx
CALL Dumpregs
CALL WriteHex
CALL Crlf

; / // 15) MUL (32-bit dividend), EX: 
MOV edx, OFFSET myStr15
CALL WriteString
CALL Crlf
; / // 1234 * 1000 = 1234000
MOV eax, 0
MOV eax, 1234h
MOV ebx, 1000h
MUL ebx
CALL WriteHex
CALL Crlf

; / // 16) DIV (16-bit dividend), EX:
MOV edx, OFFSET myStr16
CALL WriteString
CALL Crlf
; / //2/2 =1
MOV eax, 0
MOV dl, value5
MOV al, value4
DIV cl
CALL Dumpregs
CALL WriteHex
CALL Crlf

; / // 17) DIV (32-bit dividend), EX:
MOV edx, OFFSET myStr17
CALL WriteString
CALL Crlf
; / //2000/100 =20
MOV eax, 0
MOV dx, 0
MOV ax, value7
MOV cx, value8
DIV cx
CALL WriteHex
CALL Crlf

; / // 18) DIV (64-bit dividend), EX: 

MOV edx, OFFSET myStr18
CALL WriteString
CALL Crlf
; / //8000/100 = 80
MOV edx, 0
MOV eax, 8000h
MOV ecx, 100h
DIV ecx
CALL WriteHex
CALL Crlf


exit
main ENDP
END main