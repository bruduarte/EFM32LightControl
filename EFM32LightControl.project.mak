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
 -Wextra \
 -std=c99 \
 -Wall \
 -mthumb \
 -fdata-sections \
 -Os \
 -fomit-frame-pointer \
 -imacros sl_gcc_preinclude.h \
 -fno-builtin \
 -ffunction-sections \
 -mcpu=cortex-m3

CXX_FLAGS += \
 --specs=nano.specs \
 -g \
 -Wextra \
 -fno-exceptions \
 -fno-rtti \
 -Wall \
 -mthumb \
 -fdata-sections \
 -Os \
 -fomit-frame-pointer \
 -imacros sl_gcc_preinclude.h \
 -std=c++11 \
 -fno-builtin \
 -ffunction-sections \
 -mcpu=cortex-m3

ASM_FLAGS += \
 -x assembler-with-cpp \
 -mthumb \
 -imacros sl_gcc_preinclude.h \
 -mcpu=cortex-m3

LD_FLAGS += \
 -Wl,--gc-sections \
 -Xlinker -Map=$(OUTPUT_DIR)/$(PROJECTNAME).map \
 -T"autogen/linkerfile.ld" \
 -mthumb \
 --specs=nano.specs \
 -mcpu=cortex-m3


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

$(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o: $(SDK_PATH)/platform/emlib/src/em_system.c
	@echo 'Building $<'
	$(ECHO)$(CC) $(CFLAGS) -c -o $@ $<
CDEPS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.d
OBJS += $(OUTPUT_DIR)/sdk/platform/emlib/src/em_system.o

# Automatically-generated Simplicity Studio Metadata
# Please do not edit or delete these lines!
# SIMPLICITY_STUDIO_METADATA=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END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA