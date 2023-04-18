#include "gpio.h"
#include "sysctl.h"

#define LED_PIN (1 << 3)

// Close enough for busy waiting...
static void BusyWaitUS(unsigned int us)
{
	unsigned int delta1 = 5;
	while (us >= delta1)
	{
		for (volatile register int i = 9; i--;);
		us -= delta1;
	}
}
int main()
{
	RCGCGPIO |= RCGCGPIO_F;
	BusyWaitUS(1000);
	GPIOFAFSEL &= ~LED_PIN;
	GPIOFDIR |= LED_PIN;
	GPIOFDEN |= LED_PIN;
	while (1)
	{
		BusyWaitUS(1000000);
		GPIOFDATA(LED_PIN) = LED_PIN;
		BusyWaitUS(1000000);
		GPIOFDATA(LED_PIN) = 0;
	}
	return 0;
}
