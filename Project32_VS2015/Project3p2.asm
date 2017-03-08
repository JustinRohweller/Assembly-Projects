
TITLE Project3p2(Project3p2.asm)
INCLUDE Irvine32.inc

.data

; / // Code begins here 
myStr BYTE "CS340 - Project3p2-Rohweller", 0Dh, 0Ah, 0
fibToCompute = 47
fibArray DWORD 1, 1, fibToCompute dup(?)
BUFFER_SIZE = SIZEOF fibArray
fileHandle DWORD ?
buffer BYTE "llly", 0
; / //name new file of output
filename BYTE "output.bin"

.code

main PROC

; / //HEADER
MOV edx, OFFSET myStr
CALL WriteString

MOV ecx, fibToCompute
MOV esi, 0
L2:
MOV ebx, fibArray[esi]
ADD ebx, fibArray[esi + 4]
ADD fibArray[esi + 8], ebx
ADD esi, TYPE fibArray
LOOP L2

; / // putting array into buffer //the issue is that the array is printed as the ? marks, and not the actual values, idk why.
; / //MOV buffer, fibArray

; / //create output file
MOV edx, OFFSET filename
CALL CreateOutputFile
MOV filehandle, eax

; / //printing to file
MOV edx, OFFSET fibArray
MOV ecx, BUFFER_SIZE
CALL WriteToFile

; / //closing the file
mov eax, fileHandle
CALL CloseFile

exit
main ENDP
END main