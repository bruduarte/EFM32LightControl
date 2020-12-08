/***************************************************************************//**
 * @file
 * @brief LESENSE demo for EFM32GG_STK3700
 *******************************************************************************
 * # License
 * <b>Copyright 2018 Silicon Laboratories Inc. www.silabs.com</b>
 *******************************************************************************
 *
 * The licensor of this software is Silicon Laboratories Inc. Your use of this
 * software is governed by the terms of Silicon Labs Master Software License
 * Agreement (MSLA) available at
 * www.silabs.com/about-us/legal/master-software-license-agreement. This
 * software is distributed to you in Source Code format and is governed by the
 * sections of the MSLA applicable to Source Code.
 *
 ******************************************************************************/

#include <stdint.h>
#include <stdbool.h>

#include "em_device.h"
#include "em_acmp.h"
#include "em_assert.h"
#include "em_chip.h"
#include "em_cmu.h"
#include "em_emu.h"
#include "em_gpio.h"
#include "em_core.h"
#include "em_lcd.h"
#include "em_lesense.h"
#include "em_pcnt.h"
#include "em_prs.h"

#include "segmentlcd.h"
#include "lightsense_conf.h"

/***************************************************************************//**
 * Macro definitions
 ******************************************************************************/
#define LESENSE_SCANFREQ_CALC_TOLERANCE 0

#define LIGHTSENSE_NUMOF_EVENTS  5U
#define LIGHTSENSE_NUMOF_MODES   2U

#define LIGHTSENSE_EXAMPLE_TEXT  "LIGHT"

#define LIGHTSENSE_EXCITE_PORT   gpioPortD
#define LIGHTSENSE_EXCITE_PIN    6U
#define LIGHTSENSE_SENSOR_PORT   gpioPortC
#define LIGHTSENSE_SENSOR_PIN    6U

#define LIGHTSENSE_BUTTON0_PORT  gpioPortB
#define LIGHTSENSE_BUTTON0_PIN   9U
#define LIGHTSENSE_BUTTON0_FLAG  (1 << LIGHTSENSE_BUTTON0_PIN)

#define INIT_STATE_TIME_SEC      3U

/* Type definition for global state. */
typedef enum {
  ERROR_STATE = -1,
  INIT_STATE = 0,
  TIMER_RESET_STATE = 1,
  AWAKE_STATE = 2,
  SENSE_PREPARE_STATE = 3,
  SENSE_STATE = 4,
  BUTTON0_PRESS_STATE = 5
} LIGHTSENSE_GlobalState_TypeDef;

/***************************************************************************//**
 * Global variables
 ******************************************************************************/
static volatile LIGHTSENSE_GlobalState_TypeDef appStateGlobal = INIT_STATE;
static volatile uint8_t eventCounter = 0U;
static volatile bool lightDetected = false;

/***************************************************************************//**
 * Prototypes
 ******************************************************************************/
void LESENSE_IRQHandler(void);
void PCNT0_IRQHandler(void);

void setupCMU(void);
void setupGPIO(void);
void setupACMP(void);
void setupLESENSE(void);
void setupPRS(void);
void setupPCNT(void);

/***************************************************************************//**
 * @brief  Setup the CMU
 ******************************************************************************/
void setupCMU(void)
{
  /* Ensure core frequency has been updated */
  SystemCoreClockUpdate();

  /* Select clock source for HF clock. */
  CMU_ClockSelectSet(cmuClock_HF, cmuSelect_HFRCO);
  /* Select clock source for LFA clock. */
  CMU_ClockSelectSet(cmuClock_LFA, cmuSelect_LFRCO);
  /* Disable clock source for LFB clock. */
  CMU_ClockSelectSet(cmuClock_LFB, cmuSelect_Disabled);

  /* Enable HF peripheral clock. */
  CMU_ClockEnable(cmuClock_HFPER, true);
  /* Enable clock for GPIO. */
  CMU_ClockEnable(cmuClock_GPIO, true);
  /* Enable clock for LCD. */
  CMU_ClockEnable(cmuClock_LCD, true);
  /* Enable clock for ACMP0. */
  CMU_ClockEnable(cmuClock_ACMP0, true);
  /* Enable clock for PRS. */
  CMU_ClockEnable(cmuClock_PRS, true);
  /* Enable CORELE clock. */
  CMU_ClockEnable(cmuClock_CORELE, true);
  /* Enable clock for PCNT. */
  CMU_ClockEnable(cmuClock_PCNT0, true);
  /* Enable clock for LESENSE. */
  CMU_ClockEnable(cmuClock_LESENSE, true);
  /* Enable clock divider for LESENSE. */
  CMU_ClockDivSet(cmuClock_LESENSE, cmuClkDiv_1);
}

/***************************************************************************//**
 * @brief  Setup the GPIO
 ******************************************************************************/
void setupGPIO(void)
{
  /* Configure the drive strength of the ports for the light sensor. */
  GPIO_DriveModeSet(LIGHTSENSE_EXCITE_PORT, gpioDriveModeStandard);
  GPIO_DriveModeSet(LIGHTSENSE_SENSOR_PORT, gpioDriveModeStandard);

  /* Initialize the 2 GPIO pins of the light sensor setup. */
  GPIO_PinModeSet(LIGHTSENSE_EXCITE_PORT, LIGHTSENSE_EXCITE_PIN, gpioModePushPull, 0);
  GPIO_PinModeSet(LIGHTSENSE_SENSOR_PORT, LIGHTSENSE_SENSOR_PIN, gpioModeDisabled, 0);

  /* Enable push button 0 pin as input. */
  GPIO_PinModeSet(LIGHTSENSE_BUTTON0_PORT, LIGHTSENSE_BUTTON0_PIN, gpioModeInput, 0);
  /* Enable interrupts for that pin. */
  GPIO_IntConfig(LIGHTSENSE_BUTTON0_PORT, LIGHTSENSE_BUTTON0_PIN, false, true, true);
  /* Enable GPIO_EVEN interrupt vector in NVIC. */
  NVIC_EnableIRQ(GPIO_ODD_IRQn);
}

/***************************************************************************//**
 * @brief  Setup the ACMP
 ******************************************************************************/
void setupACMP(void)
{
  /* ACMP configuration constant table. */
  static const ACMP_Init_TypeDef initACMP =
  {
    .fullBias = false,                 /* fullBias */
    .halfBias = true,                  /* halfBias */
    .biasProg =  0x0,                  /* biasProg */
    .interruptOnFallingEdge =  false,  /* interrupt on rising edge */
    .interruptOnRisingEdge =  true,   /* interrupt on falling edge */
    .warmTime = acmpWarmTime512,       /* 512 cycle warmup to be safe */
    .hysteresisLevel = acmpHysteresisLevel5, /* hysteresis level 5 */
    .inactiveValue = false,            /* inactive value */
    .lowPowerReferenceEnabled = false, /* low power reference */
    .vddLevel = 0x00,                  /* VDD level */
    .enable = false                    /* Don't request enabling. */
  };

  /* Configure ACMP. */
  ACMP_Init(ACMP0, &initACMP);
  /* Disable ACMP0 out to a pin. */
  ACMP_GPIOSetup(ACMP0, 0, false, false);
  /* Set up ACMP negSel to VDD, posSel is controlled by LESENSE. */
  ACMP_ChannelSet(ACMP0, acmpChannelVDD, acmpChannel0);
  /* LESENSE controls ACMP thus ACMP_Enable(ACMP0) should NOT be called in order
   * to ensure lower current consumption.
   *
   * ERRATA: we donnot need low power. Enable ACMP to be able to the its
   * interruptions*/

  ACMP_IntEnable(ACMP0, ACMP_IEN_EDGE);   /* Enable edge interrupt */
  /* Enable interrupts */
  NVIC_ClearPendingIRQ(ACMP0_IRQn);
  NVIC_EnableIRQ(ACMP0_IRQn);
  ACMP_Enable(ACMP0);
}

/***************************************************************************//**
 * @brief  Setup the LESENSE
 ******************************************************************************/
void setupLESENSE(void)
{
  /* LESENSE channel configuration constant table. */
  static const LESENSE_ChAll_TypeDef initChs = LESENSE_LIGHTSENSE_SCAN_CONF;
  /* LESENSE alternate excitation channel configuration constant table. */
  static const LESENSE_ConfAltEx_TypeDef initAltEx = LESENSE_LIGHTSENSE_ALTEX_CONF;
  /* LESENSE central configuration constant table. */
  static const LESENSE_Init_TypeDef initLESENSE =
  {
    .coreCtrl =
    {
      .scanStart = lesenseScanStartPeriodic,
      .prsSel = lesensePRSCh0,
      .scanConfSel = lesenseScanConfDirMap,
      .invACMP0 = false,
      .invACMP1 = false,
      .dualSample = false,
      .storeScanRes = false,
      .bufOverWr = true,
      .bufTrigLevel = lesenseBufTrigHalf,
      .wakeupOnDMA = lesenseDMAWakeUpDisable,
      .biasMode = lesenseBiasModeDutyCycle,
      .debugRun = false
    },

    .timeCtrl =
    {
      .startDelay = 0U
    },

    .perCtrl =
    {
      .dacCh0Data = lesenseDACIfData,
      .dacCh0ConvMode = lesenseDACConvModeDisable,
      .dacCh0OutMode = lesenseDACOutModeDisable,
      .dacCh1Data = lesenseDACIfData,
      .dacCh1ConvMode = lesenseDACConvModeDisable,
      .dacCh1OutMode = lesenseDACOutModeDisable,
      .dacPresc = 0U,
      .dacRef = lesenseDACRefBandGap,
      .acmp0Mode = lesenseACMPModeMuxThres,
      .acmp1Mode = lesenseACMPModeMuxThres,
      .warmupMode = lesenseWarmupModeNormal
    },

    .decCtrl =
    {
      .decInput = lesenseDecInputSensorSt,
      .initState = 0U,
      .chkState = false,
      .intMap = true,
      .hystPRS0 = false,
      .hystPRS1 = false,
      .hystPRS2 = false,
      .hystIRQ = false,
      .prsCount = true,
      .prsChSel0 = lesensePRSCh0,
      .prsChSel1 = lesensePRSCh1,
      .prsChSel2 = lesensePRSCh2,
      .prsChSel3 = lesensePRSCh3
    }
  };

  /* Initialize LESENSE interface with RESET. */
  LESENSE_Init(&initLESENSE, true);

  /* Configure scan channels. */
  LESENSE_ChannelAllConfig(&initChs);

  /* Configure alternate excitation channels. */
  LESENSE_AltExConfig(&initAltEx);

  /* Set scan frequency (in Hz). */
  (void)LESENSE_ScanFreqSet(0U, 20U);

  /* Set clock divisor for LF clock. */
  LESENSE_ClkDivSet(lesenseClkLF, lesenseClkDiv_1);

  /* Start scanning LESENSE channels. */
  LESENSE_ScanStart();
}

/***************************************************************************//**
 * @brief  Setup the PRS
 ******************************************************************************/
void setupPRS(void)
{
  /* Use PRS location 0 and output PRS channel 0 on GPIO PORTA0. */
  PRS->ROUTE = 0x01U;

  /* PRS channel 0 configuration. */
  PRS_SourceAsyncSignalSet(0U,
                           PRS_CH_CTRL_SOURCESEL_LESENSEL,
                           PRS_CH_CTRL_SIGSEL_LESENSESCANRES6);
}

/***************************************************************************//**
 * @brief  Setup the PCNT
 ******************************************************************************/
void setupPCNT(void)
{
  /* PCNT configuration constant table. */
  static const PCNT_Init_TypeDef initPCNT =
  {
    .mode = pcntModeOvsSingle, /* Oversampling, single mode. */
    .counter = 0U, /* Counter value has been initialized to 0. */
    .top = LIGHTSENSE_NUMOF_EVENTS, /* Counter top value. */
    .negEdge = false, /* Use positive edge. */
    .countDown = false, /* Up-counting. */
    .filter = false, /* Filter disabled. */
    .hyst = false, /* Hysteresis disabled. */
    .s1CntDir = false, /* Counter direction is given by CNTDIR. */
    .cntEvent = pcntCntEventUp, /* Regular counter counts up on upcount events. */
    .auxCntEvent = pcntCntEventNone, /* Auxiliary counter doesn't respond to events. */
    .s0PRS = pcntPRSCh0, /* PRS channel 0 selected as S0IN. */
    .s1PRS = pcntPRSCh0  /* PRS channel 0 selected as S1IN. */
  };

  /* Initialize PCNT. */
  PCNT_Init(PCNT0, &initPCNT);
  /* Enable PRS input S0 in PCNT. */
  PCNT_PRSInputEnable(PCNT0, pcntPRSInputS0, true);

  /* Enable the PCNT peripheral. */
  PCNT_Enable(PCNT0, pcntModeOvsSingle);
  /* Enable the PCNT overflow interrupt. */
  PCNT_IntEnable(PCNT0, PCNT_IEN_OF);
}

/***************************************************************************//**
 * @brief  Main function
 ******************************************************************************/
int main(void)
{
  CORE_DECLARE_IRQ_STATE;

  /* Chip errata */
  CHIP_Init();

  /* Disable interrupts */
  CORE_ENTER_ATOMIC();

  /* Setup CMU. */
  setupCMU();
  /* Setup GPIO. */
  setupGPIO();
  /* Setup ACMP. */
  setupACMP();
  /* Setup PRS. */
  setupPRS();
  /* Setup PCNT. */
  setupPCNT();
  /* Setup LESENSE. */
  setupLESENSE();

  /* Initialize segment LCD. */
  SegmentLCD_Init(false);

  /* Enable PCNT0 interrupt in NVIC. */
  NVIC_EnableIRQ(PCNT0_IRQn);

  /* Initialization done, enable interrupts globally. */
  CORE_EXIT_ATOMIC();

  /* Go to infinite loop. */
  while (1) {
      switch (appStateGlobal) {
        case BUTTON0_PRESS_STATE:
        {
          /* Initialize segment LCD. */
          SegmentLCD_Init(false);
          /* Turn all LCD segments off. */
          SegmentLCD_AllOff();
          /* Turn on the EM0 symbol. */
          SegmentLCD_EnergyMode(0, true);
          /* Turn on the gecko. */
          SegmentLCD_Symbol(LCD_SYMBOL_GECKO, true);
          /* Go to TIMER_RESET_STATE to reset the global timer. */
          appStateGlobal = TIMER_RESET_STATE;
        }
        break;

        case INIT_STATE:
        {
          /* Initialize segment LCD. */
          SegmentLCD_Init(false);
          /* Turn all LCD segments off. */
          SegmentLCD_AllOff();
          /* Turn on the EM0 symbol. */
          SegmentLCD_EnergyMode(0, true);
          /* Turn on the gecko. */
          SegmentLCD_Symbol(LCD_SYMBOL_GECKO, true);
          /* Write text on LCD. */
          SegmentLCD_Write(LIGHTSENSE_EXAMPLE_TEXT);
          /* Go to TIMER_RESET_STATE to reset the global timer. */
          appStateGlobal = TIMER_RESET_STATE;
        }
        break;

        case TIMER_RESET_STATE:
        {
          /* Enable LESENSE interrupt in NVIC. */
          NVIC_EnableIRQ(LESENSE_IRQn);
          /* Go to the AWAKE_STATE. */
          appStateGlobal = AWAKE_STATE;
        }
        break;

        case AWAKE_STATE:
        {
          /* Stay awake until the timer has fired. */
          appStateGlobal = AWAKE_STATE;
          /* Write the number of counts. */
          if(lightDetected){
              SegmentLCD_Number(100 + eventCounter);
          }else{
              SegmentLCD_Number(eventCounter);
          }

        }
        break;

        case SENSE_PREPARE_STATE:
        {
          /* Disable LCD to avoid excessive current consumption */
          SegmentLCD_Disable();
          /* Go to SENSE_STATE. */
          appStateGlobal = SENSE_STATE;
        }
        break;

        case SENSE_STATE:
        {
          /* Enter EM2. */
          EMU_EnterEM2(true);
        }
        break;

        case ERROR_STATE:
        default:
        {
          /* Stay in ERROR_STATE. */
          appStateGlobal = ERROR_STATE;
        }
        break;
      }
  }
}

/***************************************************************************//**
 * @brief  LESENSE interrupt handler
 ******************************************************************************/
void LESENSE_IRQHandler(void)
{
  /* Negative edge interrupt on LESENSE CH6. */
  if (LESENSE_IF_CH6 & LESENSE_IntGetEnabled()) {
    LESENSE_IntClear(LESENSE_IF_CH6);
  }

  eventCounter++;

}

/***************************************************************************//**
 * @brief  PCNT interrupt handler
 ******************************************************************************/
void PCNT0_IRQHandler(void)
{
  /* Overflow interrupt on PCNT0. */
  PCNT_IntClear(PCNT0, PCNT_IF_OF);

}


/**************************************************************************//**
 * @brief ACMP0 Interrupt handler
 *****************************************************************************/
void ACMP0_IRQHandler(void)
{
  /* Clear interrupt flag */
  ACMP0->IFC = ACMP_IFC_EDGE;

  lightDetected = true;
}
