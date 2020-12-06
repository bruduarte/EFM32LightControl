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
 -I"$(SDK_PATH)/platform/CMSIS/Include" \
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
 -mcpu=cortex-m3 \
 -std=c99 \
 -fdata-sections \
 -fno-builtin \
 -ffunction-sections \
 -fomit-frame-pointer \
 -Wall \
 -Os \
 -Wextra \
 -mthumb

CXX_FLAGS += \
 --specs=nano.specs \
 -g \
 -imacros sl_gcc_preinclude.h \
 -mcpu=cortex-m3 \
 -fdata-sections \
 -fno-builtin \
 -fno-rtti \
 -std=c++11 \
 -ffunction-sections \
 -fomit-frame-pointer \
 -Wall \
 -Os \
 -fno-exceptions \
 -Wextra \
 -mthumb

ASM_FLAGS += \
 -x assembler-with-cpp \
 -imacros sl_gcc_preinclude.h \
 -mcpu=cortex-m3 \
 -mthumb

LD_FLAGS += \
 -Wl,--gc-sections \
 -Xlinker -Map=$(OUTPUT_DIR)/$(PROJECTNAME).map \
 -mcpu=cortex-m3 \
 --specs=nano.specs \
 -T"autogen/linkerfile.ld" \
 -mthumb


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
# SIMPLICITY_STUDIO_METADATA=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=END_SIMPLICITY_STUDIO_METADATA
# END OF METADATA