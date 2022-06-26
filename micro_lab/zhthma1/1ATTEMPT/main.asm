;
; 1ATTEMPT.asm
;
; Created: 27-May-22 8:02:47 PM
; Author : natal
;

.include "m16def.inc"

reset: 
	ldi r24 , low(RAMEND) ; initialize stack pointer
	out SPL , r24
	ldi r24 , high(RAMEND)
	out SPH , r24
	ser r24					; initialize PORTB for output
	out DDRB , r24
	clr r24 
	out DDRA , r24
	ldi r26 , 1				; first position
left:  
	out PORTB , r26			
	ldi r22, 26
	rcall wait_and_check

	lsl r26
	cpi r26 , 128					; have we reached end?
	brne left

right: 
	out PORTB , r26			; 
	ldi r22, 26
	rcall wait_and_check

	lsr r26
	cpi r26 , 1					; have we reached end?
	brne right
	rjmp left
	

; delay of this 25*1.5+ 4 usec in this fun
wait_and_check:
	in r23 , PINA  ; 1
	andi r23 , 1     ; 1
	brne loop      ; 1 h 2
	dec r22         ; 1
	ldi r24 , low(1)   ; 1
	ldi r25 , high(1)   ; 1
	rcall wait_msec      ; 1
	cpi r22 , 0			; 1
	brne wait_and_check		; 1 h 2; 
	ret					; 4 cycles

loop: 
	in r23 , PINA
	andi r23 , 1
	brne loop
	ret


wait_msec:
	push r24 ; 2 ?????? (0.250 ?sec)
	push r25 ; 2 ??????
	ldi r24 , low(20) ; ??????? ??? ?????. r25:r24 ?? 998 (1 ?????? - 0.125 ?sec)
	ldi r25 , high(20) ; 1 ?????? (0.125 ?sec)
	rcall wait_usec ; 3 ?????? (0.375 ?sec), ???????? ???????? ???????????998.375 ?sec
; ???? ??????????? ??? ??????? ????????????????!
	pop r25 ; 2 ?????? (0.250 ?sec)
	pop r24 ; 2 ??????
	sbiw r24 , 1 ; 2 ??????
	brne wait_msec ; 1 ? 2 ?????? (0.125 ? 0.250 ?sec)
	ret ; 4 ?????? (0.500 ?sec)
wait_usec:
	sbiw r24 ,1 ; 2 ?????? (0.250 ?sec)
	nop ; 1 ?????? (0.125 ?sec)
	nop ; 1 ?????? (0.125 ?sec)
	nop ; 1 ?????? (0.125 ?sec)
	nop ; 1 ?????? (0.125 ?sec)
	brne wait_usec ; 1 ? 2 ?????? (0.125 ? 0.250 ?sec)
	ret ; 4 ?????? (0.500 ?sec)