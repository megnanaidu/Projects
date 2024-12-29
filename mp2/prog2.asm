
;Partner: ellav2
;
;Name: Megna Naidu, NETID: megnan2
;
;This program is of a stack calculator. Users input the operands first, then the operator, and the program
;will take the two operants and perform the operation on them. This program goes through various subroutines
;that check the character the user entered and perform the operation that goes with it. 
;The subroutines invlude: operands are converted to ASCII, then pushed onto the stack, when a space key is
;entered, the program goes past it and gets the next input, when the operator is inputted, the operands are
;popped from the stack and the operation is performed on them, and when the equal sign is entered, the result is 
;popped from the stack and outputted in hex.
;
;Registers for PRINT_HEX subroutine
;R0: used in print loop to load hex characters from array and output
;R1: stores temporary values like extracted bits and ASCII offsets for conversions
;R2: holds the top of array from storing hex values, and used as a pointer in array
;R3: holds value to print in hex at start, then hold accumulated value after bit shifts
;R4: stores values for bit shifting 
;R5: stores original result after operation
;R6: used as a counter throughout subroutine
;R7: holds address to return in subroutines 
;
;Registers for EVALUATE Subroutine
;R0: holds character input from user and used to store values after operations are performed
;R1: used to store ascii values to negate and check if the input is that value, also used to calculate the ;
;number of items in the stack
;R2: used to store top of stack pointer
;R3: used to store the first operand the user inputs
;R4: used to store the second operand the user inputs
;R5: stores the final result after calculation
;R6: not used 
;R7: stores return address for subroutines 
 
.ORIG x3000
	
;your code goes here
AND R3, R3, #0 ;clear R3 to store one operand 
AND R4, R4, #0 ;clear R4 to store the other operand

	
GET_CHAR ;loop to repeat the process with the next character the user inputs 
	GETC ;reads and echos a character from the keyboard (character is in R0)
	OUT

	JSR EVALUATE ;calls subroutine to evaluate the character 
		 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;R3- value to print in hexadecimal
PRINT_HEX

	LD R1, BITMASK
	AND R1, R5, R1 ;extract the last four bits from the number and store in R1
	AND R3, R3, #0 ;R3 will hold the accumulated value after every 4 shifts.
	ADD R3, R5, #0 ;copy the value over to R3
	AND R6, R6, #0
	ADD R6, R6, #4 ;R6 holds counter -> need to repeat 4 times to store all 4 hex values 

	CHECK_HEX
		ADD R1, R1, #-10 ;if the result is negative, the answer is a number 
		BRzp HEX_LETTER
	
		HEX_NUMBER
			ADD R1, R1, #10 ;convert back to it's original decimal value 
			LD R2, ZERO_ASCII
			ADD R1, R1, R2 ;adds decimal value to offset. value is converted to hex eq now
			BRnzp STORE_HEX
		HEX_LETTER
			;the offset from asci A is now stored in R1
			LD R2, A_ASCII
			ADD R1, R1, R2 ;value is converted to hex eq now

	STORE_HEX
	;the bits have been converted to their hex value, store in array now 
	LD R2, ARRAY_TOP
	STR R1, R2, #0
	ADD R2, R2, #-1 ;move top of the stack so it points to next spot
	ST R2, ARRAY_TOP
	  

	SHIFT_BITS
	AND R4, R4, #0 ;clear R4
	ADD R4, R4, #15
	ADD R4, R4, #1
	NOT R4, R4
	ADD R4, R4, #1 ;-16 is now stored in R4
	AND R2, R2, #0 ;R2 will hold the number of times 16 fits into the value

		SHIFT_LOOP
		ADD R2, R2, #1 ;increment the counter every time loop repeats 
		ADD R3, R3, R4 ;subtract value by 16
		BRp SHIFT_LOOP ;as long as the value in R3 is positive, keep subtracting
		
		ADD R3, R3, #0 ;check if the value has a remainder
		BRz DONE_SHIFT

		REMAINDER
			;decrement the counter because 16 didn't fit perfectly 
			ADD R2, R2, #-1
		
		DONE_SHIFT
		ADD R3, R2, #0 ;copy the quotient into R3 to hold accumulated bit shift
		ADD R6, R6, #-1 ;decrement counter of 4
		BRnz PRINT

	GET_4_BITS
	LD R1, BITMASK
	AND R1, R1, R3 ;extract next 4 bits
	BRnzp CHECK_HEX ;convert and store next hex value

	PRINT
	;at this point, all four hex values have been stored in the array. 
	;Now read the array from top to bottom to output in the right order
	LD R2, ARRAY_TOP
	ADD R2, R2, #1 
	AND R6, R6, #0
	ADD R6, R6, #4 ; counter to print 4 values from array

		PRINT_LOOP
			LDR R0, R2, #0 ;load hex character from array into R0
			OUT
			ADD R2, R2, #1 ;move to next value in array
			ADD R6, R6, #-1 ;decrement the counter 
			BRp PRINT_LOOP 
HALT 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;R0 - character input from keyboard
;R6 - current numerical output
;
;
EVALUATE

	;first check if the character is an equal sign
	LD R1, EQUAL_ASCII
	NOT R1, R1
	ADD R1, R1, #1 ;negate the equal ascii character to subtract
	ADD R1, R0, R1 ;subtract character - equal ascii
	BRz EQUAL_CHAR ;if the result is zero, the character is an enter key 

	;now check if it's a space key
	LD R1, SPACE_ASCII
	NOT R1, R1
	ADD R1, R1, #1 ;negate the space ascii character to subtract
	ADD R1, R0, R1 ;subtract character - space ascii
	BRz SPACE_CHAR ;if the result is zero, the character is an enter key

	;now check if it's a number 0-9
	LD R1, ZERO_ASCII
	NOT R1, R1
	ADD R1, R1, #1 ;negate the zero ascii character to subtract
	ADD R1, R0, R1 ;subtract character - zero ascii
	BRzp CHECK_NINE ;if the answer is zp we know the number is at least zero
	BRnzp CHECK_OPERATOR ;if the answer is negative, it's not a number
	CHECK_NINE ;now that we know the number is at least zero, we have to check if it's below 9
		LD R1, NINE_ASCII
		NOT R1, R1
		ADD R1, R1, #1 ;negate ascii 9 to subtract
		ADD R1, R0, R1 ;subtract character - ascii 9
		BRnz NUMBER_CHAR ;if the answer is nz, it's definitely a number now 
	
	;now check if it's an operator 
	CHECK_OPERATOR
		;check multiply 
		LD R1, MULTIPLY_ASCII
		NOT R1, R1
		ADD R1, R1, #1 ;negate multiply ascii to subtract
		ADD R1, R1, R0 ;subtract charachter and multiply ascii
		BRz MUL ;if the answer is zero, go to multiply operation
 
	
		;check add
		LD R1, ADD_ASCII
		NOT R1, R1
		ADD R1, R1, #1 ;negate add ascii to subtract
		ADD R1, R1, R0 ;subtract charachter and add ascii
		BRz PLUS ;if the answer is zero, go to sum operation

		;check minus
		LD R1, MINUS_ASCII
		NOT R1, R1
		ADD R1, R1, #1 ;negate minus ascii to subtract
		ADD R1, R1, R0 ;subtract charachter and minus ascii
		BRz MIN ;if the answer is zero, go to minus operation

		;check divide 
		LD R1, DIVIDE_ASCII
		NOT R1, R1
		ADD R1, R1, #1 ;negate divide ascii to subtract
		ADD R1, R1, R0 ;subtract charachter and divide ascii
		BRz DIV ;if the answer is zero, go to divide operation

		;check exponent
		LD R1, POWER_ASCII
		NOT R1, R1
		ADD R1, R1, #1 ;negate power ascii to subtract
		ADD R1, R1, R0 ;subtract charachter and power ascii
		BRz EXP ;if the answer is zero, go to EXP

		;at this point we kow that the character is not an equal sign, a space,
		;a number 0-9, or an operator, so print invalid message
	 
INVALID 
	;the expression entered was invalid, print invalid and terminate
	LEA R0, INVALID_EXP ;loads address if string into  
	PUTS ;prints invalid message 

DONE 
	;program terminates 
	HALT


SPACE_CHAR
	;since the character has been identified as a space, we skip over it and get next char
	BRnzp GET_CHAR

NUMBER_CHAR 
	;since the character has been identified as a space, we convert to ascii and push onto stack
	;remember the character is currently stored in R0
	LD R1, ZERO_ASCII
	NOT R1, R1
	ADD R1, R1, #1 ;negate ascii zero to subtract
	ADD R0, R0, R1 ;character -ascii zero --> decimal value is stored in R0
	
	;now we push onto stack, need to know to store in R3 or R4
	;check how many values are in stack first
	LD R1, STACK_START
	LD R2, STACK_TOP
	NOT R1, R1
	ADD R1, R1, #1 ;negate start of stack address to subtract
	ADD R1, R2, R1 ;top of stack - start of stack
	BRn SECOND_VAL ;if the result is positive, there is already a value in stack, so store in R4
	;at this point we know this is the first value getting pushed, so store in R3
	ADD R3, R0, #0 ;copy the decimal value over to R3 
	JSR PUSH
	BRnzp GET_CHAR ;the number has been stored in R3, we can read next character now
	SECOND_VAL
		;at this point we know this is the second value getting pushed, so store in R4
		ADD R4, R0, #0 ;copy the decimal value over to R4
		JSR PUSH
		BRnzp GET_CHAR ;the number has been stored in R4, we can read the next character now

EQUAL_CHAR
	;at this point we know the character is an equal sign
	;at this point, the result is being stored in R3 
	;first check that there is exactly one result on the stack
	LD R1, STACK_START
	LD R2, STACK_TOP
	ADD R2, R2, #1 ;need to change pointer to point at last input, currently pointing at next spot
	NOT R1, R1
	ADD R1, R1, #1 ;negate address of stack start to subtract
	ADD R1, R2, R1 ;subtract stack top - stack start, number of items in stack is stored in R1
	ADD R1, R1, #1 ;checks if there is exactly one result
	BRnp INVALID ;if the result is anything but zero, there is more or less than one item in stack

	;at this point we know that there is exactly one result on stack
	;now we pop and print the result 
	JSR POP
	;at this point, the final value is stored in R3
	AND R5, R5, #0 ;clear to store final result in R5
	ADD R5, R3, #0 ;copy the final value into R5
	JSR PRINT_HEX 

	
	 
CHECK_STACK
	;at this point we know the most rceent character inputted is an operator
	;before we can perform the operation, we must check if there are at least 2 items in the stack
	LD R1, STACK_START ;address of starting address of the stack
	LD R2, STACK_TOP ;address of top of stack
	NOT R1, R1
	ADD R1, R1, #1 ;negate the startign address of stack to subtract
	ADD R1, R2, R1 ;subtract top of stack - start of stack
	;at this point, the number of items in the stack will be stored in R1
	ADD R2, R2, #1
	ADD R1, R1, #2 ;subtract number of items on stack - 2
	BRp INVALID ;if the result is negative, there are less than two items in stack -> invalid
	; at this point we know there are at least 2 items in stack, we can return to operation
	RET

PUSH_RESULT
	;at this point, the operation has been performed, and the result is stored in R0
	;now we push the result onto the stack
	AND R3, R3, #0 ;clear R3 to hold the result
	ADD R3, R0, #0 ;copy the result into R3 to push 
	JSR PUSH ;push the result onto the stack
	BRnzp GET_CHAR ;result has been pushed, now get the next character	
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;input R3, R4
;out R0
PLUS	
;your code goes here
	;first check if there are atleast 2 items in the stack
	JSR CHECK_STACK

	JSR POP
	AND R0, R0, #0 ;clear R0 to hold the sum
	ADD R0, R3, R4
	;R3 + R4 is stored in R0 
	BRnzp PUSH_RESULT

	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;input R3, R4
;out R0
MIN	
;your code goes here
	;first check if there are atleast 2 items in the stack
	JSR CHECK_STACK
	JSR POP
	
	AND R0, R0, #0 ;clear R0
	NOT R0, R4
	ADD R0, R0, #1 ;the second value is negated and stored in R0

	ADD R0, R3, R0 ;the difference between R3 - R4 is stored in R0
	BRnzp PUSH_RESULT
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;input R3, R4
;out R0
MUL	
;your code goes here
	;first check if there are atleast 2 items in the stack
	JSR CHECK_STACK
	JSR POP

	ADD R0, R3, #0
    
	MULTIPLY_LOOP    
	ADD R4, R4, #-1    
        BRz MULTIPLY_DONE ;R3+R3 has been added R4 times

	ADD R0, R3, R0 ;the final result is stored in R0
	BRnzp MULTIPLY_LOOP
    
	MULTIPLY_DONE
	BRnzp PUSH_RESULT 
 
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;input R3, R4
;out R0
DIV	
;your code goes here
	;first check if there are atleast 2 items in the stack
	JSR CHECK_STACK
	JSR POP

	AND R0, R0, #0      
	NOT R4, R4
	ADD R4, R4, #1 ;negate R4
	
	DIVIDE_LOOP 
	ADD R3, R4, R3
	BRn DIVIDE_DONE   

	ADD R0, R0, #1    ;Increments every time R4 fits into R3
	ADD R3, R3, #0    
	BRz DIVIDE_DONE    ;Check if R4 cleanly divides into R3
	BRnzp DIVIDE_LOOP

	DIVIDE_DONE
	BRnzp PUSH_RESULT 
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;input R3, R4
;out R0
EXP
;your code goes here
	;first check if there are atleast 2 items in the stack
	JSR CHECK_STACK
	JSR POP
	
	ST R2, BASE	
    	ST R1, EXPONENT
	BASE	 .BLKW #1
	EXPONENT .BLKW #1

	ADD R2, R3, #0 ;load base to R2
    	ADD R4, R4, #0    
    	BRp OUTER ;check if the exponent is 0

    	AND R0, R0, #0		
    	ADD R0, R0, #1
    	LD R2, BASE
    	RET

	OUTER
    	ADD R4, R4, #-1 ;counter
    	BRz FINISH    
    	
	ADD R0, R2, #0 ;R0 now holds the counter
    	ADD R1, R3, #0 ;copy R3 to R1

	INNER
    	ADD R0, R0, #-1 ;decrement counter for multiplication loop
    	BRz OUTER
    	ADD R3, R1, R3 ;R3 now holds the new value
    	BRnzp INNER

	FINISH
    		ADD R0, R3, #0 ;result is stored in R0
    		LD R1, EXPONENT
    		LD R2, BASE	;restore reg
		BRnzp PUSH_RESULT
    		RET
 	
;IN:R0, OUT:R5 (0-success, 1-fail/overflow)
;R3: STACK_END R4: STACK_TOP
;
PUSH	
	ST R3, PUSH_SaveR3	;save R3
	ST R4, PUSH_SaveR4	;save R4
	AND R5, R5, #0		;
	LD R3, STACK_END	;
	LD R4, STACk_TOP	;
	ADD R3, R3, #-1		;
	NOT R3, R3		;
	ADD R3, R3, #1		;
	ADD R3, R3, R4		;
	BRz OVERFLOW		;stack is full
	STR R0, R4, #0		;no overflow, store value in the stack
	ADD R4, R4, #-1		;move top of the stack
	ST R4, STACK_TOP	;store top of stack pointer
	BRnzp DONE_PUSH		;
OVERFLOW
	ADD R5, R5, #1		;
DONE_PUSH
	LD R3, PUSH_SaveR3	;
	LD R4, PUSH_SaveR4	;
	RET


PUSH_SaveR3	.BLKW #1	;
PUSH_SaveR4	.BLKW #1	;


;OUT: R0, OUT R5 (0-success, 1-fail/underflow)
;R3 STACK_START R4 STACK_TOP
;
POP	
	ST R3, POP_SaveR3	;save R3
	ST R4, POP_SaveR4	;save R3
	AND R5, R5, #0		;clear R5
	LD R3, STACK_START	;
	LD R4, STACK_TOP	;
	NOT R3, R3		;
	ADD R3, R3, #1		;
	ADD R3, R3, R4		;
	BRz UNDERFLOW		;
	ADD R4, R4, #1		;
	LDR R0, R4, #0		;
	ST R4, STACK_TOP	;
	BRnzp DONE_POP		;
UNDERFLOW
	ADD R5, R5, #1		;
DONE_POP
	LD R3, POP_SaveR3	;
	LD R4, POP_SaveR4	;
	RET

POP_SaveR3	.BLKW #1	;
POP_SaveR4	.BLKW #1	;
STACK_END	.FILL x3FF0	;	
STACK_START	.FILL x4000	;
STACK_TOP	.FILL x4000	;
EQUAL_ASCII	.FILL x003D	; equal sign
SPACE_ASCII 	.FILL x0020	; space key
ZERO_ASCII	.FILL x0030	; ascii number 0
NINE_ASCII	.FILL x0039	; ascii number 9
MULTIPLY_ASCII	.FILL x002A	; ascii multiply sign
ADD_ASCII	.FILL x002B	; ascii add sign
MINUS_ASCII	.FILL x002D	; ascii subtract sign
DIVIDE_ASCII	.FILL x002F	; ascii divide sign
POWER_ASCII 	.FILL x005E	; ascii power sign
BITMASK		.FILL x000F	; bitmask to extract last four bits
A_ASCII		.FILL x0041	; ascii letter A
INVALID_EXP	.STRINGz " Invalid expression" ;message to print if expression is invalid.
ARRAY_TOP 	.FILL x4100 	;array for hex values

.END
