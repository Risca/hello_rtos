vpath % /home/risca/ti/ipc_3_40_01_08/packages/
vpath %.c /home/risca/ti/xdctools_3_32_01_22_core/packages/

XOPTS = -I"/home/risca/ti/xdctools_3_32_01_22_core/packages/" -Dxdc_target_types__=/home/risca/ti/bios_6_46_06_00/packages/ti/targets/arm/elf/std.h -Dxdc_target_name__=M4

CCOPTS = --endian=little -mv7M4 --float_support=vfplib --abi=eabi -q -ms --opt_for_speed=2  --program_level_compile -o3 -g --optimize_with_debug  --gcc

IPC_ROOT = /home/risca/ti/ipc_3_40_01_08/packages/

BUILD_DEFS =  -Dti_sdo_ipc_MessageQ_traceFlag__D=FALSE -DSMP -DOMAP5 -DRPMSG_NS_2_0 -Dti_sdo_ipc_family_ti81xx_InterruptDucati_videoProcId__D=65535 -Dti_sdo_ipc_family_ti81xx_InterruptDucati_hostProcId__D=65535 -Dti_sdo_ipc_family_ti81xx_InterruptDucati_vpssProcId__D=65535 -Dti_sdo_ipc_family_ti81xx_InterruptDucati_dspProcId__D=65535 -Dti_sdo_ipc_family_ti81xx_InterruptDucati_ducatiCtrlBaseAddr__D=1073745920 -Dti_sdo_ipc_family_ti81xx_InterruptDucati_mailboxBaseAddr__D=1208778752

INCS = -I/home/risca/ti/ipc_3_40_01_08/packages -I/home/risca/ti/bios_6_46_06_00/packages

CC = /home/risca/ti/ccs1120/ccs/tools/compiler/ti-cgt-arm_20.2.6.LTS/bin/armcl -c $(CCOPTS) --output_file=$@ -I /home/risca/ti/ccs1120/ccs/tools/compiler/ti-cgt-arm_20.2.6.LTS/include
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
	@$(ASM) $(BUILD_DEFS) $(XOPTS) $(INCS) $<
endef


all: ipc.aem4


Ipc.obj: ti/ipc/remoteproc/Resource.c ti/sdo/utils/NameServerRemoteNull.c ti/sdo/utils/MultiProc.c ti/sdo/utils/List.c ti/ipc/rpmsg/NameMap.c ti/ipc/rpmsg/RPMessage.c makefile
	@-$(call RM, $@)
	@echo clem4 $< ...
	@$(CC) $(BUILD_DEFS) $(XOPTS) $(INCS) \
	$(IPC_ROOT)ti/ipc/remoteproc/Resource.c \
	$(IPC_ROOT)ti/sdo/utils/NameServerRemoteNull.c \
	$(IPC_ROOT)ti/sdo/utils/MultiProc.c \
	$(IPC_ROOT)ti/sdo/utils/List.c \
	$(IPC_ROOT)ti/ipc/rpmsg/NameMap.c \
	$(IPC_ROOT)ti/ipc/rpmsg/RPMessage.c

ipc.aem4: Ipc.obj 
	@-$(call RM, $@)
	@echo arem4 $^ ...
	@$(AR) $@ $^


clean:
	@-$(call RM, ipc.aem4)
	@-$(call RM, Ipc.obj)
