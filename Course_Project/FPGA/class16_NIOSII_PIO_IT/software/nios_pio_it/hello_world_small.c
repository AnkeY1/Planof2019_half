#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"
#include "sys/alt_irq.h"


void key_interrupt(void* p)
{
	static alt_u8 flag = 0;
	IOWR_ALTERA_AVALON_PIO_EDGE_CAP(PIO_0_BASE,0x10);
	flag = ~flag;
	if(flag)
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,0);
	else
		IOWR_ALTERA_AVALON_PIO_DATA(PIO_0_BASE,0x0f);

}

int main()
{ 
  alt_ic_isr_register(PIO_0_IRQ_INTERRUPT_CONTROLLER_ID,
		  	  	  	  PIO_0_IRQ,
					  key_interrupt,
					  0,
					  0);

  IOWR_ALTERA_AVALON_PIO_DIRECTION(PIO_0_BASE,0x0f);

  IOWR_ALTERA_AVALON_PIO_IRQ_MASK(PIO_0_BASE,0x10);
  /* Event loop never exits. */
  while (1)
  {

  }

  return 0;
}
