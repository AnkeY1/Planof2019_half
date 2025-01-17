#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "alt_types.h"

int main()
{ 
  alt_u8 led = 0;
  alt_u8 key = 0;
  IOWR_ALTERA_AVALON_PIO_DIRECTION(PIO_BASE,0x0f);
  /* Event loop never exits. */
  while (1)
  {

	  key = IORD_ALTERA_AVALON_PIO_DATA(PIO_BASE);
	  if(key & 0x10)
	  {
		  led = 0x00;
		  IOWR_ALTERA_AVALON_PIO_DATA(PIO_BASE,led);
	  }
	  else
	  {
		  led = 0x0f;
		  IOWR_ALTERA_AVALON_PIO_DATA(PIO_BASE,led);
	  }
  }

  return 0;
}
