        .ORIG x0000

; the TRAP vector table
	.FILL BAD_TRAP	; x00
	.FILL BAD_TRAP	; x01
	.FILL BAD_TRAP	; x02
	.FILL BAD_TRAP	; x03
	.FILL BAD_TRAP	; x04
	.FILL BAD_TRAP	; x05
	.FILL BAD_TRAP	; x06
	.FILL BAD_TRAP	; x07
	.FILL BAD_TRAP	; x08
	.FILL BAD_TRAP	; x09
	.FILL BAD_TRAP	; x0A
	.FILL BAD_TRAP	; x0B
	.FILL BAD_TRAP	; x0C
	.FILL BAD_TRAP	; x0D
	.FILL BAD_TRAP	; x0E
	.FILL BAD_TRAP	; x0F
	.FILL BAD_TRAP	; x10
	.FILL BAD_TRAP	; x11
	.FILL BAD_TRAP	; x12
	.FILL BAD_TRAP	; x13
	.FILL BAD_TRAP	; x14
	.FILL BAD_TRAP	; x15
	.FILL BAD_TRAP	; x16
	.FILL BAD_TRAP	; x17
	.FILL BAD_TRAP	; x18
	.FILL BAD_TRAP	; x19
	.FILL BAD_TRAP	; x1A
	.FILL BAD_TRAP	; x1B
	.FILL BAD_TRAP	; x1C
	.FILL BAD_TRAP	; x1D
	.FILL BAD_TRAP	; x1E
	.FILL BAD_TRAP	; x1F
	.FILL TRAP_GETC	; x20
	.FILL TRAP_OUT	; x21
	.FILL TRAP_PUTS	; x22
	.FILL TRAP_IN	; x23
	.FILL TRAP_PUTSP ; x24        
	.FILL TRAP_HALT	; x25
	.FILL BAD_TRAP	; x26
	.FILL BAD_TRAP	; x27
	.FILL BAD_TRAP	; x28
	.FILL BAD_TRAP	; x29
	.FILL BAD_TRAP	; x2A
	.FILL BAD_TRAP	; x2B
	.FILL BAD_TRAP	; x2C
	.FILL BAD_TRAP	; x2D
	.FILL BAD_TRAP	; x2E
	.FILL BAD_TRAP	; x2F
	.FILL BAD_TRAP	; x30
	.FILL BAD_TRAP	; x31
	.FILL BAD_TRAP	; x32
	.FILL BAD_TRAP	; x33
	.FILL BAD_TRAP	; x34
	.FILL BAD_TRAP	; x35
	.FILL BAD_TRAP	; x36
	.FILL BAD_TRAP	; x37
	.FILL BAD_TRAP	; x38
	.FILL BAD_TRAP	; x39
	.FILL BAD_TRAP	; x3A
	.FILL BAD_TRAP	; x3B
	.FILL BAD_TRAP	; x3C
	.FILL BAD_TRAP	; x3D
	.FILL BAD_TRAP	; x3E
	.FILL BAD_TRAP	; x3F
	.FILL BAD_TRAP  ; x40
	.FILL BAD_TRAP  ; x41
	.FILL BAD_TRAP	; x42
	.FILL BAD_TRAP	; x43
	.FILL BAD_TRAP	; x44
	.FILL BAD_TRAP	; x45
	.FILL BAD_TRAP	; x46
	.FILL BAD_TRAP	; x47
	.FILL BAD_TRAP	; x48
	.FILL BAD_TRAP	; x49
	.FILL BAD_TRAP	; x4A
	.FILL BAD_TRAP	; x4B
	.FILL BAD_TRAP	; x4C
	.FILL BAD_TRAP	; x4D
	.FILL BAD_TRAP	; x4E
	.FILL BAD_TRAP	; x4F
	.FILL BAD_TRAP	; x50
	.FILL BAD_TRAP	; x51
	.FILL BAD_TRAP	; x52
	.FILL BAD_TRAP	; x53
	.FILL BAD_TRAP	; x54
	.FILL BAD_TRAP	; x55
	.FILL BAD_TRAP	; x56
	.FILL BAD_TRAP	; x57
	.FILL BAD_TRAP	; x58
	.FILL BAD_TRAP	; x59
	.FILL BAD_TRAP	; x5A
	.FILL BAD_TRAP	; x5B
	.FILL BAD_TRAP	; x5C
	.FILL BAD_TRAP	; x5D
	.FILL BAD_TRAP	; x5E
	.FILL BAD_TRAP	; x5F
	.FILL BAD_TRAP	; x60
	.FILL BAD_TRAP	; x61
	.FILL BAD_TRAP	; x62
	.FILL BAD_TRAP	; x63
	.FILL BAD_TRAP	; x64
	.FILL BAD_TRAP	; x65
	.FILL BAD_TRAP	; x66
	.FILL BAD_TRAP	; x67
	.FILL BAD_TRAP	; x68
	.FILL BAD_TRAP	; x69
	.FILL BAD_TRAP	; x6A
	.FILL BAD_TRAP	; x6B
	.FILL BAD_TRAP	; x6C
	.FILL BAD_TRAP	; x6D
	.FILL BAD_TRAP	; x6E
	.FILL BAD_TRAP	; x6F
	.FILL BAD_TRAP	; x70
	.FILL BAD_TRAP	; x71
	.FILL BAD_TRAP	; x72
	.FILL BAD_TRAP	; x73
	.FILL BAD_TRAP	; x74
	.FILL BAD_TRAP	; x75
	.FILL BAD_TRAP	; x76
	.FILL BAD_TRAP	; x77
	.FILL BAD_TRAP	; x78
	.FILL BAD_TRAP	; x79
	.FILL BAD_TRAP	; x7A
	.FILL BAD_TRAP	; x7B
	.FILL BAD_TRAP	; x7C
	.FILL BAD_TRAP	; x7D
	.FILL BAD_TRAP	; x7E
	.FILL BAD_TRAP	; x7F
	.FILL BAD_TRAP	; x80
	.FILL BAD_TRAP	; x81
	.FILL BAD_TRAP	; x82
	.FILL BAD_TRAP	; x83
	.FILL BAD_TRAP	; x84
	.FILL BAD_TRAP	; x85
	.FILL BAD_TRAP	; x86
	.FILL BAD_TRAP	; x87
	.FILL BAD_TRAP	; x88
	.FILL BAD_TRAP	; x89
	.FILL BAD_TRAP	; x8A
	.FILL BAD_TRAP	; x8B
	.FILL BAD_TRAP	; x8C
	.FILL BAD_TRAP	; x8D
	.FILL BAD_TRAP	; x8E
	.FILL BAD_TRAP	; x8F
	.FILL BAD_TRAP	; x90
	.FILL BAD_TRAP	; x91
	.FILL BAD_TRAP	; x92
	.FILL BAD_TRAP	; x93
	.FILL BAD_TRAP	; x94
	.FILL BAD_TRAP	; x95
	.FILL BAD_TRAP	; x96
	.FILL BAD_TRAP	; x97
	.FILL BAD_TRAP	; x98
	.FILL BAD_TRAP	; x99
	.FILL BAD_TRAP	; x9A
	.FILL BAD_TRAP	; x9B
	.FILL BAD_TRAP	; x9C
	.FILL BAD_TRAP	; x9D
	.FILL BAD_TRAP	; x9E
	.FILL BAD_TRAP	; x9F
	.FILL BAD_TRAP	; xA0
	.FILL BAD_TRAP	; xA1
	.FILL BAD_TRAP	; xA2
	.FILL BAD_TRAP	; xA3
	.FILL BAD_TRAP	; xA4
	.FILL BAD_TRAP	; xA5
	.FILL BAD_TRAP	; xA6
	.FILL BAD_TRAP	; xA7
	.FILL BAD_TRAP	; xA8
	.FILL BAD_TRAP	; xA9
	.FILL BAD_TRAP	; xAA
	.FILL BAD_TRAP	; xAB
	.FILL BAD_TRAP	; xAC
	.FILL BAD_TRAP	; xAD
	.FILL BAD_TRAP	; xAE
	.FILL BAD_TRAP	; xAF
	.FILL BAD_TRAP	; xB0
	.FILL BAD_TRAP	; xB1
	.FILL BAD_TRAP	; xB2
	.FILL BAD_TRAP	; xB3
	.FILL BAD_TRAP	; xB4
	.FILL BAD_TRAP	; xB5
	.FILL BAD_TRAP	; xB6
	.FILL BAD_TRAP	; xB7
	.FILL BAD_TRAP	; xB8
	.FILL BAD_TRAP	; xB9
	.FILL BAD_TRAP	; xBA
	.FILL BAD_TRAP	; xBB
	.FILL BAD_TRAP	; xBC
	.FILL BAD_TRAP	; xBD
	.FILL BAD_TRAP	; xBE
	.FILL BAD_TRAP	; xBF
	.FILL BAD_TRAP	; xC0
	.FILL BAD_TRAP	; xC1
	.FILL BAD_TRAP	; xC2
	.FILL BAD_TRAP	; xC3
	.FILL BAD_TRAP	; xC4
	.FILL BAD_TRAP	; xC5
	.FILL BAD_TRAP	; xC6
	.FILL BAD_TRAP	; xC7
	.FILL BAD_TRAP	; xC8
	.FILL BAD_TRAP	; xC9
	.FILL BAD_TRAP	; xCA
	.FILL BAD_TRAP	; xCB
	.FILL BAD_TRAP	; xCC
	.FILL BAD_TRAP	; xCD
	.FILL BAD_TRAP	; xCE
	.FILL BAD_TRAP	; xCF
	.FILL BAD_TRAP	; xD0
	.FILL BAD_TRAP	; xD1
	.FILL BAD_TRAP	; xD2
	.FILL BAD_TRAP	; xD3
	.FILL BAD_TRAP	; xD4
	.FILL BAD_TRAP	; xD5
	.FILL BAD_TRAP	; xD6
	.FILL BAD_TRAP	; xD7
	.FILL BAD_TRAP	; xD8
	.FILL BAD_TRAP	; xD9
	.FILL BAD_TRAP	; xDA
	.FILL BAD_TRAP	; xDB
	.FILL BAD_TRAP	; xDC
	.FILL BAD_TRAP	; xDD
	.FILL BAD_TRAP	; xDE
	.FILL BAD_TRAP	; xDF
	.FILL BAD_TRAP	; xE0
	.FILL BAD_TRAP	; xE1
	.FILL BAD_TRAP	; xE2
	.FILL BAD_TRAP	; xE3
	.FILL BAD_TRAP	; xE4
	.FILL BAD_TRAP	; xE5
	.FILL BAD_TRAP	; xE6
	.FILL BAD_TRAP	; xE7
	.FILL BAD_TRAP	; xE8
	.FILL BAD_TRAP	; xE9
	.FILL BAD_TRAP	; xEA
	.FILL BAD_TRAP	; xEB
	.FILL BAD_TRAP	; xEC
	.FILL BAD_TRAP	; xED
	.FILL BAD_TRAP	; xEE
	.FILL BAD_TRAP	; xEF
	.FILL BAD_TRAP	; xF0
	.FILL BAD_TRAP	; xF1
	.FILL BAD_TRAP	; xF2
	.FILL BAD_TRAP	; xF3
	.FILL BAD_TRAP	; xF4
	.FILL BAD_TRAP	; xF5
	.FILL BAD_TRAP	; xF6
	.FILL BAD_TRAP	; xF7
	.FILL BAD_TRAP	; xF8
	.FILL BAD_TRAP	; xF9
	.FILL BAD_TRAP	; xFA
	.FILL BAD_TRAP	; xFB
	.FILL BAD_TRAP	; xFC
	.FILL BAD_TRAP	; xFD
	.FILL TRAP_SPAWN	; xFE
	.FILL TRAP_YIELD	; xFF

; the interrupt vector table
	.FILL BAD_INT	; x00
	.FILL BAD_INT	; x01
	.FILL BAD_INT	; x02
	.FILL BAD_INT	; x03
	.FILL BAD_INT	; x04
	.FILL BAD_INT	; x05
	.FILL BAD_INT	; x06
	.FILL BAD_INT	; x07
	.FILL BAD_INT	; x08
	.FILL BAD_INT	; x09
	.FILL BAD_INT	; x0A
	.FILL BAD_INT	; x0B
	.FILL BAD_INT	; x0C
	.FILL BAD_INT	; x0D
	.FILL BAD_INT	; x0E
	.FILL BAD_INT	; x0F
	.FILL BAD_INT	; x10
	.FILL BAD_INT	; x11
	.FILL BAD_INT	; x12
	.FILL BAD_INT	; x13
	.FILL BAD_INT	; x14
	.FILL BAD_INT	; x15
	.FILL BAD_INT	; x16
	.FILL BAD_INT	; x17
	.FILL BAD_INT	; x18
	.FILL BAD_INT	; x19
	.FILL BAD_INT	; x1A
	.FILL BAD_INT	; x1B
	.FILL BAD_INT	; x1C
	.FILL BAD_INT	; x1D
	.FILL BAD_INT	; x1E
	.FILL BAD_INT	; x1F
	.FILL BAD_INT	; x20
	.FILL BAD_INT	; x21
	.FILL BAD_INT	; x22
	.FILL BAD_INT	; x23
	.FILL BAD_INT   ; x24
	.FILL BAD_INT	; x25
	.FILL BAD_INT	; x26
	.FILL BAD_INT	; x27
	.FILL BAD_INT	; x28
	.FILL BAD_INT	; x29
	.FILL BAD_INT	; x2A
	.FILL BAD_INT	; x2B
	.FILL BAD_INT	; x2C
	.FILL BAD_INT	; x2D
	.FILL BAD_INT	; x2E
	.FILL BAD_INT	; x2F
	.FILL BAD_INT	; x30
	.FILL BAD_INT	; x31
	.FILL BAD_INT	; x32
	.FILL BAD_INT	; x33
	.FILL BAD_INT	; x34
	.FILL BAD_INT	; x35
	.FILL BAD_INT	; x36
	.FILL BAD_INT	; x37
	.FILL BAD_INT	; x38
	.FILL BAD_INT	; x39
	.FILL BAD_INT	; x3A
	.FILL BAD_INT	; x3B
	.FILL BAD_INT	; x3C
	.FILL BAD_INT	; x3D
	.FILL BAD_INT	; x3E
	.FILL BAD_INT	; x3F
	.FILL BAD_INT	; x40
	.FILL BAD_INT	; x41
	.FILL BAD_INT	; x42
	.FILL BAD_INT	; x43
	.FILL BAD_INT	; x44
	.FILL BAD_INT	; x45
	.FILL BAD_INT	; x46
	.FILL BAD_INT	; x47
	.FILL BAD_INT	; x48
	.FILL BAD_INT	; x49
	.FILL BAD_INT	; x4A
	.FILL BAD_INT	; x4B
	.FILL BAD_INT	; x4C
	.FILL BAD_INT	; x4D
	.FILL BAD_INT	; x4E
	.FILL BAD_INT	; x4F
	.FILL BAD_INT	; x50
	.FILL BAD_INT	; x51
	.FILL BAD_INT	; x52
	.FILL BAD_INT	; x53
	.FILL BAD_INT	; x54
	.FILL BAD_INT	; x55
	.FILL BAD_INT	; x56
	.FILL BAD_INT	; x57
	.FILL BAD_INT	; x58
	.FILL BAD_INT	; x59
	.FILL BAD_INT	; x5A
	.FILL BAD_INT	; x5B
	.FILL BAD_INT	; x5C
	.FILL BAD_INT	; x5D
	.FILL BAD_INT	; x5E
	.FILL BAD_INT	; x5F
	.FILL BAD_INT	; x60
	.FILL BAD_INT	; x61
	.FILL BAD_INT	; x62
	.FILL BAD_INT	; x63
	.FILL BAD_INT	; x64
	.FILL BAD_INT	; x65
	.FILL BAD_INT	; x66
	.FILL BAD_INT	; x67
	.FILL BAD_INT	; x68
	.FILL BAD_INT	; x69
	.FILL BAD_INT	; x6A
	.FILL BAD_INT	; x6B
	.FILL BAD_INT	; x6C
	.FILL BAD_INT	; x6D
	.FILL BAD_INT	; x6E
	.FILL BAD_INT	; x6F
	.FILL BAD_INT	; x70
	.FILL BAD_INT	; x71
	.FILL BAD_INT	; x72
	.FILL BAD_INT	; x73
	.FILL BAD_INT	; x74
	.FILL BAD_INT	; x75
	.FILL BAD_INT	; x76
	.FILL BAD_INT	; x77
	.FILL BAD_INT	; x78
	.FILL BAD_INT	; x79
	.FILL BAD_INT	; x7A
	.FILL BAD_INT	; x7B
	.FILL BAD_INT	; x7C
	.FILL BAD_INT	; x7D
	.FILL BAD_INT	; x7E
	.FILL BAD_INT	; x7F
	.FILL KBD_INT	; x80
	.FILL BAD_INT	; x81
	.FILL TMR_INT	; x82
	.FILL BAD_INT	; x83
	.FILL BAD_INT	; x84
	.FILL BAD_INT	; x85
	.FILL BAD_INT	; x86
	.FILL BAD_INT	; x87
	.FILL BAD_INT	; x88
	.FILL BAD_INT	; x89
	.FILL BAD_INT	; x8A
	.FILL BAD_INT	; x8B
	.FILL BAD_INT	; x8C
	.FILL BAD_INT	; x8D
	.FILL BAD_INT	; x8E
	.FILL BAD_INT	; x8F
	.FILL BAD_INT	; x90
	.FILL BAD_INT	; x91
	.FILL BAD_INT	; x92
	.FILL BAD_INT	; x93
	.FILL BAD_INT	; x94
	.FILL BAD_INT	; x95
	.FILL BAD_INT	; x96
	.FILL BAD_INT	; x97
	.FILL BAD_INT	; x98
	.FILL BAD_INT	; x99
	.FILL BAD_INT	; x9A
	.FILL BAD_INT	; x9B
	.FILL BAD_INT	; x9C
	.FILL BAD_INT	; x9D
	.FILL BAD_INT	; x9E
	.FILL BAD_INT	; x9F
	.FILL BAD_INT	; xA0
	.FILL BAD_INT	; xA1
	.FILL BAD_INT	; xA2
	.FILL BAD_INT	; xA3
	.FILL BAD_INT	; xA4
	.FILL BAD_INT	; xA5
	.FILL BAD_INT	; xA6
	.FILL BAD_INT	; xA7
	.FILL BAD_INT	; xA8
	.FILL BAD_INT	; xA9
	.FILL BAD_INT	; xAA
	.FILL BAD_INT	; xAB
	.FILL BAD_INT	; xAC
	.FILL BAD_INT	; xAD
	.FILL BAD_INT	; xAE
	.FILL BAD_INT	; xAF
	.FILL BAD_INT	; xB0
	.FILL BAD_INT	; xB1
	.FILL BAD_INT	; xB2
	.FILL BAD_INT	; xB3
	.FILL BAD_INT	; xB4
	.FILL BAD_INT	; xB5
	.FILL BAD_INT	; xB6
	.FILL BAD_INT	; xB7
	.FILL BAD_INT	; xB8
	.FILL BAD_INT	; xB9
	.FILL BAD_INT	; xBA
	.FILL BAD_INT	; xBB
	.FILL BAD_INT	; xBC
	.FILL BAD_INT	; xBD
	.FILL BAD_INT	; xBE
	.FILL BAD_INT	; xBF
	.FILL BAD_INT	; xC0
	.FILL BAD_INT	; xC1
	.FILL BAD_INT	; xC2
	.FILL BAD_INT	; xC3
	.FILL BAD_INT	; xC4
	.FILL BAD_INT	; xC5
	.FILL BAD_INT	; xC6
	.FILL BAD_INT	; xC7
	.FILL BAD_INT	; xC8
	.FILL BAD_INT	; xC9
	.FILL BAD_INT	; xCA
	.FILL BAD_INT	; xCB
	.FILL BAD_INT	; xCC
	.FILL BAD_INT	; xCD
	.FILL BAD_INT	; xCE
	.FILL BAD_INT	; xCF
	.FILL BAD_INT	; xD0
	.FILL BAD_INT	; xD1
	.FILL BAD_INT	; xD2
	.FILL BAD_INT	; xD3
	.FILL BAD_INT	; xD4
	.FILL BAD_INT	; xD5
	.FILL BAD_INT	; xD6
	.FILL BAD_INT	; xD7
	.FILL BAD_INT	; xD8
	.FILL BAD_INT	; xD9
	.FILL BAD_INT	; xDA
	.FILL BAD_INT	; xDB
	.FILL BAD_INT	; xDC
	.FILL BAD_INT	; xDD
	.FILL BAD_INT	; xDE
	.FILL BAD_INT	; xDF
	.FILL BAD_INT	; xE0
	.FILL BAD_INT	; xE1
	.FILL BAD_INT	; xE2
	.FILL BAD_INT	; xE3
	.FILL BAD_INT	; xE4
	.FILL BAD_INT	; xE5
	.FILL BAD_INT	; xE6
	.FILL BAD_INT	; xE7
	.FILL BAD_INT	; xE8
	.FILL BAD_INT	; xE9
	.FILL BAD_INT	; xEA
	.FILL BAD_INT	; xEB
	.FILL BAD_INT	; xEC
	.FILL BAD_INT	; xED
	.FILL BAD_INT	; xEE
	.FILL BAD_INT	; xEF
	.FILL BAD_INT	; xF0
	.FILL BAD_INT	; xF1
	.FILL BAD_INT	; xF2
	.FILL BAD_INT	; xF3
	.FILL BAD_INT	; xF4
	.FILL BAD_INT	; xF5
	.FILL BAD_INT	; xF6
	.FILL BAD_INT	; xF7
	.FILL BAD_INT	; xF8
	.FILL BAD_INT	; xF9
	.FILL BAD_INT	; xFA
	.FILL BAD_INT	; xFB
	.FILL BAD_INT	; xFC
	.FILL BAD_INT	; xFD
	.FILL BAD_INT	; xFE
	.FILL BAD_INT	; xFF


;;; OS_START - operating system entry point (always starts at x0200)
OS_START
	;; set MPR
	LD R0, MPR_INIT
	STI R0, OS_MPR

	;; set timer interval
	LD R0, TMDR_INIT
	STI R0, OS_TMDR
	
	;; Set OS stack
	LD	R6, OS_SP

	;; Enable keyboard and timer interrupts
	LD	R0, CONST_4000
	STI	R0, OS_KBSR
	STI	R0, OS_TMSR
		
	BR	TASK0_INIT
	
OS_SP	.FILL x2000		; Supervisor stack pointer
OS_KBSR	.FILL xFE00		; keyboard status register
OS_KBDR	.FILL xFE02		; keyboard data register
OS_DSR	.FILL xFE04		; display status register
OS_DDR	.FILL xFE06		; display data register
OS_TMSR	.FILL xFE08		; timer status register
OS_TMDR .FILL xFE0A		; timer data (counter) register
OS_MPR	.FILL xFE12		; memory protection register
OS_USPR	.FILL xFFF6		; SavedUSP register when is supervisor mode
OS_MCR	.FILL xFFFE		; machine control register

OS_SAVE_R0      .BLKW 1
OS_SAVE_R1      .BLKW 1
OS_SAVE_R2      .BLKW 1
OS_SAVE_R3      .BLKW 1
OS_SAVE_R4      .BLKW 1
OS_SAVE_R5      .BLKW 1
OS_SAVE_R6      .BLKW 1
OS_SAVE_R7      .BLKW 1
OS_OUT_SAVE_R1  .BLKW 1
OS_IN_SAVE_R7   .BLKW 1

CONST_8000	.FILL x8000
CONST_4000	.FILL x4000
CONST_7FFF	.FILL x7FFF
LOW_8_BITS      .FILL x00FF
TMDR_INIT	.FILL x0000	; Timer interrupt every 64 instructions
MPR_INIT	.FILL xFFFF	; user can access everything
;MPR_INIT	.FILL x0FF8	; user can access x3000 to xbfff
        
;; GETC - Read a single character of input from keyboard device into R0

;; KL: Following is the traditional GETC that accesses hardware registers directly.
;; 

;; TRAP_GETC
;; 	LDI R0,OS_KBSR		; wait for a keystroke
;; 	BRzp TRAP_GETC
;; 	LDI R0,OS_KBDR		; read it and return
;; 	RET

;; KL: Instead, our GETC polls a soft register KBD_KEY for a non-zero value. KBD_KEY
;; is updated in a keyboard interrupt.

KBD_KEY
	.FILL	0

KBD_INT
	ADD	R6, R6, #-1	; Save (push) R0 on supervisor stack
	STR	R0, R6, #0	; 
	LDI	R0, OS_KBDR	; Save key to soft register KBD_KEY which is polled
	ST	R0, KBD_KEY	; by GETC for a non-zero value
	LDR	R0, R6, #0	; Pop saved R0 from supervisor stack
	ADD	R6, R6, #1	;
	RTI

TRAP_GETC
	LDI	R0, KBD_KEY	; load key from soft register
	BRz	TRAP_GETC	; wait for non-zero value
	ST	R1, OS_SAVE_R1	; Save R1 so we can use it as temporary register
	AND	R1, R1, #0	; Write zero to soft register KBD_KEY
	STI	R1, KBD_KEY	;
	LD	R1, OS_SAVE_R1	; Restore R1
	
	RET

;; KL end my code
       
;;; OUT - Write the character in R0 to the console.
TRAP_OUT
	ST R1,OS_OUT_SAVE_R1	; save R1
TRAP_OUT_WAIT
	LDI R1,OS_DSR		; wait for the display to be ready
	BRzp TRAP_OUT_WAIT
	STI R0,OS_DDR		; write the character and return
	LD R1,OS_OUT_SAVE_R1	; restore R1
	RET

                
;;; PUTS - Write a NUL-terminated string of characters to the console,
;;; starting from the address in R0.	
TRAP_PUTS
	ST R0,OS_SAVE_R0	; save R0, R1, and R7
	ST R1,OS_SAVE_R1
	ST R7,OS_SAVE_R7
	ADD R1,R0,#0		; move string pointer (R0) into R1

TRAP_PUTS_LOOP
	LDR R0,R1,#0		; write characters in string using OUT
	BRz TRAP_PUTS_DONE
	OUT
	ADD R1,R1,#1
	BRnzp TRAP_PUTS_LOOP

TRAP_PUTS_DONE
	LD R0,OS_SAVE_R0	; restore R0, R1, and R7
	LD R1,OS_SAVE_R1
	LD R7,OS_SAVE_R7
	RET

;;; IN - prompt the user for a single character input, which is stored
;;; in R0 and also echoed to the console.        
TRAP_IN
	ST R7,OS_IN_SAVE_R7	; save R7 (no need to save R0, since we 
				;    overwrite later
	LEA R0,TRAP_IN_MSG	; prompt for input
	PUTS
	GETC			; read a character
	OUT			; echo back to monitor
	ST R0,OS_SAVE_R0	; save the character
	AND R0,R0,#0		; write a linefeed, too
	ADD R0,R0,#10
	OUT
	LD R0,OS_SAVE_R0	; restore the character
	LD R7,OS_IN_SAVE_R7	; restore R7
	RET                     ; this doesn't work, because


;;; PUTSP - Write a NUL-terminated string of characters, packed 2 per
;;; memory location, to the console, starting from the address in R0.
TRAP_PUTSP
	; NOTE: This trap will end when it sees any NUL, even in
	; packed form, despite the P&P second edition's requirement
	; of a double NUL.

	ST R0,OS_SAVE_R0	; save R0, R1, R2, R3, and R7
	ST R1,OS_SAVE_R1
	ST R2,OS_SAVE_R2
	ST R3,OS_SAVE_R3
	ST R7,OS_SAVE_R7
	ADD R1,R0,#0		; move string pointer (R0) into R1

TRAP_PUTSP_LOOP
	LDR R2,R1,#0		; read the next two characters
	LD R0,LOW_8_BITS	; use mask to get low byte
	AND R0,R0,R2		; if low byte is NUL, quit printing
	BRz TRAP_PUTSP_DONE
	OUT			; otherwise print the low byte

	AND R0,R0,#0		; shift high byte into R0
	ADD R3,R0,#8
TRAP_PUTSP_S_LOOP
	ADD R0,R0,R0		; shift R0 left
	ADD R2,R2,#0		; move MSB from R2 into R0
	BRzp TRAP_PUTSP_MSB_0
	ADD R0,R0,#1
TRAP_PUTSP_MSB_0
	ADD R2,R2,R2		; shift R2 left
	ADD R3,R3,#-1
	BRp TRAP_PUTSP_S_LOOP

	ADD R0,R0,#0		; if high byte is NUL, quit printing
	BRz TRAP_PUTSP_DONE
	OUT			; otherwise print the low byte

	ADD R1,R1,#1		; and keep going
	BRnzp TRAP_PUTSP_LOOP

TRAP_PUTSP_DONE
	LD R0,OS_SAVE_R0	; restore R0, R1, R2, R3, and R7
	LD R1,OS_SAVE_R1
	LD R2,OS_SAVE_R2
	LD R3,OS_SAVE_R3
	LD R7,OS_SAVE_R7
	RET

        
;; HALT - trap handler for halting machine
TRAP_HALT
    LEA     R0, TRAP_HALT_MSG
    PUTS
    LDI     R0, OS_MCR
    LD      R1, CONST_7FFF         ; clear run bit in MCR
    AND     R0, R0, R1
    STI     R0, OS_MCR          ; halt!
    ; BRnzp   OS_START            ; restart machine
    BRnzp   TRAP_HALT

        
;;; BAD_TRAP - code to execute for undefined trap
BAD_TRAP
	BRnzp TRAP_HALT		; execute HALT


;;; BAD_INT - code to execute for undefined interrupt. There won't 
;;; actually be any interrupts, so this will never actually get called.
BAD_INT		RTI

TRAP_IN_MSG	.STRINGZ "\nInput a character> "

;;; KL Multitasking traps and interrupts
;;; Kirill Levchenko
;;; Feb 24, 2020

; Task Control Block (TCB) structure
; 
; x0:	SAVED_R0
; x1:	SAVED_R1
; x2:	SAVED_R2
; x3:	SAVED_R3
; x4:	SAVED_R4
; x5:	SAVED_R5
; x6:	SAVED_R6
; x7:	SAVED_R7
; x8:	SAVED_PC
; x9:	SAVED_PSR
; xA:	NEXT_TASK
; xB:	RESERVED
;
; NEXT_TASK is a pointer to next task TCB. All tasks are in a circularly
; linked list.


TASK0_INIT

	;; Initialize task 0 TCB NEXT_TASK pointer to point to self
	
	LD	R7, CUR_TASK
	STR	R7, R7, xA
	
	;; Set up PSR and PC on stack for call to RTI
	
	ADD	R6, R6, #-2	; Allocate 2 slots for PSR and PC
	LD	R0, TASK0_PC	; Write task 0 PC to slot for PC
	STR	R0, R6, #0	;
	LD	R0, TASK0_PSR	; Write task 0 PSR to slot for PSR
	STR	R0, R6, #1	;
	
	;; Set up task 0 SP by loading it into SavedUSP to be restored by RTI
	
	LD	R0, TASK0_SP	; 
	STI	R0, OS_USPR	; USPR = SavedUSP

	AND	R0, R0, #0	; Zero R0, ..., R5
	AND	R1, R1, #0
	AND	R2, R2, #0
	AND	R3, R3, #0
	AND	R4, R4, #0
	AND	R5, R5, #0
	
	RTI			; Jump to task 0 user mode

TASK0_PSR
	.FILL	x8000
TASK0_PC
	.FILL	x3000
TASK0_SP
	.FILL	x4000

CUR_TASK
	.FILL	x1000			; Current task (points to start of TCB)
TCB_END
	.FILL	x100C			; Pointer to where next TCB entry would go

;; The YIELD trap is used by a task to voluntarily initiate a context switch.
;; In pre-emptive multitasking mode, we use it to trigger a timer interrupt
;; by setting the timer counter (TMDR) to zero.

TRAP_YIELD
	STR	R0, R6, #-1		; Save R0 on task stack
	AND	R0, R0, #0		; R0 <- 0
	STI	R0, OS_TMDR		; 
	LDR	R0, R6, #-1		; Restore R0
	RET

;; The SPAWN trap is used by a task to create another task.

TRAP_SPAWN
	STR	R7, R6, #-1		; Save R7 (return address) on stack
	STR	R5, R6, #-2		; Save R4 and R5 on task stack
	STR	R4, R6, #-3		; 
	
	;; We're about to modify the TCB data structure. If a timer interrupt
	;; fires while we're modifying it, it could find it in an invalid
	;; state, or it could switch to a task that also calls TRAP_SPAWN, and
	;; one of the tasks would overwrite the other's changes. To prevent
	;; this, we disable timer interrupts. Since traps execute in user
	;; mode on the 2nd ed. LC3, memory protection must be disabled.
	
	AND	R5, R5, #0		; TMSR <- 0
	STI	R5, OS_TMSR		;
	
	LD	R5, TCB_END		; Allocate new TCB entry
	ADD	R4, R5, xC		; TCB_END = TCB_END + TCBSZ
	ST	R4, TCB_END		; 

	;; R5 points to new task TCB. Initialize saved task state. All
	;; registers are zero except R6, which is the stack pointer provided
	;; by the calling task in R1. (New task PC is in R0.)
		
	AND	R4, R4, #0		; Zero for R0, ..., R5 and R7
	STR	R4, R5, x0		; R0
	STR	R4, R5, x1		; R1
	STR	R4, R5, x2		; R2
	STR	R4, R5, x3		; R3
	STR	R4, R5, x4		; R4
	STR	R4, R5, x5		; R5
	STR	R1, R5, x6		; R6 (=SP)
	STR	R4, R5, x7		; R7
	STR	R0, R5, x8		; PC
	
	LD	R4, CONST_8000		; Set new task saved PSR to x8000
	STR	R4, R5, x9		; PSR
	
	;; We now need to add the new task to the circularly linked list of
	;; tasks. Insert it right after the current (calling) task.

	LD	R7, CUR_TASK		; R7 points to current task TCB

	LDR	R4, R7, xA		; Add new task to task ring
	STR	R4, R5, xA		; new->next = cur->next
	STR	R5, R7, xA		; cur->next = new
	
	;; Done modifying TCB data structure. Re-enable timer interrupts.
	;; Note that if the INT bit (15) is set, the following store will
	;; clear it. This is okay, because if the timer has expired, the bit
	;; will be set again.
	
	LD	R4, CONST_4000		; TMSR <- x4000 
	STI	R4, OS_TMSR		; 
	
	LDR	R7, R6, #-1		; Restore R4, R5, and R7 from stack
	LDR	R5, R6, #-2		; 
	LDR	R4, R6, #-3		; 
	
	RET				; Return to calling task

TMR_DISABLE_MASK       .FILL  x0000      ; Set bit 14 to 0
TMR_ENABLE_MASK		   .FILL  x4000      ; Set bit 14 to 1

DISABLE_INT
	ST      R7, TMR_R7_STORE     ; Save R7
	ST		R3, TMR_R3_STORE     ; Save R3
	LD      R3, TMR_DISABLE_MASK ; LD timer disable into R3
	STI     R3, OS_TMSR			 ; Store timer disable into timer source register
	JSR     CHECK_DONE           ; Checks if TMR_INT called TMR_INT_END number of times
	LD		R3, TMR_R3_STORE     ; Restore R3
	LD      R7, TMR_R7_STORE     ; Restore R7
	RET

ENABLE_INT
	ST      R7, TMR_R7_STORE     ; Save R7
	ST		R3, TMR_R3_STORE     ; Save R3
	LD	    R3, TMDR_INIT		 ; Reload initial count
	STI     R3, OS_TMDR			 ; Reset timer data register
	LD      R3, TMR_ENABLE_MASK  ; LD timer source register into R3
	STI     R3, OS_TMSR          ; Store timer enable into timer source register
	LD		R3, TMR_R3_STORE     ; Restore R3
	LD      R7, TMR_R7_STORE     ; Restore R7
	RET


TMR_INT
    ;;; IMPLEMENT ME ;;;;

	; Save (push) R7 on supervisor stack
	

	;; Timer interrupt could fire while we're processing another interrupt, so
	;; we need to make sure that were in user mode before doing a context switch.
	;; Check saved PSR for user mode bit and do context switch only if set.
	
	; Load saved PSR from supervisor stack
	; Context switch only if in user mode


	; Pop saved R7 from supervisor stack


	RTI			; Return from interrupt (to supervisor mode)

CNTX_SWITCH
	; The following code helps halt the program. Do not modify.
	ST R7, DISABLE_R7
	JSR DISABLE_INT
	LD R7, DISABLE_R7

	;;; IMPLEMENT ME ;;;;

	; Set R7 to point to current task TCB and SAVE R0-R5 to the TCB

	; GET SavedUSP from special register and save it R6 in the TCB
	LDI	R0, OS_USPR	; Get SavedUSP from special register ...
	STR	R0, R7, x6	; ... and save it to TCB
	
	; POP R7 from system stack and save it to TCB.


	; POP PC from system stack and save it to TCB.


	; POP PSR from system stack and save it to TCB.


	;; Switch to new task and restore its state.
	

	; Write next task PSR to supervisor stack to
	; slot from which RTI restores PSR
	

	; Write next task PC to supervisor stack to
	; slot from which RTI restores PC
	

	; GET SavedUSP from TCB and save it to special register
	LDR	R0, R7, x6	; Store next task SP (=R6) into SavedUSP from
	STI	R0, OS_USPR	; which RTI restores R6 on switch to user mode
	
	; RESTORE R0-R5 from the TCB
	

	; RESTORE R7 from the TCB

	
	; The following code helps halt the program. Do not modify.
TMR_ENABLE
	ST R7, ENABLE_R7
	JSR ENABLE_INT
	LD R7, ENABLE_R7

	RTI			; Return from timer interrupt to new task

; Keep track of how many times TMR_INT has been called
TMR_INT_CURR       .FILL  x0000      ; Current count of TMR_INT calls
TMR_INT_END        .FILL  x0200      ; Number of TMR_INT executions until halt
TMR_R0_STORE       .FILL  x0000      ; Store R0 before checking TMR_INT calls
TMR_R1_STORE       .FILL  x0000      ; Store R1 before checking TMR_INT calls
TMR_R3_STORE       .FILL  x0000      ; Store R3 before checking TMR_INT calls
TMR_R7_STORE       .FILL  x0000      ; Store R7 before checking TMR_INT calls
DISABLE_R7         .FILL  x0000      ; Store R7 for DISABLE_INT call
ENABLE_R7          .FILL  x0000      ; Store R7 for ENABLE_INT call

CHECK_DONE
    ST      R0, TMR_R0_STORE    ; Save R0
    LD      R0, TMR_INT_CURR    ; Load current TMR_INT counter
    ADD     R0, R0, #1          ; Increment current counter
    ST      R1, TMR_R1_STORE    ; Save R1
    LD      R1, TMR_INT_END     ; Load max TMR_INT executions
    NOT     R1, R1              ; Negate R0
    ADD     R1, R1, #1          ;
    ADD     R1, R1, R0          ; Compare R1 and R0
    BRzp    FINISH              ; If at or above TMR_INT count, halt
    ST      R0, TMR_INT_CURR    ; Store new current counter
    LD      R0, TMR_R0_STORE    ; Restore R0
    LD      R1, TMR_R1_STORE    ; Restore R1
    RET

FINISH
    LD      R0, TMR_R0_STORE   ; Restore R0
    LD      R1, TMR_R1_STORE   ; Restore R1
    LD      R7, TMR_R7_STORE   ; Restore R7
    BRnzp   TRAP_HALT          ; Halt the program

TRAP_HALT_MSG   .FILL x000A
                .FILL x00A
                .FILL x002D
                .FILL x002D
                .FILL x002D
                .FILL x0020
                .FILL x0068
                .FILL x0061
                .FILL x006C
                .FILL x0074
                .FILL x0069
                .FILL x006E
                .FILL x0067
                .FILL x0020
                .FILL x0074
                .FILL x0068
                .FILL x0065
                .FILL x0020
                .FILL x004C
                .FILL x0043
                .FILL x002D
                .FILL x0033
                .FILL x0020
                .FILL x002D
                .FILL x002D
                .FILL x002D
                .FILL x000A
                .FILL x000A
                .FILL x0000

	.END


