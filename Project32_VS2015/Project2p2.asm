
TITLE ProjectTemplate(ProjectTemplate.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - Project 2 Problem 2", 0Dh, 0Ah, 0
num DWORD 6
.code

main PROC
MOV ebx, 0
MOV edx, 1
MOV ecx, num

L1:
MOV eax, edx
ADD eax, ebx
MOV edx,ebx
MOV ebx, eax
CALL WriteInt
LOOP L1

exit
main ENDP
END main