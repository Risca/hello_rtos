vpath % /home/risca/ti/ipc_3_40_01_08/packages/ti/sdo/
vpath %.c /home/risca/ti/xdctools_3_32_01_22_core/packages/

XOPTS = -I"/home/risca/ti/xdctools_3_32_01_22_core/packages/" -Dxdc_target_types__=/home/risca/ti/bios_6_46_06_00/packages/ti/targets/arm/elf/std.h -Dxdc_target_name__=M4

CCOPTS = --endian=little -mv7M4 --float_support=vfplib --abi=eabi -q -ms --opt_for_speed=2  --program_level_compile -o3 -g --optimize_with_debug  -Dti_sysbios_knl_Task_minimizeLatency__D=FALSE -Dti_sysbios_family_arm_ducati_GateSmp_enableStats__D=FALSE -Dti_sysbios_knl_Clock_stopCheckNext__D=FALSE -Dti_sysbios_hal_Core_numCores__D=2 -Dti_sysbios_family_arm_m3_Hwi_enableException__D=TRUE -Dti_sysbios_family_arm_m3_Hwi_disablePriority__D=16U -Dti_sysbios_family_arm_m3_Hwi_numSparseInterrupts__D=0U -Dti_sysbios_family_arm_ducati_Core_initStackFlag__D=TRUE

XDC_ROOT  = /home/risca/ti/xdctools_3_32_01_22_core/packages/

IPC_ROOT = /home/risca/ti/ipc_3_40_01_08/packages/ti/sdo/

BUILD_DEFS =  -Dxdc_runtime_Log_DISABLE_ALL

BIOS_INC  =

SYSBIOS_INC  = -I"/home/risca/ti/bios_6_46_06_00/packages"

IPC_INC    = -I"/home/risca/ti/ipc_3_40_01_08/packages"

UTILS_INC    = -I"/home/risca/ti/ipc_3_40_01_08/packages"

CC = /home/risca/ti/ccs1120/ccs/tools/compiler/ti-cgt-arm_20.2.6.LTS/bin/armcl -c $(CCOPTS) -I /home/risca/ti/ccs1120/ccs/tools/compiler/ti-cgt-arm_20.2.6.LTS/include
ASM = /home/risca/ti/ccs1120/ccs/tools/compiler/ti-cgt-arm_20.2.6.LTS/bin/armcl -c $(CCOPTS) -I /home/risca/ti/ccs1120/ccs/tools/compiler/ti-cgt-arm_20.2.6.LTS/include
AR = /home/risca/ti/ccs1120/ccs/tools/compiler/ti-cgt-arm_20.2.6.LTS/bin/armar rq

DEL = rm -f
CP = cp -f
MKDIR = mkdir -p

define RM
	$(if $(wildcard $1),$(DEL) $1,:)
endef

define ASSEMBLE
	@echo asmem4 $< ...
	@$(ASM) $(BUILD_DEFS) $(XOPTS) $(UTILS_INC) $<
endef


all: utils.aem4


UTILS.obj: utils/UTILS.c utils/NameServerRemoteNull.c utils/MultiProc.c utils/List.c makefile
	@-$(call RM, $@)
	@echo clem4 $< ...
	@$(CC) $(BUILD_DEFS) $(XOPTS) $(SYSBIOS_INC) $(BIOS_INC) \
	$(IPC_INC) $(UTILS_INC) \
	$(IPC_ROOT)utils/UTILS.c \
	$(IPC_ROOT)utils/NameServerRemoteNull.c \
	$(IPC_ROOT)utils/MultiProc.c \
	$(IPC_ROOT)utils/List.c \

utils.aem4: UTILS.obj 
	@-$(call RM, $@)
	@echo arem4 $^ ...
	@$(AR) $@ $^


clean:
	@-$(call RM, utils.aem4)
	@-$(call RM, UTILS.obj)
