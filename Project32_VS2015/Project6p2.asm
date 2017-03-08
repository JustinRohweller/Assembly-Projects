TITLE MASM body(main.asm)
INCLUDE Irvine32.inc
.data
myStr4 BYTE "CS340 -Justin Rohweller and Kyle Nakamura", 0Dh, 0Ah, 0
myStr1 BYTE "Address 0019FF70= ", 0Dh, 0Ah, 0
myStr2 BYTE "Address 0019FF74= ", 0Dh, 0Ah, 0
myStr3 BYTE "Address 0019FF78= ", 0Dh, 0Ah, 0

result DWORD ?

.code

Sum PROTO param1 : DWORD, param2 : DWORD, return : PTR DWORD
showParams PROTO paramCount : DWORD

; MAIN Procedure
main PROC
; / //header
MOV edx, OFFSET myStr4
CALL WriteString
push 340

invoke Sum, 5, 2, ADDR result

; Print out the sum
mov eax, result
Call WriteInt
Call Crlf

; Print out the Stack test
pop eax
Call WriteInt
Call Crlf

exit
main ENDP

; SUM Procedure
Sum PROC USES ebx param1 : DWORD, param2 : DWORD, return : PTR DWORD
LOCAL loc : DWORD

mov ebx, param1
add ebx, param2
mov loc, ebx
; mov eax, loc

mov esi, return
mov edi, return
mov[edi], ebx

invoke showParams, 3
ret
Sum ENDP

showParams PROC paramCount : DWORD
; / //offset esi EBP
MOV esi, ebp
MOV ecx, paramCount
ADD esi, 24


MOV edx, OFFSET myStr1
CALL WriteString
MOV eax, [esi]
CALL WriteHex
CALL Crlf
ADD esi, 4


MOV edx, OFFSET myStr2
CALL WriteString
MOV eax, [esi]
CALL WriteHex
CALL Crlf
ADD esi, 4

MOV edx, OFFSET myStr3
CALL WriteString
MOV eax, [esi]
CALL WriteHex
CALL Crlf
ADD esi, 4



ret
showParams ENDP


END main