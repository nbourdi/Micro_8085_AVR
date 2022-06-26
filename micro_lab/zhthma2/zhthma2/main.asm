;
; zhthma2.asm
;
; Created: 27-May-22 10:00:31 PM
; Author : natal
;

.include "m16def.inc"




;F0 = ABC + B'C'D'
;F1= (A+B+C)D

.include "m16def.inc"
.DEF temp=r23
.DEF temp1=r24
.DEF temp2=r25
.DEF A=r16
.DEF B=r17
.DEF C=r18
.DEF D=r19
.DEF BN=r20
.DEF CN=r21
.DEF DN=r22

.cseg
.org 0 ; start address

start: clr temp
    out DDRB , temp
    ser temp
    out PORTB , temp
    out DDRA , temp
loop: in temp , PINB
    mov A , temp
    lsr temp
    mov B , temp
    mov BN , B
    com BN
    lsr temp
    mov C , temp
    mov CN , C
    com CN
    lsr temp
    mov D , temp
    mov DN , D
    com DN

    mov temp1 , A
    and temp1 , B
    and temp1 , C

    mov temp2 , BN
	and temp2 , CN
	and temp2 , D

	or temp1 , temp2 
	andi temp1 , 1
	or temp , temp1

	mov temp1 , A
    or temp1 , B
    or temp1 , C
	and temp1 , D

	andi temp1 , 1
	lsl temp1		; F1 in 2nd lsb 
	or temp , temp1   ; full result both funs
	out PORTA , temp
	rjmp loop