
TITLE ProjectTemplate(ProjectTemplate.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 -Project 2 Problem 1", 0Dh, 0Ah, 0

.code

main PROC
; / // Writes string in edx
MOV eax, OFFSET myStr
CALL WriteString



; / // carry flag set because 1-2=-1
mov eax, 0
mov eax, 1
sub eax, 2
CALL DumpRegs

; / // carry flag not set because 1+1 is not >byte
mov eax, 0
mov eax, 1
sub eax, 1
CALL DumpRegs


; / // sign flag set because 1-2=-1
mov eax, 0
mov eax, 1
sub eax, 2
CALL DumpRegs

; / // sign flag not set because 1-1=0.
mov eax, 0
mov eax, 1
sub eax, 1
CALL DumpRegs


; / // zero flag set because 1-1=0.
mov eax, 0
mov eax, 1
sub eax, 1
CALL DumpRegs

; / // zero flag not set because 1-2 is negative.
mov eax, 0
mov eax, 1
sub eax, 2
CALL DumpRegs



; / // overflow flag set because 127 +2 >127
mov eax, 0
mov al, 127
add al, 2
CALL DumpRegs

; / // overflow flag not set because 1-1 is not out of eax.
mov eax, 0
mov eax, 1
sub eax, 1
CALL DumpRegs




exit
main ENDP
END main