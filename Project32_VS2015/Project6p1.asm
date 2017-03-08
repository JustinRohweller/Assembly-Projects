TITLE ProjectTemplate(ProjectTemplate.asm)

INCLUDE Irvine32.inc

.data
headerStr BYTE "CS340 -Justin Rohweller and Kyle Nakamura", 0
avgStr BYTE "The average of the numbers is: ", 0
eaxStr BYTE "The eax register holds the value: ", 0

a1 DWORD 2, 5, 1, 8, 3;// AVG = 3
a2 DWORD 38, 29, 23, 993;// AVG = 72
a3 DWORD 13, 14, 15;// AVG = 70
a4 DWORD 0, 0, 0, 0, 0, 0, 0, 8;// AVG = 1

result DWORD ?

.code

AVG PROTO arrayAddr : DWORD, len : DWORD, returnVal : PTR DWORD

main PROC
PUSH 340;// 340 added to the stack - just to make sure all pushes/pops are done properly

; // Write Header String
mov edx, OFFSET headerStr
call WriteString
call Crlf
CALL Crlf

INVOKE AVG, OFFSET a1, LENGTHOF a1, ADDR result;// Calling avg on the first array
MOV edx, OFFSET avgStr;// Prepare to print "The average is..." string
CALL WriteString;// Print the string
MOV eax, result;// Printing the avg of the first array
CALL WriteInt;// Writing the avg of the array
CALL Crlf;// Newline
CALL clearRegs;// Call procedure to clear all registers

INVOKE AVG, OFFSET a2, LENGTHOF a2, ADDR result;// Calling avg on the first array
MOV edx, OFFSET avgStr;// Prepare to print "The average is..." string
CALL WriteString;// Print the string
MOV eax, result;// Printing the avg of the first array
CALL WriteInt;// Writing the avg of the array
CALL Crlf;// Newline
CALL clearRegs;// Call procedure to clear all registers

INVOKE AVG, OFFSET a3, LENGTHOF a3, ADDR result;// Calling avg on the first array
MOV edx, OFFSET avgStr;// Prepare to print "The average is..." string
CALL WriteString;// Print the string
MOV eax, result;// Printing the avg of the first array
CALL WriteInt;// Writing the avg of the array
CALL Crlf;// Newline
CALL clearRegs;// Call procedure to clear all registers

INVOKE AVG, OFFSET a4, LENGTHOF a4, ADDR result;// Calling avg on the first array
MOV edx, OFFSET avgStr;// Prepare to print "The average is..." string
CALL WriteString;// Print the string
MOV eax, result;// Printing the avg of the first array
CALL WriteInt;// Writing the avg of the array
CALL Crlf;// New line
CALL clearRegs;// Call procedure to clear all registers

;// Make sure eax still holds the pushed value 340
MOV edx, OFFSET eaxStr;// Prepare eaxStr to be printed
CALL WriteString;// Print the string "eax holds..."
POP eax;// EAX = 340
CALL WriteInt;// Writing 340
CALL Crlf;// New line
CALL Crlf;// New line
exit
main ENDP

AVG PROC USES esi ecx eax edx, arrayAddr: DWORD, len : DWORD, returnVal : PTR DWORD
LOCAL sum : DWORD;// Declaring a local variable sum

MOV ecx, len;// ECX = length of the array
MOV esi, arrayAddr;// ESI = address of the array
MOV sum, 0;// Sum = 0

L1:;// Begin loop called L1
MOV eax, [esi];// EAX = current array element                             ; / // If the current array element is greater than current AVG
ADD sum, eax;// Now sum is the current sum
ADD esi, 4;// Move to the next array element
LOOP L1;// Loop until the end of the array

MOV esi, returnVal;// ESI = address of returnVal variable
MOV eax, sum;// EAX = sum (cannot move sum directly into returnVal)
MOV ebx, len;// EBX = length of the array
MOV edx, 0;// Clear edx, preparing for division
DIV ebx;// Divides eax (sum) and edx (0) by ebx (5)
MOV[esi], eax;// the returnVal variable = EAX (curAVG)
ret;// returning to main method
AVG ENDP;// End AVG procedure

;// I use this procedure to clear every register that I will be needed for each test case
clearRegs PROC
MOV eax, 0
MOV ebx, 0
MOV ecx, 0
MOV edx, 0
MOV esi, 0
MOV edi, 0
CALL Crlf
ret
clearRegs endp
END main