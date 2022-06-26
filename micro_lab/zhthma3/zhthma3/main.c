/*
 * zhthma3.c
 *
 * Created: 31-May-22 13:03 PM
 * Author : natal
 */ 

#include <avr/io.h>

char x;

int main(void)
{
    DDRB=0xFF; // PORTB as output
	DDRA=0x00; // PORTA as input
	
	x = 1;     // initially, led0 ON
	
	while(1) 
	{
		if ((PINA & 0x01) == 1){		//SW0
			while ((PINA & 0x01) == 1);    // wait for SW0 release
			
			if (x == 128)		// overflow check
				x = 1;
			else
				x = x<<1;	// shift left
		}
		
		else if ((PINA & 0x02) == 1) {		// SW1
			while ((PINA & 0x02) == 1);    // wait for SW1 release
			
			if (x == 1)		// overflow check
				x = 128;
			else
				x = x>>1;	// shift right
		}
		
		else if ((PINA & 0x04) == 1) {		// SW2
			while ((PINA & 0x04) == 1);    // wait for SW2release
			
			if (x == 128)		// overflow checks
				x = 2;
			else if (x == 64)
				x = 1;
			else
				x = x<<2;	// shift left
		}
		
		else if ((PINA & 0x08) == 1) {		//SW3
			while ((PINA & 0x08) == 1);    // wait for SW3 release
			
			x = 128;
		}
		PORTB = x; // output to PORTB
	}
}

