
TITLE Project3p3(Project3p3.asm)
INCLUDE Irvine32.inc


.data
myStr BYTE "CS340 - Project3p3-Rohweller", 0Dh, 0Ah, 0
dArray1 DWORD 1, 2, 3, 4, 5
; / //3
dArray2 DWORD 2, 3, 5, 8
; / //5
dArray3 DWORD 5, 9, 10, 45, 56, 70
; / //45
dArray4 DWORD 3, 28, 80
; / //28

.code

main PROC

; / //HEADER
MOV edx, OFFSET myStr
CALL WriteString

; / //print array1 median
MOV edx, OFFSET dArray1
MOV ebx, TYPE dArray1
MOV ecx, LENGTHOF dArray1
CALL findMedian
CALL WriteInt

; / //print array 2 median
MOV edx, OFFSET dArray2
MOV ebx, TYPE dArray2
MOV ecx, LENGTHOF dArray2
CALL findMedian
CALL WriteInt

; / //print array 3 median
MOV edx, OFFSET dArray3
MOV ebx, TYPE dArray3
MOV ecx, LENGTHOF dArray3
CALL findMedian
CALL WriteInt

; / //print array 4 median
MOV edx, OFFSET dArray4
MOV ebx, TYPE dArray4
MOV ecx, LENGTHOF dArray4
CALL findMedian
CALL WriteInt


exit
main ENDP

; / // FindMedian Procedure - Finds median of DWORD array
; / // address, with spaces in between
; / // Receives: EDX: contains a pointer to the beginning of the array
; / // EBX: contains the size of the data type in the array 
; / // ECX: Number of elements in the array
; / // Returns:  median in EAX of the array that was pointed to in EDX
; / // Pre-conditions: Assumes the array is sorted in non-decreasing order.
; / // allow findmedian to use edx, ebx, and ecx
findMedian PROC USES edx ebx ecx
; / //clear eax
MOV eax, 0
; / // number of one less than half of the elements of the array
SHR ecx, 1
; / //add one to get median
ADD ecx, 1
; / //Loop through array till the end, overwriting eax till the last number is the only number left
L1:
MOV eax, [edx]
; / //increment to next value in array
ADD edx, ebx
LOOP L1

ret
findMedian ENDP


END main