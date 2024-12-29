;partner: ellav2
;
; The code given to you here implements the histogram calculation that 
; we developed in class.  In programming lab, we will add code that
; prints a number in hexadecimal to the monitor.
;
; Your assignment for this program is to combine these two pieces of 
; code to print the histogram to the monitor.
;
; If you finish your program, 
;    ** commit a working version to your repository  **
;    ** (and make a note of the repository version)! **


	.ORIG	x3000		; starting address is x3000


;
; Count the occurrences of each letter (A to Z) in an ASCII string 
; terminated by a NUL character.  Lower case and upper case should 
; be counted together, and a count also kept of all non-alphabetic 
; characters (not counting the terminal NUL).
;
; The string starts at x4000.
;
; The resulting histogram (which will NOT be initialized in advance) 
; should be stored starting at x3F00, with the non-alphabetic count 
; at x3F00, and the count for each letter in x3F01 (A) through x3F1A (Z).
;
; table of register use in this part of the code
;    R0 holds a pointer to the histogram (x3F00)
;    R1 holds a pointer to the current position in the string
;       and as the loop count during histogram initialization
;    R2 holds the current character being counted
;       and is also used to point to the histogram entry
;    R3 holds the additive inverse of ASCII '@' (xFFC0)
;    R4 holds the difference between ASCII '@' and 'Z' (xFFE6)
;    R5 holds the difference between ASCII '@' and '`' (xFFE0)
;    R6 is used as a temporary register
;

	LD R0,HIST_ADDR      	; point R0 to the start of the histogram
	
	; fill the histogram with zeroes 
	AND R6,R6,#0		; put a zero into R6
	LD R1,NUM_BINS		; initialize loop count to 27
	ADD R2,R0,#0		; copy start of histogram into R2

	; loop to fill histogram starts here
HFLOOP	STR R6,R2,#0		; write a zero into histogram
	ADD R2,R2,#1		; point to next histogram entry
	ADD R1,R1,#-1		; decrement loop count
	BRp HFLOOP		; continue until loop count reaches zero

	; initialize R1, R3, R4, and R5 from memory
	LD R3,NEG_A		; set R3 to additive inverse of ASCII '@'
	LD R4,AT_MIN_Z		; set R4 to difference between ASCII '@' and 'Z'
	LD R5,AT_MIN_BQ		; set R5 to difference between ASCII '@' and '`'
	LD R1,STR_START		; point R1 to start of string

	; the counting loop starts here
COUNTLOOP
	LDR R2,R1,#0		; read the next character from the string
	BRz PRINT_HIST		; found the end of the string

	ADD R2,R2,R3		; subtract '@' from the character
	BRp AT_LEAST_A		; branch if > '@', i.e., >= 'A'
NON_ALPHA
	LDR R6,R0,#0		; load the non-alpha count
	ADD R6,R6,#1		; add one to it
	STR R6,R0,#0		; store the new non-alpha count
	BRnzp GET_NEXT		; branch to end of conditional structure
AT_LEAST_A
	ADD R6,R2,R4		; compare with 'Z'
	BRp MORE_THAN_Z         ; branch if > 'Z'

; note that we no longer need the current character
; so we can reuse R2 for the pointer to the correct
; histogram entry for incrementing
ALPHA	ADD R2,R2,R0		; point to correct histogram entry
	LDR R6,R2,#0		; load the count
	ADD R6,R6,#1		; add one to it
	STR R6,R2,#0		; store the new count
	BRnzp GET_NEXT		; branch to end of conditional structure

; subtracting as below yields the original character minus '`'
MORE_THAN_Z
	ADD R2,R2,R5		; subtract '`' - '@' from the character
	BRnz NON_ALPHA		; if <= '`', i.e., < 'a', go increment non-alpha
	ADD R6,R2,R4		; compare with 'z'
	BRnz ALPHA		; if <= 'z', go increment alpha count
	BRnzp NON_ALPHA		; otherwise, go increment non-alpha

GET_NEXT
	ADD R1,R1,#1		; point to next character in string
	BRnzp COUNTLOOP		; go to start of counting loop



PRINT_HIST

; you will need to insert your code to print the histogram here

; do not forget to write a brief description of the approach/algorithm
; for your implementation, list registers used in this part of the code,
; and provide sufficient comments

;Megna Naidu (NETID: megnan2)
;09/04/2024 MP1: Printing a histogram in hex values 
;This entire program will take a string and print out a historgram of the 
;frequency of every letter, number, and other characters in hex.
;the first part of this program implements the histogram calculation. 
;the second part of this program goes over the histogram data and print each letter's 
;frequency in hexadecimal. This programs checks the conditions of each character, converts the 
;count of each letter to its corresponding hexadecimal value, and then prints it. This loops 
;continues 27 times until all letters and non-alphabetic characters go through.

;REGISTER TABLE:
;R0: temporary register to hold characters to output
;R1: holds base address for histogram (starting point of the letter frequencies)
;R2: iteration counter (loops through all letters A-Z)
;R3: stores the current frequency of the letter being processed
;R4: holds the ASCII value of the current letter
;R5: used to store temporary values of offsets, or for immediate calculations  
;R6: holds the base address of the output location
;R7: not used. kept for the return address to return from subroutines

	AND R4, R4, #0	;initialize R4
 	LD R4,HIST_ADDR	; The starting address of the histogram is in R4
	AND R6, R6, #0 ;initialize R6

LOAD_CHARACTERS ;
	LD R3,NUM_BINS	; R3=27
	
	NOT R3,R3		
	ADD R3,R3,#1 ;after negating, R3 now holds -27.		

	ADD R3,R3,R6 ;add negtive 27 with R6 into R3 
	;remember R6 is the counter
	BRz DONE ;if result is zero, everything has been printed
	
PRINT_BIN
	LD R0,POSITIVE_AT ;load ASCII code for at into RO 
	ADD R0,R0,R6 ;add R6 with R0 into R0 
	OUT ;prints the current letter to the screen
	LD R0,SPACE ;load ASCII code for space into R0
	OUT ;prints spaceto screen
	;now load the count for current histogram bin
	LDR R3,R4,#0 ;value stored at address of R4 is now in R3		
	AND R1,R1,#0 ;initialize R1 to #0, will handle the number of digits in thr count		
	
CONVERT_HEX
	ADD R1,R1,#-4 ;this instruction checks if the count has more digits 		
	BRzp NEW_LINE ;zero or positive, calculations is done. 		 				
	ADD R1,R1,#4 ;initialize R1 back		
	AND R2,R2,#0		
	AND R5,R5,#0
   
CHECK_BITS
	;now we have to shift and check bits to find the hex equivalent	
	ADD R2,R2,#-4 ;shift counter
	BRzp CHECK_NUM						
	ADD R2,R2,#4		
	ADD R5,R5,R5		
	ADD R3,R3,#0		
	BRn HEX_COUNTER					
	ADD R5,R5,#0		
	BRnzp COPY		

HEX_COUNTER
	;here the program increments R5 when a bit is detected, forming the hex digit
	ADD R5,R5,#1 ;increments R5

COPY
	;Now, we have to shift the current value in R3, which holds the count of the 
	;current histogram bin, left by one bit
	ADD R3,R3,R3 ;shift R3		
	ADD R2,R2,#1 ;increments R2
	;after shifitng, we have to check bits again
	BRnzp CHECK_BITS ; go to BITCHECK to check the number of bits

CONVERT_TO_ASCII
CHECK_NUM
	ADD R5,R5,#-9 ;check to see if character is a letter
	BRp LETTER ;if positive, the character is a letter, branches to letter conversion
	;character is a number, so program keeps going
	LD R0,ASCII_ZERO ;equivalent of ASCII zero is loaded into R0.
	ADD R5,R5,#9 ;initialize R5 back		; 
	ADD R0,R0,R5 ;add R5 and R0 into R5 to get the correct ASCII number (0-9)
	BRnzp OUTPUT ;print value

LETTER
	;at this point, it's a letter, converts it to ascii letter 
	LD R0,CHARACTER	;load ASCII A into R0 in hex
	ADD R5,R5,#9 ;initialize R5 back		 
	ADD R0,R0,R5 ;add R5 + R0 to ger the correct ASCII letter (A-F)		
	ADD R0,R0,#-10 ;ascii offset 		

OUTPUT
	OUT ;print vaule in R0
	ADD R1,R1,#1 ;increment digits counter
	BRnzp CONVERT_HEX ;go back to convert rest of the values to hex

;at this point in the program a full value has been found and outputted
;now you output the frequency of the next value

NEW_LINE
	LD R0,NEWLINE	;load ASCII return into RO 
	OUT ;A new line is now printed
	ADD R6,R6,#1 ;increments R6
	ADD R4,R4,#1 ;increments R4
	BRnzp LOAD_CHARACTERS ;check if everything has printed  
	
;at this point in the program, the full histogram has been printed
DONE	HALT ;stop the program

;LABELS I CREATED
SPACE		.FILL X0020	; ASCII code for 'space'
POSITIVE_AT	.FILL X0040	; ASCII code for 'at'
CHARACTER	.FILL X0041	; ASCII code for 'A'
NEWLINE	.FILL X000A	; ASCII code for 'enter'
ASCII_ZERO		.FILL X0030	; ASCII code for '0'


; the data needed by the program
NUM_BINS	.FILL #27	; 27 loop iterations
NEG_A		.FILL xFFC0	; the additive inverse of ASCII '@'
AT_MIN_Z	.FILL xFFE6	; the difference between ASCII '@' and 'Z'
AT_MIN_BQ	.FILL xFFE0	; the difference between ASCII '@' and '`'
HIST_ADDR	.FILL x3F00     ; histogram starting address
STR_START	.FILL x4000	; string starting address


; for testing, you can use the lines below to include the string in this
; program...
;STR_START	.FILL STRING	; string starting address
;STRING		.STRINGZ "This is a test of the counting frequency code.  AbCd...WxYz."



	; the directive below tells the assembler that the program is done
	; (so do not write any code below it!)

	.END
