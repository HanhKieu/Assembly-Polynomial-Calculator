TITLE Lab Assignment 2 (lab2.asm)


INCLUDE Irvine32.inc

;==========================
;PROGRAM AIMS TO CALCULATE f(x,y,z) = 1 + x + y^2 + z^3
;UPON GIVEN INPUT
;ONLY CALCULATES THESE VALUES FOR POSITIVE NUMBERS
;===========================

.data

	prompt BYTE "Enter the value of x : ", 0 ;Each string with null terminator
	prompt2 BYTE "Enter the value of y : ", 0
	prompt3 BYTE "Enter the value of z : ", 0
	answer BYTE "The value of f(x,y,z) is : ", 0


.code

main PROC
	mov eax, 0 
	mov edx, OFFSET prompt ;move first address to EDX so WriteString can display
	call WriteString
	call ReadHex;====INPUT===x is read
	add eax, 1 ; x + 1
	mov edi, eax; edi now holds the sum
	mov edx, OFFSET prompt2
	call WriteString
	call ReadHex; ====INPUT==== y in eax
	xchg edi, eax; edi now holds the value y and eax holds the sum
	call squareValues
	mov edi, eax ;move the sum into edi
	mov edx, OFFSET prompt3
	call WriteString
	call ReadHex; ====INPUT==== input z into eax
	xchg edi, eax; eax now hold sums, edi holds value z
	call cubeValues ;sum of 1 + x + y^2 + z^3 has now been full calculated
	;after cubeValues finish its procedure call
	
	mov edx, OFFSET answer
	call WriteString
	mov edx, eax
	call WriteHex;writes 32-bit integer to commadnd
	;call DumpRegs


exit
main ENDP



squareValues PROC USES ecx edi
	mov ecx, edi
	L1:
		add eax, edi
	loop L1


	ret
	
	
squareValues ENDP;PROCEDURE THAT CALCULATES THE SQUARE OF VALUE

cubeValues PROC USES ecx edi
	
	mov ecx, edi
	mov esi, 0
	L2:
		add esi, edi
	loop L2 ;finds the square of z
	
	
	mov ecx,esi
	;call DumpRegs
	
	L3:
	add eax,edi
	loop L3
	
	ret


cubeValues ENDP ;PROCEDURE THAT CALCULATES THE CUBE OF A VALUE


END main


