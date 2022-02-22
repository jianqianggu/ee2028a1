################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Startup/subdir.mk
-include Src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
EE2028_AY2122S1_Assign1.elf \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
EE2028_AY2122S1_Assign1.list \

OBJCOPY_BIN += \
EE2028_AY2122S1_Assign1.bin \


# All Target
all: EE2028_AY2122S1_Assign1.elf secondary-outputs

# Tool invocations
EE2028_AY2122S1_Assign1.elf: $(OBJS) $(USER_OBJS) /Users/jianq/Downloads/EE2028_AY2122S1_Assign1/STM32L475VGTX_FLASH.ld
	arm-none-eabi-gcc -o "EE2028_AY2122S1_Assign1.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"/Users/jianq/Downloads/EE2028_AY2122S1_Assign1/STM32L475VGTX_FLASH.ld" --specs=nosys.specs -Wl,-Map="EE2028_AY2122S1_Assign1.map" -Wl,--gc-sections -static -u _printf_float -specs=rdimon.specs --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -u _printf_float -u _scanf_float -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

EE2028_AY2122S1_Assign1.list: $(EXECUTABLES)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "EE2028_AY2122S1_Assign1.list"
	@echo 'Finished building: $@'
	@echo ' '

EE2028_AY2122S1_Assign1.bin: $(EXECUTABLES)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "EE2028_AY2122S1_Assign1.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) *
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

.PHONY: all clean dependents
.SECONDARY:

-include ../makefile.targets
