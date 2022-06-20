################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
build-628461071:
	@$(MAKE) --no-print-directory -Onone -f subdir_rules.mk build-628461071-inproc

build-628461071-inproc: ../app.cfg
	@echo 'Building file: "$<"'
	@echo 'Invoking: XDCtools'
	"/home/risca/ti/xdctools_3_32_01_22_core/xs" --xdcpath="/home/risca/ti/bios_6_46_06_00/packages;/home/risca/ti/ipc_3_40_01_08/packages;" xdc.tools.configuro -o configPkg -t ti.targets.arm.elf.M4 -p ti.platforms.sdp5430:ipu1 -r release -b "/home/risca/ti/workspace_v11/hello_rtos/config.bld" -c "/home/risca/ti/ccs1120/ccs/tools/compiler/ti-cgt-arm_20.2.6.LTS" --compileOptions "-g" "$<"
	@echo 'Finished building: "$<"'
	@echo ' '

configPkg/linker.cmd: /home/risca/ti/workspace_v11/hello_rtos/config.bld
configPkg/linker.cmd: build-628461071 ../app.cfg /home/risca/ti/workspace_v11/hello_rtos/config.bld
configPkg/compiler.opt: build-628461071 /home/risca/ti/workspace_v11/hello_rtos/config.bld
configPkg/: build-628461071 /home/risca/ti/workspace_v11/hello_rtos/config.bld

%.obj: ../%.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: Arm Compiler'
	"/home/risca/ti/ccs1120/ccs/tools/compiler/ti-cgt-arm_20.2.6.LTS/bin/armcl" -mv7M4 --code_state=16 -me --include_path="/home/risca/ti/workspace_v11/hello_rtos" --include_path="/home/risca/ti/ccs1120/ccs/tools/compiler/ti-cgt-arm_20.2.6.LTS/include" --define=omap5430 -g --diag_warning=225 --diag_wrap=off --display_error_number --preproc_with_compile --preproc_dependency="$(basename $(<F)).d_raw" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: "$<"'
	@echo ' '


