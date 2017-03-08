TITLE Project1(Project1.asm)
INCLUDE Irvine32.inc


.data
nl EQU <0dh, 0Ah, 0>
nlStr BYTE nl
myStr BYTE "CS340 - Project1p1.asm", nl

; / // Just a bunch of data types and their maxes i thinks

maxb BYTE 255d
minb BYTE 0d
maxhb BYTE 5Ah

maxsb SBYTE 127d
minsb SBYTE -127d
maxhsb SBYTE 2Bh

maxw WORD 65535d
minw WORD 0d
maxhw  WORD 3A49h

maxsw SWORD 32767d
minsw SWORD -32767d
maxhsw SWORD 9BA1h

maxdw DWORD 4294967295d
mindw DWORD 0d
maxhdw  DWORD 1A2B3C4Dh

maxsdw SDWORD 2147483647d
minsdw SDWORD -2147483647d
maxhsdw  SDWORD 13BA42CCh

maxfw FWORD 2E14d
minfw FWORD 0d
maxhfw FWORD 123456654321h

maxqw QWORD 1E19d
minqw QWORD 0d
maxhqw QWORD 1234567887654321h

maxtb TBYTE 1E24d
mintb TBYTE 0d
maxhtb TBYTE 123456789AA987654321h

maxre4 REAL4 4294967295d
minre4 REAL4 0d
maxhre4 REAL4 h

maxre8 REAL8 1E19d
minre8 REAL8 0d
maxhre8 REAL8 h

maxre10 REAL10 1E24d
minre10 REAL10 0d
maxhre10 REAL10 h


.code

main PROC
; / // Printing file title
MOV edx, OFFSET myStr
CALL WriteString

exit
main ENDP
END main
