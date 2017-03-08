TITLE MASM Template(Lastname_340_Final.asm)

INCLUDE Irvine32.inc
.data

strName BYTE "FirstName LastName", 0
strAssn BYTE "CS340 - Sys. Prog II - FINAL EXAM", 0
strDate BYTE "May 2, 2016 (2:00PM - 3:50PM)", 0

.code

main PROC
; Print out details for program
mov edx, OFFSET strName
call WriteString
call Crlf

mov edx, OFFSET strAssn
call WriteString
call Crlf

mov edx, OFFSET strDate
call WriteString
call Crlf
call Crlf

; Your code for main starts here...


exit
main ENDP


END main
