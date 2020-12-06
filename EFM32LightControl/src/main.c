#include "em_device.h"
#include "em_chip.h"

#include <stdint.h>
#include <stdbool.h>
#include "em_cmu.h"
#include "bsp.h"
#include "segmentlcd.h"
#include "gpiointerrupt.h"


#define BUTTON0_PORT  gpioPortB
#define BUTTON0_PIN   9U
#define BUTTON0_FLAG  (1 << BUTTON0_PIN)

enum execMode{
  execModeControlledByButtonOnOff,  // each button press switches on/off the light
  execModeControlledByButtonScales, // each button press increases the light intensity
  execModeCOntrolledBySensor,       // the light intensity is based on the light sensor: less light detected, more light instensity
};

enum programSate{
  programStateBootup,
  programStateReadButtons,
  programStateReadSensor,
  programStateControlLight,
  programStateError
};

// global vairables
volatile uint32_t msTicks; /* counts 1ms timeTicks */
volatile bool buttonPB0Pushed = false;
volatile bool buttonPB1Pushed = false;
enum programSate programState = programStateBootup;
enum execMode execMode = execModeControlledByButtonOnOff;

/* Locatl prototypes */
void Delay(uint32_t dlyTicks);

/***************************************************************************//**
 * @brief SysTick_Handler
 *   Interrupt Service Routine for system tick counter
 * @note
 *   No wrap around protection
 ******************************************************************************/
void SysTick_Handler(void)
{
  msTicks++;       /* increment counter necessary in Delay()*/
}

/***************************************************************************//**
 * @brief Delays number of msTick Systicks (typically 1 ms)
 * @param dlyTicks Number of ticks to delay
 ******************************************************************************/
void Delay(uint32_t dlyTicks)
{
  uint32_t curTicks;

  curTicks = msTicks;
  while ((msTicks - curTicks) < dlyTicks) ;
}


/***************************************************************************//**
 * @brief  Gpio callback
 * @param  pin - pin which triggered interrupt
 ******************************************************************************/
void gpioCallback(uint8_t pin)
{
  if (pin == 9) {
    BSP_LedToggle(1);
  } else if (pin == 10) {
    BSP_LedToggle(0);
  }
}

/***************************************************************************//**
 * @brief  Gpio setup. Setup button pins to trigger falling edge interrupts.
 *  Register callbacks for that interrupts.
 ******************************************************************************/
void gpioSetup(void)
{
  /* Enable GPIO in CMU */
  CMU_ClockEnable(cmuClock_GPIO, true);

  /* Initialize GPIO interrupt dispatcher */
  GPIOINT_Init();

  /* Configure PB9 and PB10 as input */
  GPIO_PinModeSet(gpioPortB, 9, gpioModeInput, 0);
  GPIO_PinModeSet(gpioPortB, 10, gpioModeInput, 0);

  /* Register callbacks before setting up and enabling pin interrupt. */
  GPIOINT_CallbackRegister(9, gpioCallback);
  GPIOINT_CallbackRegister(10, gpioCallback);

  /* Set falling edge interrupt for both ports */
  GPIO_IntConfig(gpioPortB, 9, false, true, true);
  GPIO_IntConfig(gpioPortB, 10, false, true, true);
}

void bootup(){
  /* Chip errata */
  CHIP_Init();

  /* Initialize GPIO */
  gpioSetup();

  /* Setup SysTick Timer for 1 msec interrupts  */
  if (SysTick_Config(CMU_ClockFreqGet(cmuClock_CORE) / 1000)) {
      // stay here for ever if this configuration fails
    while (1) ;
  }

  /* Enable LCD without voltage boost */
  SegmentLCD_Init(false);

  /* Enable two leds to show we're alive */
  BSP_LedsInit();
  BSP_LedSet(0);
  BSP_LedSet(1);

  /* Enable all segments for testing - like a powerup*/
  SegmentLCD_AllOn();
  Delay(1000);

  /* Disable all segments */
  SegmentLCD_AllOff();
  // disable all leds
  BSP_LedClear(0);
  BSP_LedClear(1);


}

int main(void)
{

  while (1) {
    switch (programState) {
        // this state inits all required functions
      case programStateBootup:
        bootup();
        programState = programStateReadButtons;
        break;

        // this state reads the input buttons to decide what to do
      case programStateReadButtons:
        {
//          if(buttonPB0Pushed){
//              BSP_LedSet(0);
//          }
//          if(buttonPB1Pushed){
//              BSP_LedSet(1);
//          }
//          Delay(1000);
//          BSP_LedClear(0);
//          BSP_LedClear(1);
//          buttonPB0Pushed = false;
//          buttonPB1Pushed = false;
        }
        break;

        // this state reads the sensor information
        // and calculates what should be the light intensity
      case programStateReadSensor:
        programState = programStateControlLight;
        break;

        // this state control the light intensity based on the selected
        // intensity, either by the sensor or the control buttons
      case programStateControlLight:
        programState = programStateReadButtons;
        break;

        // this state handles all kind of errors that can happen
        // during the program execution
      case programStateError:
        // restart the board?
        break;

      default:
        // shoudl not be here. Go to error state.
        programState = programStateError;
        break;

    } // end of switch state machine
  }// end of while true
}// end of main
