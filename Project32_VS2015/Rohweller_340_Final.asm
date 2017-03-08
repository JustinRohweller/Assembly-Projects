TITLE MASM Template(Lastname_340_Final.asm)

INCLUDE Irvine32.inc
.data

strName BYTE "FirstName LastName", 0
strAssn BYTE "CS340 - Sys. Prog II - FINAL EXAM", 0
strDate BYTE "May 2, 2016 (2:00PM - 3:50PM)", 0
PROTO MULT_7_3 input : DWORD PTR, arrayLength: DWORD, returnval1: DWORD, returnval2: DWORD
a1 DWORD 3, 6, 7, 14, 12
a2 DWORD 7, 21, 21, 3, 42
a3 DWORD 1, 4, 8, 21
multiplesOf7 DWORD ?
multiplesOf3 DWORD ?
.code

main PROC
; / //Print out details for program
mov edx, OFFSET strName
call WriteString
call Crlf

mov edx, OFFSET strAssn
call WriteString
call Crlf

mov edx, OFFSET strDate
call WriteString
call Crlf

; Your code for main starts here...
PUSH 340
INVOKE MULT_7_3 input, arrayLength


POP eax
CALL WriteInt
CALL Crlf

exit
main ENDP

MULT_7_3 PROC input : DWORD PTR, arrayLength : DWORD, returnval1:DWORD, returnval2:DWORD
LocalVar DWORD numberOf7s
LocalVar DWORD numberOf3s



MOV ecx, arrayLength
MOV esi, 0
MOV esp, 0
L1:
MOV eax, [ebx]
CALL Divideby7
.IF edx==0
ADD esi, 1
.ENDIF

CALL Divideby3
.IF edx == 0
ADD esp, 1
.ENDIF

ADD ebx, 4
LOOP L1

MOV numberOf7s, esi
MOV numberOf3s, esp
ret
MULT_7_3 ENDP

; / //returns 0 if divisible, 1 if not
Divideby7 PROC USES eax ebx
MOV edx, 0
MOV ebx, 7
DIV ebx
.IF edx==0
MOV edx, 0
.ELSE
MOV edx, 1
.ENDIF
ret
DivideBy7 ENDP

; / //returns 0 if divisible, 1 if not
Divideby3 PROC USES eax ebx
MOV edx, 0
MOV ebx, 7
DIV ebx
.IF edx == 0
MOV edx, 0
.ELSE
MOV edx, 1
.ENDIF
ret
DivideBy3 ENDP




END main
