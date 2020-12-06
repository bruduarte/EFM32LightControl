################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/SiliconLabs/SimplicityStudio/v5/developer/sdks/gecko_sdk_suite/v3.0/platform/Device/SiliconLabs/EFM32GG/Source/system_efm32gg.c 

OBJS += \
./gecko_sdk_3.0.0/platform/Device/SiliconLabs/EFM32GG/Source/system_efm32gg.o 

C_DEPS += \
./gecko_sdk_3.0.0/platform/Device/SiliconLabs/EFM32GG/Source/system_efm32gg.d 


# Each subdirectory must supply rules for building sources it contributes
gecko_sdk_3.0.0/platform/Device/SiliconLabs/EFM32GG/Source/system_efm32gg.o: C:/SiliconLabs/SimplicityStudio/v5/developer/sdks/gecko_sdk_suite/v3.0/platform/Device/SiliconLabs/EFM32GG/Source/system_efm32gg.c
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C Compiler'
	arm-none-eabi-gcc -g3 -gdwarf-2 -mcpu=cortex-m3 -mthumb -std=c99 '-DEFM32GG990F1024=1' -I"C:/SiliconLabs/SimplicityStudio/v5/developer/sdks/gecko_sdk_suite/v3.0//hardware/kit/EFM32GG_STK3700/config" -I"C:/SiliconLabs/SimplicityStudio/v5/developer/sdks/gecko_sdk_suite/v3.0//hardware/kit/common/drivers" -I"C:/SiliconLabs/SimplicityStudio/v5/developer/sdks/gecko_sdk_suite/v3.0//hardware/kit/common/bsp" -I"C:/SiliconLabs/SimplicityStudio/v5/developer/sdks/gecko_sdk_suite/v3.0//platform/Device/SiliconLabs/EFM32GG/Include" -I"C:/SiliconLabs/SimplicityStudio/v5/developer/sdks/gecko_sdk_suite/v3.0//platform/common/toolchain/inc" -I"C:/SiliconLabs/SimplicityStudio/v5/developer/sdks/gecko_sdk_suite/v3.0//platform/emlib/inc" -I"C:/SiliconLabs/SimplicityStudio/v5/developer/sdks/gecko_sdk_suite/v3.0//platform/CMSIS/Include" -I"C:\Users\igino.chaves\SimplicityStudio\v5_workspace\EFM32LightControl.git\EFM32LightControl\config" -I"C:\Users\igino.chaves\SimplicityStudio\v5_workspace\EFM32LightControl.git\EFM32LightControl\autogen" -Os -Wall -Wextra -mno-sched-prolog -fno-builtin -ffunction-sections -fdata-sections -imacrossl_gcc_preinclude.h -c -fmessage-length=0 -MMD -MP -MF"gecko_sdk_3.0.0/platform/Device/SiliconLabs/EFM32GG/Source/system_efm32gg.d" -MT"gecko_sdk_3.0.0/platform/Device/SiliconLabs/EFM32GG/Source/system_efm32gg.o" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


