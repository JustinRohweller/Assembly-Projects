
TITLE Project3p4(Project3p4.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - Project3p4-Rohweller", 0Dh, 0Ah, 0
dArray1 DWORD 1, 2, 3, 4, 5
; / // 15
dArray2 DWORD 2, 3, 3, 4    
; / // 12
dArray3 DWORD 5, 5, 5, 5, 5, 7    
; / // 32
dArray4 DWORD 3, 28, 8     
; / // 39

.code

main PROC

; / //HEADER
MOV edx, OFFSET myStr
CALL WriteString

; / // sum dArray1
MOV ebx, TYPE dArray1
MOV edx, OFFSET dArray1
MOV ecx, LENGTHOF dArray1
CALL sumArray
CALL WriteInt

; / // sum dArray2
MOV ebx, TYPE dArray2
MOV edx, OFFSET dArray2
MOV ecx, LENGTHOF dArray2
CALL sumArray
CALL WriteInt

; / // sum dArray3
MOV ebx, TYPE dArray3
MOV edx, OFFSET dArray3
MOV ecx, LENGTHOF dArray3
CALL sumArray
CALL WriteInt

; / // sum dArray4
MOV edx, OFFSET dArray4
MOV ebx, TYPE dArray4
MOV ecx, LENGTHOF dArray4
CALL sumArray
CALL WriteInt

exit
main ENDP
; / // sumArray Procedure - Finds summation of DWORD array
; / // address, with spaces in between
; / // Receives: EDX: contains a pointer to the beginning of the array
; / // EBX: contains the size of the data type in the array 
; / // ECX: Number of elements in the array
; / // Returns:  summation in EAX of the array that was pointed to in EDX
; / // Pre-conditions: Assumes the array is sorted in non-decreasing order.
sumArray PROC USES edx ebx ecx
; / // clear eax
MOV eax, 0
; / //loop through array
L1:
; / //add each value to itself in eax
ADD eax, [edx]
; / //increment to next value in array
ADD edx, ebx
LOOP L1

ret
sumArray ENDP

END main