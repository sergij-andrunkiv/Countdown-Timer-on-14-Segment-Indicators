$MOD51
mov P0, #0
mov P1, #0
mov P2, #0
mov P3, #0
call CLEAR_INDICATORS

CHECK_KEYS:
	check_key1:
		mov P1, #0
		jnb P1.3, check_key2 ; if key disabled
		jmp START_TIMER_1
	check_key2:
		mov P1, #1
		jnb P1.3, check_key3 ; if key disabled
		jmp START_TIMER_2
	check_key3:
		mov P1, #2
		jnb P1.3, check_key4 ; if key disabled
		jmp START_TIMER_3
	check_key4:
		mov P1, #3
		jnb P1.3, check_key5 ; if key disabled
		jmp START_TIMER_4
	check_key5:
		mov P1, #4
		jnb P1.3, check_key6 ; if key disabled
		jmp START_TIMER_5
	check_key6:
		mov P1, #5
		jnb P1.3, check_key7 ; if key disabled
		jmp START_TIMER_6
	check_key7:
		mov P1, #6
		jnb P1.3, check_key8 ; if key disabled
		jmp START_TIMER_7
	check_key8:
		mov P1, #7
		jnb P1.3, check_key1 ; if key disabled
		jmp START_TIMER_8					
	jmp CHECK_KEYS	

CHECK_KEYS_ONCE:				
	check_key1_once:
	mov P1, #0
	jnb P1.3, check_key2_once ; if key disabled (==0)
	cjne R0, #1, START_TIMER_1_BRIDGE	; if timer 1 not running (==0) 	
	ret ; return to previous timer 1
	check_key2_once:
	mov P1, #1
	jnb P1.3, check_key3_once ; if key disabled (==0)
	cjne R1, #1, START_TIMER_2_BRIDGE	; if timer 2 not running (==0) 
	ret ; return to previous timer 2			
	check_key3_once:
	mov P1, #2
	jnb P1.3, check_key4_once ; if key disabled (==0)
	cjne R2, #1, START_TIMER_3_BRIDGE	; if timer 3 not running (==0) 
	ret ; return to previous timer 3
	check_key4_once:
	mov P1, #3
	jnb P1.3, check_key5_once ; if key disabled (==0)
	cjne R3, #1, START_TIMER_4_BRIDGE	; if timer 4 not running (==0) 
	ret ; return to previous timer 4
	check_key5_once:
	mov P1, #4
	jnb P1.3, check_key6_once ; if key disabled (==0)
	cjne R4, #1, START_TIMER_5_BRIDGE	; if timer 5 not running (==0) 
	ret ; return to previous timer 5
	check_key6_once:
	mov P1, #5
	jnb P1.3, check_key7_once ; if key disabled (==0)
	cjne R5, #1, START_TIMER_6_BRIDGE	; if timer 6 not running (==0) 
	ret ; return to previous timer 6
	check_key7_once:
	mov P1, #6
	jnb P1.3, check_key8_once ; if key disabled (==0)
	cjne R6, #1, START_TIMER_7_BRIDGE	; if timer 7 not running (==0) 
	ret ; return to previous timer 7
	check_key8_once:
	mov P1, #7
	jnb P1.3, check_key1_once ; if key disabled (==0)
	cjne R7, #1, START_TIMER_8_BRIDGE	; if timer 8 not running (==0) 
	ret ; return to previous timer 8					
	jmp CHECK_KEYS_ONCE

START_TIMER_1_BRIDGE:
	mov sp, #0x07 ; clear stack
	jmp START_TIMER_1
START_TIMER_2_BRIDGE:
	mov sp, #0x07 ; clear stack
	jmp START_TIMER_2
START_TIMER_3_BRIDGE:
	mov sp, #0x07 ; clear stack
	jmp START_TIMER_3
START_TIMER_4_BRIDGE:
	mov sp, #0x07 ; clear stack
	jmp START_TIMER_4
START_TIMER_5_BRIDGE:
	mov sp, #0x07 ; clear stack
	jmp START_TIMER_5
START_TIMER_6_BRIDGE:
	mov sp, #0x07 ; clear stack
	jmp START_TIMER_6
START_TIMER_7_BRIDGE:
	mov sp, #0x07 ; clear stack
	jmp START_TIMER_7
START_TIMER_8_BRIDGE:
	mov sp, #0x07 ; clear stack
	jmp START_TIMER_8

SET_1:
	mov P0, #11111001b
	mov P2, #11111011b
	ret
SET_2:
	mov P0, #00100100b
	mov P2, #11111111b
	ret
SET_3:
	mov P0, #01110000b
	mov P2, #11111111b
	ret
SET_4:
	mov P0, #00011001b
	mov P2, #11111111b
	ret
SET_5:
	mov P0, #00010010b
	mov P2, #11111111b
	ret
SET_6:
	mov P0, #00000010b
	mov P2, #11111111b
	ret
SET_7:
	mov P0, #11111000b
	mov P2, #11111111b
	ret
SET_8:
	mov P0, #00000000b
	mov P2, #11111111b
	ret
SET_9:
	mov P0, #00010000b
	mov P2, #11111111b
	ret
SET_0:
	mov P0, #11000000b
	mov P2, #11011011b
	ret
SET_T:
	mov P0, #11111110b
	mov P2, #11101101b
	ret
SET_I:
	mov P0, #11110110b
	mov P2, #11101101b
	ret
SET_M:
	mov P0, #11001001b
	mov P2, #11111010b
	ret
SET_E:
	mov P0, #10000110b
	mov P2, #11111111b
	ret
SET_O:
	mov P0, #11000000b
	mov P2, #11111111b
	ret
SET_U:
	mov P0, #11000001b
	mov P2, #11111111b
	ret
SET_CLEAR:
	mov P0, #11111111b
	mov P2, #11111111b
	ret

WRITE_TO_1_INDICATOR:
	clr P3.3
	clr P3.4
	call ACTIVATE_UPPER_INDICATORS
	ret
WRITE_TO_2_INDICATOR:
	setb P3.3
	clr P3.4
	call ACTIVATE_UPPER_INDICATORS
	ret
WRITE_TO_3_INDICATOR:
	clr P3.3
	setb P3.4
	call ACTIVATE_UPPER_INDICATORS
	ret
WRITE_TO_4_INDICATOR:
	setb P3.3
	setb P3.4
	call ACTIVATE_UPPER_INDICATORS
	ret
WRITE_TO_5_INDICATOR:
	clr P3.3
	clr P3.4
	clr P3.5
	call ACTIVATE_LOWER_INDICATORS
	ret
WRITE_TO_6_INDICATOR:
	setb P3.3
	clr P3.4
	clr P3.5
	call ACTIVATE_LOWER_INDICATORS
	ret
WRITE_TO_7_INDICATOR:
	clr P3.3
	setb P3.4
	clr P3.5
	call ACTIVATE_LOWER_INDICATORS
	ret
WRITE_TO_8_INDICATOR:
	setb P3.3
	setb P3.4
	clr P3.5
	call ACTIVATE_LOWER_INDICATORS
	ret
WRITE_TO_9_INDICATOR:
	clr P3.3
	clr P3.4
	setb P3.5
	call ACTIVATE_LOWER_INDICATORS
	ret
WRITE_TO_10_INDICATOR:
	setb P3.3
	clr P3.4
	setb P3.5
	call ACTIVATE_LOWER_INDICATORS
	ret
WRITE_TO_11_INDICATOR:
	clr P3.3
	setb P3.4
	setb P3.5
	call ACTIVATE_LOWER_INDICATORS
	ret
ACTIVATE_UPPER_INDICATORS:
	clr P3.6
	setb P3.6
	clr P3.6
	ret
ACTIVATE_LOWER_INDICATORS:
	clr P3.7
	setb P3.7
	clr P3.7
	ret

START_TIMER_1:
	; set boolean that the timer is already started
	mov R1, #0
	mov R2, #0
	mov R3, #0
	mov R4, #0
	mov R5, #0
	mov R6, #0
	mov R7, #0
	mov R0, #1
	call SET_AND_WRITE_ZERO ; reset time
	call CHECK_KEYS_ONCE
	call SET_1				  
	call WRITE_TO_2_INDICATOR ;	show 1 minute
	call CHECK_KEYS_ONCE			  		
	call SET_0				  
	call WRITE_TO_2_INDICATOR ;	show 0 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds				
	call FLASHING_TIME_OUT ; time out						
	jmp START_TIMER_1

START_TIMER_2:
	; set boolean that the timer is already started
	mov R0, #0
	mov R2, #0
	mov R3, #0
	mov R4, #0
	mov R5, #0
	mov R6, #0
	mov R7, #0
	mov R1, #1
	call SET_AND_WRITE_ZERO ; reset timer
	call CHECK_KEYS_ONCE
	call SET_2
	call WRITE_TO_2_INDICATOR ;	show 2 minute
	call CHECK_KEYS_ONCE
	call SET_1
	call WRITE_TO_2_INDICATOR ; show 1 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_0
	call WRITE_TO_2_INDICATOR ;	show 0 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call FLASHING_TIME_OUT ; time out		
	jmp START_TIMER_2

START_TIMER_3:
	; set boolean that the timer is already started
	mov R0, #0
	mov R1, #0
	mov R3, #0
	mov R4, #0
	mov R5, #0
	mov R6, #0
	mov R7, #0
	mov R2, #1
	call SET_AND_WRITE_ZERO ; reset timer
	call CHECK_KEYS_ONCE
	call SET_3
	call WRITE_TO_2_INDICATOR ; show 3 minute
	call CHECK_KEYS_ONCE
	call SET_2
	call WRITE_TO_2_INDICATOR ; show 2 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_1
	call WRITE_TO_2_INDICATOR ; show 1 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_0
	call WRITE_TO_2_INDICATOR ; show 0 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call FLASHING_TIME_OUT ; time out		
	jmp START_TIMER_3

START_TIMER_4:
	; set boolean that the timer is already started
	mov R0, #0
	mov R1, #0
	mov R2, #0
	mov R4, #0
	mov R5, #0
	mov R6, #0
	mov R7, #0
	mov R3, #1
	call SET_AND_WRITE_ZERO ; reset timer
	call CHECK_KEYS_ONCE
	call SET_4
	call WRITE_TO_2_INDICATOR ; show 4 minute
	call CHECK_KEYS_ONCE
	call SET_3
	call WRITE_TO_2_INDICATOR ; show 3 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_2
	call WRITE_TO_2_INDICATOR ; show 2 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_1
	call WRITE_TO_2_INDICATOR ; show 1 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_0
	call WRITE_TO_2_INDICATOR ; show 0 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call FLASHING_TIME_OUT ; time out		
	jmp START_TIMER_4

START_TIMER_5:
	; set boolean that the timer is already started
	mov R0, #0
	mov R1, #0
	mov R2, #0
	mov R3, #0
	mov R5, #0
	mov R6, #0
	mov R7, #0
	mov R4, #1
	call SET_AND_WRITE_ZERO	; reset timer
	call CHECK_KEYS_ONCE
	call SET_5
	call WRITE_TO_2_INDICATOR ; show 5 minute
	call CHECK_KEYS_ONCE
	call SET_4
	call WRITE_TO_2_INDICATOR ; show 4 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_3
	call WRITE_TO_2_INDICATOR ; show 3 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_2
	call WRITE_TO_2_INDICATOR ; show 2 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_1
	call WRITE_TO_2_INDICATOR ; show 1 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_0
	call WRITE_TO_2_INDICATOR ; show 0 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call FLASHING_TIME_OUT ; time out		
	jmp START_TIMER_5

START_TIMER_6:
	; set boolean that the timer is already started
	mov R0, #0
	mov R1, #0
	mov R2, #0
	mov R3, #0
	mov R4, #0
	mov R6, #0
	mov R7, #0
	mov R5, #1
	call SET_AND_WRITE_ZERO ; reset timer
	call CHECK_KEYS_ONCE
	call SET_6
	call WRITE_TO_2_INDICATOR ; show 6 minute
	call CHECK_KEYS_ONCE
	call SET_5
	call WRITE_TO_2_INDICATOR ; show 5 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_4
	call WRITE_TO_2_INDICATOR ; show 4 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_3
	call WRITE_TO_2_INDICATOR ; show 3 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_2
	call WRITE_TO_2_INDICATOR ; show 2 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_1
	call WRITE_TO_2_INDICATOR ; show 1 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_0
	call WRITE_TO_2_INDICATOR ; show 0 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call FLASHING_TIME_OUT ; time out		
	jmp START_TIMER_6

START_TIMER_7:
	; set boolean that the timer is already started
	mov R0, #0
	mov R1, #0
	mov R2, #0
	mov R3, #0
	mov R4, #0
	mov R5, #0
	mov R7, #0
	mov R6, #1
	call SET_AND_WRITE_ZERO ; reset timer
	call CHECK_KEYS_ONCE
	call SET_7
	call WRITE_TO_2_INDICATOR ; show 7 minute
	call CHECK_KEYS_ONCE
	call SET_6
	call WRITE_TO_2_INDICATOR ; show 6 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_5
	call WRITE_TO_2_INDICATOR ; show 5 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_4
	call WRITE_TO_2_INDICATOR ; show 4 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_3
	call WRITE_TO_2_INDICATOR ; show 3 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_2
	call WRITE_TO_2_INDICATOR ; show 2 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_1
	call WRITE_TO_2_INDICATOR ; show 1 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_0
	call WRITE_TO_2_INDICATOR ; show 0 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call FLASHING_TIME_OUT ; time out		
	jmp START_TIMER_7


START_TIMER_8:
	; set boolean that the timer is already started
	mov R0, #0
	mov R1, #0
	mov R2, #0
	mov R3, #0
	mov R4, #0
	mov R5, #0
	mov R6, #0
	mov R7, #1
	call SET_AND_WRITE_ZERO ; reset timer
	call CHECK_KEYS_ONCE
	call SET_8
	call WRITE_TO_2_INDICATOR ; show 8 minute
	call CHECK_KEYS_ONCE
	call SET_7
	call WRITE_TO_2_INDICATOR ; show 7 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_6
	call WRITE_TO_2_INDICATOR ; show 6 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_5
	call WRITE_TO_2_INDICATOR ; show 5 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_4
	call WRITE_TO_2_INDICATOR ; show 4 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_3
	call WRITE_TO_2_INDICATOR ; show 3 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_2
	call WRITE_TO_2_INDICATOR ; show 2 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_1
	call WRITE_TO_2_INDICATOR ; show 1 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call SET_0
	call WRITE_TO_2_INDICATOR ; show 0 minute
	call CHECK_KEYS_ONCE
	call COUNTDOWN_3_INDICATOR ; show seconds
	call FLASHING_TIME_OUT ; time out		
	jmp START_TIMER_8

COUNTDOWN_3_INDICATOR:
	call SET_5
	call WRITE_TO_3_INDICATOR
	call CHECK_KEYS_ONCE
	call COUNTDOWN_4_INDICATOR
	call SET_4
	call WRITE_TO_3_INDICATOR
	call CHECK_KEYS_ONCE
	call COUNTDOWN_4_INDICATOR
	call SET_3
	call WRITE_TO_3_INDICATOR
	call CHECK_KEYS_ONCE
	call COUNTDOWN_4_INDICATOR
	call SET_2
	call WRITE_TO_3_INDICATOR
	call CHECK_KEYS_ONCE
	call COUNTDOWN_4_INDICATOR
	call SET_1
	call WRITE_TO_3_INDICATOR
	call CHECK_KEYS_ONCE
	call COUNTDOWN_4_INDICATOR
	call SET_0
	call WRITE_TO_3_INDICATOR
	call CHECK_KEYS_ONCE
	call COUNTDOWN_4_INDICATOR
	ret

COUNTDOWN_4_INDICATOR:
	call SET_9
	call WRITE_TO_4_INDICATOR
	call DELAY_1S
	call CHECK_KEYS_ONCE
	call SET_8
	call WRITE_TO_4_INDICATOR
	call DELAY_1S
	call CHECK_KEYS_ONCE
	call SET_7
	call WRITE_TO_4_INDICATOR
	call DELAY_1S
	call CHECK_KEYS_ONCE
	call SET_6
	call WRITE_TO_4_INDICATOR
	call DELAY_1S
	call CHECK_KEYS_ONCE
	call SET_5
	call WRITE_TO_4_INDICATOR
	call DELAY_1S
	call CHECK_KEYS_ONCE
	call SET_4
	call WRITE_TO_4_INDICATOR
	call DELAY_1S
	call CHECK_KEYS_ONCE
	call SET_3
	call WRITE_TO_4_INDICATOR
	call DELAY_1S
	call CHECK_KEYS_ONCE
	call SET_2
	call WRITE_TO_4_INDICATOR
	call DELAY_1S
	call CHECK_KEYS_ONCE
	call SET_1
	call WRITE_TO_4_INDICATOR
	call DELAY_1S
	call CHECK_KEYS_ONCE
	call SET_0
	call WRITE_TO_4_INDICATOR
	call DELAY_1S
	call CHECK_KEYS_ONCE
	ret

SHOW_TIME_OUT:
	call SET_T
	call WRITE_TO_5_INDICATOR
	call SET_I
	call WRITE_TO_6_INDICATOR
	call SET_M
	call WRITE_TO_7_INDICATOR
	call SET_E
	call WRITE_TO_8_INDICATOR
	call SET_O
	call WRITE_TO_9_INDICATOR
	call SET_U
	call WRITE_TO_10_INDICATOR
	call SET_T
	call WRITE_TO_11_INDICATOR
	ret

CLEAR_INDICATORS:
	call SET_CLEAR
	call WRITE_TO_5_INDICATOR
	call WRITE_TO_6_INDICATOR
	call WRITE_TO_7_INDICATOR
	call WRITE_TO_8_INDICATOR
	call WRITE_TO_9_INDICATOR
	call WRITE_TO_10_INDICATOR
	call WRITE_TO_11_INDICATOR
	ret

FLASHING_TIME_OUT:
	call SHOW_TIME_OUT
	call DELAY_1S
	call CLEAR_INDICATORS
	call DELAY_1S
	call SHOW_TIME_OUT
	call DELAY_1S
	call CLEAR_INDICATORS
	call DELAY_1S
	call SHOW_TIME_OUT
	call DELAY_1S
	call CLEAR_INDICATORS
	call DELAY_1S

SET_AND_WRITE_ZERO:
	call SET_0
	call WRITE_TO_1_INDICATOR
	call WRITE_TO_2_INDICATOR
	call WRITE_TO_3_INDICATOR
	call WRITE_TO_4_INDICATOR
	ret 
		  
DELAY_1S: ; 1s delay subroutine
	mov R1, #255
C1:
	djnz R1, $
	ret

END