################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/subdir.mk
-include gecko_sdk_3.0.0/platform/emlib/src/subdir.mk
-include gecko_sdk_3.0.0/platform/emdrv/gpiointerrupt/src/subdir.mk
-include gecko_sdk_3.0.0/platform/common/toolchain/src/subdir.mk
-include gecko_sdk_3.0.0/platform/Device/SiliconLabs/EFM32GG/Source/GCC/subdir.mk
-include gecko_sdk_3.0.0/platform/Device/SiliconLabs/EFM32GG/Source/subdir.mk
-include Drivers/subdir.mk
-include BSP/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: EFM32LightControl.axf

# Tool invocations
EFM32LightControl.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: GNU ARM C Linker'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m3 -mthumb -T "C:\Users\igino.chaves\SimplicityStudio\v5_workspace\EFM32LightControl.git\EFM32LightControl/autogen/linkerfile.ld" -Xlinker --gc-sections -Xlinker -Map="EFM32LightControl.map" --specs=nano.specs -o EFM32LightControl.axf -Wl,--start-group "./BSP/bsp_stk_leds.o" "./Drivers/segmentlcd.o" "./gecko_sdk_3.0.0/platform/Device/SiliconLabs/EFM32GG/Source/GCC/startup_efm32gg.o" "./gecko_sdk_3.0.0/platform/Device/SiliconLabs/EFM32GG/Source/system_efm32gg.o" "./gecko_sdk_3.0.0/platform/common/toolchain/src/sl_memory.o" "./gecko_sdk_3.0.0/platform/emdrv/gpiointerrupt/src/gpiointerrupt.o" "./gecko_sdk_3.0.0/platform/emlib/src/em_acmp.o" "./gecko_sdk_3.0.0/platform/emlib/src/em_adc.o" "./gecko_sdk_3.0.0/platform/emlib/src/em_assert.o" "./gecko_sdk_3.0.0/platform/emlib/src/em_cmu.o" "./gecko_sdk_3.0.0/platform/emlib/src/em_core.o" "./gecko_sdk_3.0.0/platform/emlib/src/em_emu.o" "./gecko_sdk_3.0.0/platform/emlib/src/em_gpio.o" "./gecko_sdk_3.0.0/platform/emlib/src/em_lcd.o" "./gecko_sdk_3.0.0/platform/emlib/src/em_lesense.o" "./gecko_sdk_3.0.0/platform/emlib/src/em_pcnt.o" "./gecko_sdk_3.0.0/platform/emlib/src/em_prs.o" "./gecko_sdk_3.0.0/platform/emlib/src/em_rtc.o" "./gecko_sdk_3.0.0/platform/emlib/src/em_system.o" "./src/main.o" -lgcc -lc -lm -lnosys -Wl,--end-group -Wl,--start-group -lgcc -lc -lnosys -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

	@echo 'Building hex file: EFM32LightControl.hex'
	arm-none-eabi-objcopy -O ihex "EFM32LightControl.axf" "EFM32LightControl.hex"
	@echo ' '

	@echo 'Building bin file: EFM32LightControl.bin'
	arm-none-eabi-objcopy -O binary "EFM32LightControl.axf" "EFM32LightControl.bin"
	@echo ' '

	@echo 'Building s37 file: EFM32LightControl.s37'
	arm-none-eabi-objcopy -O srec "EFM32LightControl.axf" "EFM32LightControl.s37"
	@echo ' '

	@echo 'Running size tool'
	arm-none-eabi-size "EFM32LightControl.axf" -A
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(C_DEPS) EFM32LightControl.axf
	-@echo ' '

.PHONY: all clean dependents

-include ../makefile.targets
