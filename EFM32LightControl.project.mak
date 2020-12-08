####################################################################
# Automatically-generated file. Do not edit!                       #
####################################################################

BASE_SDK_PATH = C:/SiliconLabs/SimplicityStudio/v5/developer/sdks/gecko_sdk_suite/v3.0
UNAME:=$(shell uname -s | sed -e 's/^\(CYGWIN\).*/\1/' | sed -e 's/^\(MINGW\).*/\1/')
ifeq ($(UNAME),MINGW)
# Translate "C:/super" into "/C/super" for MinGW make.
SDK_PATH := /$(shell echo $(BASE_SDK_PATH) | sed s/://)
endif
SDK_PATH ?= $(BASE_SDK_PATH)
COPIED_SDK_PATH ?= gecko_sdk_3.0.0


PROJECT_SOURCE_FILES = \
 autogen/.crc_config.crc \
 autogen/linkerfile.ld \
 config/sl_memory_config.h \


C_SOURCE_FILES   += $(filter %.c, $(PROJECT_SOURCE_FILES))
CXX_SOURCE_FILES += $(filter %.cpp, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.s, $(PROJECT_SOURCE_FILES))
ASM_SOURCE_FILES += $(filter %.S, $(PROJECT_SOURCE_FILES))
LIB_FILES        += $(filter %.a, $(PROJECT_SOURCE_FILES))

C_DEFS += \
 '-DEFM32GG990F1024=1'

ASM_DEFS += \
 '-DEFM32GG990F1024=1'

INCLUDES += \
 -I"$(SDK_PATH)/platform/common/toolchain/inc" \
 -I"$(SDK_PATH)/platform/emlib/inc" \
 -I"$(SDK_PATH)/platform/emdrv/gpiointerrupt/inc" \
 -I"$(SDK_PATH)/platform/CMSIS/Include" \
 -I"$(SDK_PATH)/platform/emdrv/common/inc" \
 -I"$(SDK_PATH)/platform/Device/SiliconLabs/EFM32GG/Include" \
 -I"config" \
 -I"autogen"

GROUP_START =-Wl,--start-group
GROUP_END =-Wl,--end-group

PROJECT_LIBS = \
 -lgcc \
 -lc \
 -lm \
 -lnosys

LIBS += $(GROUP_START) $(PROJECT_LIBS) $(GROUP_END)

C_FLAGS += \
 --specs=nano.specs \
 -g \
 -imacros sl_gcc_preinclude.h \
 -fno-builtin \
 -mcpu=cortex-m3 \
 -Os \
 -Wextra \
 -Wall \
 -mthumb \
 -fdata-sections \
 -std=c99 \
 -ffunction-sections \
 -fomit-frame-pointer

CXX_FLAGS += \
 --specs=nano.specs \
 -g \
 -imacros sl_gcc_preinclude.h \
 -fno-builtin \
 -std=c++11 \
 -mcpu=cortex-m3 \
 -fno-rtti \
 -Os \
 -Wextra \
 -Wall \
 -fno-exceptions \
 -mthumb \
 -fdata-sections \
 -ffunction-sections \
 -fomit-frame-pointer

ASM_FLAGS += \
 -x assembler-with-cpp \
 -mcpu=cortex-m3 \
 -mthumb \
 -imacros sl_gcc_preinclude.h

LD_FLAGS += \
 -Wl,--gc-sections \
 -Xlinker -Map=$(OUTPUT_DIR)/$(PROJECTNAME).map \
 -mcpu=cortex-m3 \
 -T"autogen/linkerfile.ld" \
 -mthumb \
 --specs=nano.specs


####################################################################
# SDK Build Rules                                                  #
####################################################################

$(OUTPUT_DIR)/sdk/platform/common/toolchain/src/sl_memory.o: $(SDK_PATH)/platform/common/toolchain/src/sl_memory.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/common/toolchain/src/sl_memory.d
OBJS += $(OUTPUT_DIR)/sdk/platform/common/toolchain/src/sl_memory.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFM32GG/Source/GCC/startup_efm32gg.o: $(SDK_PATH)/platform/Device/SiliconLabs/EFM32GG/Source/GCC/startup_efm32gg.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFM32GG/Source/GCC/startup_efm32gg.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFM32GG/Source/GCC/startup_efm32gg.o

$(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFM32GG/Source/system_efm32gg.o: $(SDK_PATH)/platform/Device/SiliconLabs/EFM32GG/Source/system_efm32gg.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFM32GG/Source/system_efm32gg.d
OBJS += $(OUTPUT_DIR)/sdk/platform/Device/SiliconLabs/EFM32GG/Source/system_efm32gg.o

$(OUTPUT_DIR)/sdk/platform/emdrv/gpiointerrupt/src/gpiointerrupt.o: $(SDK_PATH)/platform/emdrv/gpiointerrupt/src/gpiointerrupt.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emdrv/gpiointerrupt/src/gpiointerrupt.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emdrv/gpiointerrupt/src/gpiointerrupt.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_acmp.o: $(SDK_PATH)/platform/emlib/src/em_acmp.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_acmp.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_acmp.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_adc.o: $(SDK_PATH)/platform/emlib/src/em_adc.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_adc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_adc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_assert.o: $(SDK_PATH)/platform/emlib/src/em_assert.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_assert.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_assert.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o: $(SDK_PATH)/platform/emlib/src/em_cmu.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_cmu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_core.o: $(SDK_PATH)/platform/emlib/src/em_core.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_core.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_core.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o: $(SDK_PATH)/platform/emlib/src/em_emu.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_emu.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o: $(SDK_PATH)/platform/emlib/src/em_gpio.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_gpio.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_lcd.o: $(SDK_PATH)/platform/emlib/src/em_lcd.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_lcd.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_lcd.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_lesense.o: $(SDK_PATH)/platform/emlib/src/em_lesense.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_lesense.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_lesense.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_pcnt.o: $(SDK_PATH)/platform/emlib/src/em_pcnt.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_pcnt.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_pcnt.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.o: $(SDK_PATH)/platform/emlib/src/em_prs.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_prs.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_rtc.o: $(SDK_PATH)/platform/emlib/src/em_rtc.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_rtc.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_rtc.o

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o: $(SDK_PATH)/platform/emlib/src/em_system.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=eJzlXftv3DYS/leMRX9or17Jj9zlvEhaFHYS+GCfjax9vaJbCFqKu9ZZr6OkjdMi//tREqn3g5S4XKZXtGkskzPfN3xoRA6Hf8yW17f3N9eX1w+/GMuHx6vrO+P+6nY5W8ze/PjiOqvV0Q6i0Pa9t6vZqXaymuEn0AO+ZXtb/Ojx4f3876vZjz+sViuE//PeBMj/DwQRLuaZLsRFYqC5vhU7UAthFAca8N3A96AXLdMftS0AqVRcMYAo+rwE+P+4HhU0y2XjQvjfNxvfsSAqFGwhePaN0Ho2zrWTBGKtQke1wDGjjY/cjvIdtTB61/d663TUjHzfAU+mzVK5Q0SIAHNlKsJ2YEmAY7jQ9dFnLbN5jGz8NCmz0HX9cqEvbccGvndjrkP8dzfAP9m4SaLYsn1991fdgjvoJO2kY3uHemH6MLYjqO9wC+jUsHpmKz0nrmP8egWCzmoJPTPFWMPZnijDGQhu8WjQng5hP0xDb0PCasaBPnF4TiLI4PnECBDEcp3Yggcl1YQivMMzFGQpUh8w0HXs9ZhZjmeKqrUddA0UASkzU0ovnY4KpcxN00C9DWxfPmyqdTxu0zqAtYnS8agdGEIvhPKRlxRPsDlwgwMYnWgdjzv8HEbQlY+80DuhxwDrAL0lUzoeNXRj+aiJ0vGowSFQg6mozTDEnx4HGJe53gkW99EBJkOqdTzuAHgHsDjVOgE3Cg8AO1M6jJrdcZzyjdTuuclwtTOrJP51oXSi5yYdNtU6zXOTDpsone65SUdeUjzRc5NvdKJ1sucmHXmhd5rnJr+3ZEqneW7SUROl0zw36ajBVNTEg5I/LnO947Gv41A+cKJ0ir+ZLHYdoKvkesdjR6a7ib1DeCqF4vHoyU6MfPQlxRO/Uw7Qa9DE9376xSAdN9U67TtFPmzEOLvsbd3aQrsx69aJT257EUQoDpp7jsxiJu/QVXBI+s7EJtMretOvzgaSr2azropczhho2jAZEQ0kh9j/6TAz8072vpoJAl/S/lzWPGSXLp2pqOqvZT/u8nZ5vRwzr11ne49jV3ZMRB0vIzLX+DtaSnulbHUCXW/FMPK9mMnywsgIIxSD6HB8ahgm8HHN6OlANKjqkeiBG9ph0rYBfowOwKEJYBITmQ56G5HpfnomZwvkfCK1cSC6x+LH7r4B3PNDwC+pHoneDWIDD6vd6wPAr+g+mP9+BXc2YHlbNWqWTDPep3n3/vb87MMHbr+mjsWPERMLBlkfLi9HCWrtYGFkoigODLhxz8+2WynfF1mTVmQSM+uZnXRMUW9BxhcIxtznWE2VLl8rZqkmKM5ouTHmmexT9liZMLm4ONmcnpy9kjLv9ZiZToYtsEb1xlay8naS2Jly7zOx0JS0ScnDkm8Lk4WkpE8iHpJ8X0gsJDdGYHvqES1gCSbrI0lfhpxsKS6BdNexrNANDq45KNFEDQTlrAjykqXABBIGpmOvkRnJWWPjIFwBJpKwpB1sHqp8+9sMJC1TudFKIIkkiZV7GzmhWTxEC1giybqmckQzSGJJGkDOMiUfT4JKMFULhgDZQeTLWdXkpFxFJ5Y6iJCjIGcKSyxZBP+rIFeCSiBVuLZV40kgiSSpnvvAGdTHQjKSEwrKQzLiihJlICktrJuDJW/QNyNNQ7mVpAKVQKr2mXJeL4EkkKSsaGcOkpyx0CwkJR4C4CHKf0SAnSz+xN8oSphC2wNp9dz9KrI9UA6VW1yqIhNKObJdSUEbXHxzWELJxqakUwZcXCkqgVTdULk3LYEkkKS0mG4OlrwR3yw0JYWA87BkDRDnIangq6ZAJZhqaG8901GxXcvQBJJG6n2WI+Gf5ch309hW5ZiWcImkq96Wo/gNRyX9o314R6lMQ1LMKC9Xgy+elIGuiq7gHhzBOFSRZ7gPomv1aK7FkzQsGyq3WljGJZquryhdfy90n5SbfwtUAqnuFAye3IkPnvxk+VvVaFJMImi6aTAFUMfhLQMSQLAWqa0IyyaqvcaPSzs12fHLrsf1gHYzjvwt7DoLW2tZDSCQnN/b2Nvkr2nDrmPbiewkR3aEYpg+wvJgEuNmlR9mHSBM23ehkwzXOlGvNyTXG6eLD0kwe29GTw0luLf0J6ptUcMsLz/7P01I6+HpKSIrR5umYytODk+RNTw+OaXX+k9LbdcEyL+CG9uzI9v3ik5MFF9cnLxPDji0VE1DNNHn99WT9aDNAq1FmQu6rAU9H09fLYWT3nwXEH7JD9fJmHPNZ5gMXM1EbpJjXnNs7xkP+mQY+mnprJgddh1jTwXf2GGUC9+ZTpwgmf/sHM/nWzAPsfnxr1pQDYr4N8GzOprfmsHbb769e3y4f3wwrq4/fqd/8+39x7t/vLt8+OdPt+++01wzaJsMCuIjTUIPvooxyjwMIAjfeqbna+lfR1hlK4JnNj4024JafolAlWD2qjf8wEt/Q9XXjv2M72tJdih3LcyyL/iHXOT8kx09zUEgpEvgHqCFtoPnotRcoX1+lvUMK8K9zjO30ErebZaW1NC2XqzRgaStzRDW6U0QB2wEYsdEFgygZ0EPfK40TfYKZWwPdVjhOSuy8GwWVshsTCfcK5sg6JjupsgS0UQtjhL3jN1eTEvmHaNhapZZqcPuxVMt7p4r20vhhjfgC4ABeT2M7cmTMCQlXPt3MxVahhDav4ttqc4XSVdBzXftyNgg/GY3gszvqzbbJikwTwvM8wKjjNbei9rKkP8t09joCpxv6q56VjKl5lgHNqVlRqZReCIVKya/6/FS9tHrkjx3ycN2SPJ6/ycTeba3DbUAWqYX2YB/Ct5zw4GXFwPPEyiK7Fqzef48eyrDUAmMMDI9C8/sFRzg++9PT+Vg6O7Dwt8qkYm2sOERdhTToqfYXVdbxyXPRtml0zPsKKYV98dw+41MN9Dw+4xiRqWJoIE/9n00xTWa+oomHWe/HW7cxNA6IufYm3zLNCz3jLB/kp9v6O8lv3v+rIMFvkTIVGlaBEFcmxTxk7fARxF8mbvnkt/wpuOoOIS7vwHSN3z5d+IXGjpLjhkkLcbaz7jZ4/dhp3M/yqfv6MGlSx77unBerDGQmIfQnvsvHVtGfWzNf06fHPbjsevDdn4n7/O+4barMOv0uQ0XF+PnGX4oKs8ygpZX+pcwFOgOHR5u+vbJf7HvRZV0XQ40V+bkrQR0jAqGASFrkm36d/OfybMC4Bu64Zc/OdrXHc0W3Jixk9zQHKUO1vRLmv/MW+w9+7AS2ywGlxmv6Y2VGYitrYr7iIlZn3qaISuit9VhbYj/x45FzCYuPEBqt3yAbhIDAWXPIjV/XlhTD3wn/Jk6HlPXmR3Plte39zfXl9cPvxjLh8er6zvj9u7q8ebdcraY/frHaobwaN9BbKxFur53vJoR8u9eUhDYM1j8+lvxOEt3mj5dzYqot3PthO9++WOe2l23q48XMrZ209Xtk9J2mTVzeXqLNHMFcn8zc/nSrcnsOsh1xcwViluC2XFl9/Mylyc34zKXB5zli6tg2VWQO1iZK9DLT9krZNeODpevXsjJXJ4mRWGuQBK4MpcvpXVg10GiuZkrFDcdsuPK8mowlyeJgJjLA87yxXV2zFXIRXLskPL729i7U3FrGnOd0h0IHNAQXxehZ7XZKyAGYzHew8QrpPUiomEhbdfl9NViuLSFt3rtjhS+6vRuEvZazdtAeOsydr6eey84qpXum2CvVbnmoa/a6LT904Q2M9yPlNeTyl2MRKb3BH9uclHShkfcuEzbAiXSbNaCROZJo0XKo3mZBcmspD4WJXP4Xc+fzFeUtCJjriiJWWpacdJImg6BAqvpVcUJpjlMxUkkmUIFCSQpOUVJE9qtSZJJQdJYvltGpUwUJJDkJhQkjeFjZVymPbESaSo7wVKFTg/VdGzChOZZPYRJpAklBAkkKbwESWP5/OLPSSVOmtg+U0utJEgqEjq9lvMEiRIp1JkTPULKuWUEiRQ85PJUKcLkrcVKy/N+iBTpCxf5JLKNd2K/GWlGhqniyskPJspqphg4LkLsGptVyZ5Ptl24mi1WM7qduLi9TR8evbiOFy7I07er1Wr2FEXBQtc/ffpED7IB39XDUL/PCmkwWRhJShYbbCuym5Y8tK305/o2ZbLq43vQS2Ie8I/pVmVSPLDcSv0f0k0v74jsnyWrPeFRYEYRRJki7S/Jnzopl++WUUY/pPbIg28Widwvx1O3yNS3b2tEyddj4J7Aha+ie1eDQ74eu3fsuX8lNq9GPkiz+m+zY9xhAxtaSQKFkOzB57EFpNhxHneRhgAktuq0KS7rI3trYx+UFPZixzlOx0WEJ0384PT01dn569OL16n6ZkDA/ce7+3cfH67TmAAMJ1X4R0IuNHH3WEY+eP6Xiex0syB5vEj+SAok/8wC7MzcBR79cUH/Uj+yTx4f079kdlhazzc+yOKF6xJqLzv6+Ev2R0L9Kpu7vhbEX7D9SfoIY3n3+PEyNXka31OP7mmP7UFFXE9fqA5K+20WXJInCKlBo8UaBalLUSrRKJPtH1VKNMqUAu4rxRoFQwQaRY6yMJ1GKFuy7VBJ1iQ6VdNw5IpeZ5NH8fSRTDPUMJIsRbjI5doVZ1On3Nk6h0XMBrUZwnMQyK1B88Mdq+Vh26Nq50s3vPtHa9sgrFiuiGDaq7naQqYahqnhopFS8oBRjUPISEiWPGBE4RCuUuiXPGwlpYN2I2FmEg1HNA4hK+LZ5GErdA62axY6J7FNM4VDuEiInjxcROEQLiAbF2DDVYQcShwBuc5Bq5HoRolmIxqHkNEwSnnIqMZBZFm8pkRgmUJ9yHtg8lTbPIF9O05t4atMnoBUYKXLAwc9AanAiEJWT0AqtuqVbsOegFzDFSmjWTwBqdgKnSyegNw2ze8jHPQEpOIqLmod9ASk4gJsuIrwb4kjINc5hI5EmsuDRhQOeyg0ol1ig+Y6h9CVguclvkELpUP4SrHS8vCVlDL5n5LbFjG9rWj4izxkpbvpBv1PucBQy0gduXploV3/6lXlEIWA9ebGyY49243xfMnelp4bh1Ck8209CjN2RZRtv2KMofLzNhIM1HbMZ39rxOlhlP5RlufC75trWo8X7dVaDMebemfH1hNN0hHX9A8ipoeoJAOlanvxNY9rSUTZVM6AVZbLM3A0jQEpOY0mHeUWDPuO5YNvMgGW1PbiqxyxkwiwoleAR5QF+/VP1iU6Q+89EijY+u6rykwDgFrKNUp+uLxsLVbfjm0eUtxrs4w+OtncVu70vpokGwcnD8yxCahl17yLHKNP0LBCy2nPQ5mh5wBqazu30JCzLjniyCs7AQkL0vxnbNnhS3As+Q/1ssMvju0qQ6GAxEWDnhVWiQfFxEwkP6GsCoscEB8FeihaKRoUFDOVyllsVahUQLFTkbCvwH8inRk+OXOuCnwChx1+cchdGQoFJHYa2cl6ZShkcHjgk3OXCjEgiLhIVNMHqESmioyHFE1doBAbComHBsmXoBALgoiZBMnRoAoDAocdvlovuo5t/2740f5DOfiTYjDDlxL4NCINBxcBQ6kv6gIRMwmS3EMVBgQOM3wZMUP8yU3Y4UsKZRuXUYWXBs2ZohgVCoubjloOYBUVN5lQqY/sKioOMnnqDXWY5JA4aND0HOqwoIiYSZAsPKowIHCY4UuJe+LA3xUV1U1AQngUD/624Kl++IpNsAUiLhKlbEoqMSnBYqaD1PogQpwfROW8UcpwKGFiJ6LWwj7vsr5y72j+N3Q5I5dSLIz2mJZOIqo5GtxuRp55TBkGIT+FtVoE1rzw8+xqCnHIMfER8RUk4o8g8qTU3FQgYiaxUywcZccbjkLz5alCgOIZJlDO0Hdw9GUwg9CbCQEPjb+JiDkybXQkfO1B/cdquFvpmjNavWzRRnquukEfQ4hCPcnX5WvgydzBVrsan3z0HAYmtlZqoRt7+xRd+l6EfEfb2lHzae+lY21Ia2nbpONsXtXGYH2Q337YRqktBaA0XqD3/sRWblmJGKWpxIrQXpLR7Mgx19CpPFn7JrIufTfANdZ4FEWf8a/XyDo7OzkxFydJWi/tp5PzJJkd9qrqBV0Qp/ecpoNLw6Ornu5sdpQnKarXBb6rhVkCvjBM78jWbCu7NrW4MHvrxRqwosVr7Uw71c5OTl+fXJwkYvGE0CfQetbCyAT4zxjPJIskPdmZZvzt1cnZ2enZ61fl5qbb3Mk1wm/08k/UxBWjpk9L1+Lhn2Zf/gdQJE/p=END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA