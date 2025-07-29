#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/projet_mplab.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/projet_mplab.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/led.c ../src/ssd.c ../src/accel.c ../src/i2c.c ../src/lcd.c rgbled.c ../src/system_config/default/framework/driver/encx24j600/bus/spi/drv_encx24j600_spi_bus.c ../src/system_config/default/framework/driver/encx24j600/closed_state/drv_encx24j600_closed_state.c ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_initialization_state.c ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_configure_state.c ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_detect_state.c ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_reset_state.c ../src/system_config/default/framework/driver/encx24j600/packet/drv_encx24j600_tx_packet.c ../src/system_config/default/framework/driver/encx24j600/packet/drv_encx24j600_rx_packet.c ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_running_state.c ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_change_duplex_state.c ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_int_state.c ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_status_state.c ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_tx_status_state.c ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_reset_rx_state.c ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_api.c ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_main_state.c ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_utils.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c ../src/system_config/default/framework/driver/spi/src/dynamic/drv_spi.c ../src/system_config/default/framework/driver/spi/src/drv_spi_sys_queue_fifo.c ../src/system_config/default/framework/driver/tmr/src/dynamic/drv_tmr.c ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static_buffer_queue.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static_read_write.c ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/default/framework/system/command/src/sys_command.c ../src/system_config/default/framework/system/console/src/sys_console.c ../src/system_config/default/framework/system/console/src/sys_console_uart.c ../src/system_config/default/framework/system/devcon/src/sys_devcon.c ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/default/framework/system/int/src/sys_int_pic32.c ../src/system_config/default/framework/system/ports/src/sys_ports_static.c ../src/system_config/default/framework/system/random/src/sys_random.c ../src/system_config/default/framework/system/reset/src/sys_reset.c ../src/system_config/default/framework/system/tmr/src/sys_tmr.c ../src/system_config/default/framework/tcpip/src/common/helpers.c ../src/system_config/default/framework/tcpip/src/ipv4.c ../src/system_config/default/framework/tcpip/src/udp.c ../src/system_config/default/framework/tcpip/src/tcpip_heap_alloc.c ../src/system_config/default/framework/tcpip/src/tcpip_heap_internal.c ../src/system_config/default/framework/tcpip/src/arp.c ../src/system_config/default/framework/tcpip/src/dns.c ../src/system_config/default/framework/tcpip/src/hash_fnv.c ../src/system_config/default/framework/tcpip/src/oahash.c ../src/system_config/default/framework/tcpip/src/tcpip_helpers.c ../src/system_config/default/framework/tcpip/src/tcpip_helper_c32.S ../src/system_config/default/framework/tcpip/src/tcpip_manager.c ../src/system_config/default/framework/tcpip/src/tcpip_notify.c ../src/system_config/default/framework/tcpip/src/tcpip_packet.c ../src/system_config/default/system_init.c ../src/system_config/default/system_interrupt.c ../src/system_config/default/system_tasks.c ../src/app_commands.c ../src/UDP_app.c ../src/main.c ../src/sensorIR.c ../src/interface.c Config_Tests_DRV_stepper.c Stepper.c main_stepper.c ../src/micro.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1360937237/led.o ${OBJECTDIR}/_ext/1360937237/ssd.o ${OBJECTDIR}/_ext/1360937237/accel.o ${OBJECTDIR}/_ext/1360937237/i2c.o ${OBJECTDIR}/_ext/1360937237/lcd.o ${OBJECTDIR}/rgbled.o ${OBJECTDIR}/_ext/996065237/drv_encx24j600_spi_bus.o ${OBJECTDIR}/_ext/1600828880/drv_encx24j600_closed_state.o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_initialization_state.o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_configure_state.o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_detect_state.o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_reset_state.o ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_tx_packet.o ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_rx_packet.o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_running_state.o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_change_duplex_state.o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_int_state.o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_status_state.o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_tx_status_state.o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_reset_rx_state.o ${OBJECTDIR}/_ext/820865379/drv_encx24j600_api.o ${OBJECTDIR}/_ext/820865379/drv_encx24j600_main_state.o ${OBJECTDIR}/_ext/820865379/drv_encx24j600_utils.o ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o ${OBJECTDIR}/_ext/977502197/drv_spi_api.o ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o ${OBJECTDIR}/_ext/915312864/drv_spi.o ${OBJECTDIR}/_ext/2077795248/drv_spi_sys_queue_fifo.o ${OBJECTDIR}/_ext/1298913485/drv_tmr.o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ${OBJECTDIR}/_ext/327000265/drv_usart_static_buffer_queue.o ${OBJECTDIR}/_ext/327000265/drv_usart_static_read_write.o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/2001008086/sys_command.o ${OBJECTDIR}/_ext/1544295906/sys_console.o ${OBJECTDIR}/_ext/1544295906/sys_console_uart.o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/1735427962/sys_int_pic32.o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ${OBJECTDIR}/_ext/327917790/sys_random.o ${OBJECTDIR}/_ext/68765530/sys_reset.o ${OBJECTDIR}/_ext/1417409628/sys_tmr.o ${OBJECTDIR}/_ext/1881663949/helpers.o ${OBJECTDIR}/_ext/26143033/ipv4.o ${OBJECTDIR}/_ext/26143033/udp.o ${OBJECTDIR}/_ext/26143033/tcpip_heap_alloc.o ${OBJECTDIR}/_ext/26143033/tcpip_heap_internal.o ${OBJECTDIR}/_ext/26143033/arp.o ${OBJECTDIR}/_ext/26143033/dns.o ${OBJECTDIR}/_ext/26143033/hash_fnv.o ${OBJECTDIR}/_ext/26143033/oahash.o ${OBJECTDIR}/_ext/26143033/tcpip_helpers.o ${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o ${OBJECTDIR}/_ext/26143033/tcpip_manager.o ${OBJECTDIR}/_ext/26143033/tcpip_notify.o ${OBJECTDIR}/_ext/26143033/tcpip_packet.o ${OBJECTDIR}/_ext/1688732426/system_init.o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app_commands.o ${OBJECTDIR}/_ext/1360937237/UDP_app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/sensorIR.o ${OBJECTDIR}/_ext/1360937237/interface.o ${OBJECTDIR}/Config_Tests_DRV_stepper.o ${OBJECTDIR}/Stepper.o ${OBJECTDIR}/main_stepper.o ${OBJECTDIR}/_ext/1360937237/micro.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1360937237/led.o.d ${OBJECTDIR}/_ext/1360937237/ssd.o.d ${OBJECTDIR}/_ext/1360937237/accel.o.d ${OBJECTDIR}/_ext/1360937237/i2c.o.d ${OBJECTDIR}/_ext/1360937237/lcd.o.d ${OBJECTDIR}/rgbled.o.d ${OBJECTDIR}/_ext/996065237/drv_encx24j600_spi_bus.o.d ${OBJECTDIR}/_ext/1600828880/drv_encx24j600_closed_state.o.d ${OBJECTDIR}/_ext/472602724/drv_encx24j600_initialization_state.o.d ${OBJECTDIR}/_ext/472602724/drv_encx24j600_configure_state.o.d ${OBJECTDIR}/_ext/472602724/drv_encx24j600_detect_state.o.d ${OBJECTDIR}/_ext/472602724/drv_encx24j600_reset_state.o.d ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_tx_packet.o.d ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_rx_packet.o.d ${OBJECTDIR}/_ext/999618079/drv_encx24j600_running_state.o.d ${OBJECTDIR}/_ext/999618079/drv_encx24j600_change_duplex_state.o.d ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_int_state.o.d ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_status_state.o.d ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_tx_status_state.o.d ${OBJECTDIR}/_ext/999618079/drv_encx24j600_reset_rx_state.o.d ${OBJECTDIR}/_ext/820865379/drv_encx24j600_api.o.d ${OBJECTDIR}/_ext/820865379/drv_encx24j600_main_state.o.d ${OBJECTDIR}/_ext/820865379/drv_encx24j600_utils.o.d ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d ${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o.d ${OBJECTDIR}/_ext/915312864/drv_spi.o.d ${OBJECTDIR}/_ext/2077795248/drv_spi_sys_queue_fifo.o.d ${OBJECTDIR}/_ext/1298913485/drv_tmr.o.d ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d ${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d ${OBJECTDIR}/_ext/327000265/drv_usart_static_buffer_queue.o.d ${OBJECTDIR}/_ext/327000265/drv_usart_static_read_write.o.d ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d ${OBJECTDIR}/_ext/2001008086/sys_command.o.d ${OBJECTDIR}/_ext/1544295906/sys_console.o.d ${OBJECTDIR}/_ext/1544295906/sys_console_uart.o.d ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d ${OBJECTDIR}/_ext/1735427962/sys_int_pic32.o.d ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d ${OBJECTDIR}/_ext/327917790/sys_random.o.d ${OBJECTDIR}/_ext/68765530/sys_reset.o.d ${OBJECTDIR}/_ext/1417409628/sys_tmr.o.d ${OBJECTDIR}/_ext/1881663949/helpers.o.d ${OBJECTDIR}/_ext/26143033/ipv4.o.d ${OBJECTDIR}/_ext/26143033/udp.o.d ${OBJECTDIR}/_ext/26143033/tcpip_heap_alloc.o.d ${OBJECTDIR}/_ext/26143033/tcpip_heap_internal.o.d ${OBJECTDIR}/_ext/26143033/arp.o.d ${OBJECTDIR}/_ext/26143033/dns.o.d ${OBJECTDIR}/_ext/26143033/hash_fnv.o.d ${OBJECTDIR}/_ext/26143033/oahash.o.d ${OBJECTDIR}/_ext/26143033/tcpip_helpers.o.d ${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.d ${OBJECTDIR}/_ext/26143033/tcpip_manager.o.d ${OBJECTDIR}/_ext/26143033/tcpip_notify.o.d ${OBJECTDIR}/_ext/26143033/tcpip_packet.o.d ${OBJECTDIR}/_ext/1688732426/system_init.o.d ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d ${OBJECTDIR}/_ext/1360937237/app_commands.o.d ${OBJECTDIR}/_ext/1360937237/UDP_app.o.d ${OBJECTDIR}/_ext/1360937237/main.o.d ${OBJECTDIR}/_ext/1360937237/sensorIR.o.d ${OBJECTDIR}/_ext/1360937237/interface.o.d ${OBJECTDIR}/Config_Tests_DRV_stepper.o.d ${OBJECTDIR}/Stepper.o.d ${OBJECTDIR}/main_stepper.o.d ${OBJECTDIR}/_ext/1360937237/micro.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1360937237/led.o ${OBJECTDIR}/_ext/1360937237/ssd.o ${OBJECTDIR}/_ext/1360937237/accel.o ${OBJECTDIR}/_ext/1360937237/i2c.o ${OBJECTDIR}/_ext/1360937237/lcd.o ${OBJECTDIR}/rgbled.o ${OBJECTDIR}/_ext/996065237/drv_encx24j600_spi_bus.o ${OBJECTDIR}/_ext/1600828880/drv_encx24j600_closed_state.o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_initialization_state.o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_configure_state.o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_detect_state.o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_reset_state.o ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_tx_packet.o ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_rx_packet.o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_running_state.o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_change_duplex_state.o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_int_state.o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_status_state.o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_tx_status_state.o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_reset_rx_state.o ${OBJECTDIR}/_ext/820865379/drv_encx24j600_api.o ${OBJECTDIR}/_ext/820865379/drv_encx24j600_main_state.o ${OBJECTDIR}/_ext/820865379/drv_encx24j600_utils.o ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o ${OBJECTDIR}/_ext/977502197/drv_spi_api.o ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o ${OBJECTDIR}/_ext/915312864/drv_spi.o ${OBJECTDIR}/_ext/2077795248/drv_spi_sys_queue_fifo.o ${OBJECTDIR}/_ext/1298913485/drv_tmr.o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ${OBJECTDIR}/_ext/327000265/drv_usart_static_buffer_queue.o ${OBJECTDIR}/_ext/327000265/drv_usart_static_read_write.o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ${OBJECTDIR}/_ext/2001008086/sys_command.o ${OBJECTDIR}/_ext/1544295906/sys_console.o ${OBJECTDIR}/_ext/1544295906/sys_console_uart.o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ${OBJECTDIR}/_ext/1735427962/sys_int_pic32.o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ${OBJECTDIR}/_ext/327917790/sys_random.o ${OBJECTDIR}/_ext/68765530/sys_reset.o ${OBJECTDIR}/_ext/1417409628/sys_tmr.o ${OBJECTDIR}/_ext/1881663949/helpers.o ${OBJECTDIR}/_ext/26143033/ipv4.o ${OBJECTDIR}/_ext/26143033/udp.o ${OBJECTDIR}/_ext/26143033/tcpip_heap_alloc.o ${OBJECTDIR}/_ext/26143033/tcpip_heap_internal.o ${OBJECTDIR}/_ext/26143033/arp.o ${OBJECTDIR}/_ext/26143033/dns.o ${OBJECTDIR}/_ext/26143033/hash_fnv.o ${OBJECTDIR}/_ext/26143033/oahash.o ${OBJECTDIR}/_ext/26143033/tcpip_helpers.o ${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o ${OBJECTDIR}/_ext/26143033/tcpip_manager.o ${OBJECTDIR}/_ext/26143033/tcpip_notify.o ${OBJECTDIR}/_ext/26143033/tcpip_packet.o ${OBJECTDIR}/_ext/1688732426/system_init.o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ${OBJECTDIR}/_ext/1360937237/app_commands.o ${OBJECTDIR}/_ext/1360937237/UDP_app.o ${OBJECTDIR}/_ext/1360937237/main.o ${OBJECTDIR}/_ext/1360937237/sensorIR.o ${OBJECTDIR}/_ext/1360937237/interface.o ${OBJECTDIR}/Config_Tests_DRV_stepper.o ${OBJECTDIR}/Stepper.o ${OBJECTDIR}/main_stepper.o ${OBJECTDIR}/_ext/1360937237/micro.o

# Source Files
SOURCEFILES=../src/led.c ../src/ssd.c ../src/accel.c ../src/i2c.c ../src/lcd.c rgbled.c ../src/system_config/default/framework/driver/encx24j600/bus/spi/drv_encx24j600_spi_bus.c ../src/system_config/default/framework/driver/encx24j600/closed_state/drv_encx24j600_closed_state.c ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_initialization_state.c ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_configure_state.c ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_detect_state.c ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_reset_state.c ../src/system_config/default/framework/driver/encx24j600/packet/drv_encx24j600_tx_packet.c ../src/system_config/default/framework/driver/encx24j600/packet/drv_encx24j600_rx_packet.c ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_running_state.c ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_change_duplex_state.c ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_int_state.c ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_status_state.c ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_tx_status_state.c ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_reset_rx_state.c ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_api.c ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_main_state.c ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_utils.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c ../src/system_config/default/framework/driver/spi/src/dynamic/drv_spi.c ../src/system_config/default/framework/driver/spi/src/drv_spi_sys_queue_fifo.c ../src/system_config/default/framework/driver/tmr/src/dynamic/drv_tmr.c ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static_buffer_queue.c ../src/system_config/default/framework/driver/usart/src/drv_usart_static_read_write.c ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c ../src/system_config/default/framework/system/command/src/sys_command.c ../src/system_config/default/framework/system/console/src/sys_console.c ../src/system_config/default/framework/system/console/src/sys_console_uart.c ../src/system_config/default/framework/system/devcon/src/sys_devcon.c ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c ../src/system_config/default/framework/system/int/src/sys_int_pic32.c ../src/system_config/default/framework/system/ports/src/sys_ports_static.c ../src/system_config/default/framework/system/random/src/sys_random.c ../src/system_config/default/framework/system/reset/src/sys_reset.c ../src/system_config/default/framework/system/tmr/src/sys_tmr.c ../src/system_config/default/framework/tcpip/src/common/helpers.c ../src/system_config/default/framework/tcpip/src/ipv4.c ../src/system_config/default/framework/tcpip/src/udp.c ../src/system_config/default/framework/tcpip/src/tcpip_heap_alloc.c ../src/system_config/default/framework/tcpip/src/tcpip_heap_internal.c ../src/system_config/default/framework/tcpip/src/arp.c ../src/system_config/default/framework/tcpip/src/dns.c ../src/system_config/default/framework/tcpip/src/hash_fnv.c ../src/system_config/default/framework/tcpip/src/oahash.c ../src/system_config/default/framework/tcpip/src/tcpip_helpers.c ../src/system_config/default/framework/tcpip/src/tcpip_helper_c32.S ../src/system_config/default/framework/tcpip/src/tcpip_manager.c ../src/system_config/default/framework/tcpip/src/tcpip_notify.c ../src/system_config/default/framework/tcpip/src/tcpip_packet.c ../src/system_config/default/system_init.c ../src/system_config/default/system_interrupt.c ../src/system_config/default/system_tasks.c ../src/app_commands.c ../src/UDP_app.c ../src/main.c ../src/sensorIR.c ../src/interface.c Config_Tests_DRV_stepper.c Stepper.c main_stepper.c ../src/micro.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/projet_mplab.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX370F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o: ../src/system_config/default/framework/tcpip/src/tcpip_helper_c32.S  .generated_files/205298c8773bcc1fb80fadd2c9f4fab618b9d1d7.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.ok ${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.d"  -o ${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o ../src/system_config/default/framework/tcpip/src/tcpip_helper_c32.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1 
	@${FIXDEPS} "${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.d" "${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
else
${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o: ../src/system_config/default/framework/tcpip/src/tcpip_helper_c32.S  .generated_files/702b90d93d03bf39adaca3bde2ead07bc15599b5.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.ok ${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.err 
	${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.d"  -o ${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o ../src/system_config/default/framework/tcpip/src/tcpip_helper_c32.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.asm.d",--gdwarf-2 
	@${FIXDEPS} "${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.d" "${OBJECTDIR}/_ext/26143033/tcpip_helper_c32.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../ 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1360937237/led.o: ../src/led.c  .generated_files/f3ee63247ed783275e5e730611a18110dc56359e.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/led.o.d" -o ${OBJECTDIR}/_ext/1360937237/led.o ../src/led.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/ssd.o: ../src/ssd.c  .generated_files/ac1f15a4ba1d7b9b76faf0ea828b1951e637a931.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ssd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ssd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ssd.o.d" -o ${OBJECTDIR}/_ext/1360937237/ssd.o ../src/ssd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/accel.o: ../src/accel.c  .generated_files/5d6f60e90b40d3325aa6f8b067ed508dfd569be1.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/accel.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/accel.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/accel.o.d" -o ${OBJECTDIR}/_ext/1360937237/accel.o ../src/accel.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/i2c.o: ../src/i2c.c  .generated_files/224257f8d0a711e85f2505db42967a8e0c81ea94.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/i2c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/i2c.o.d" -o ${OBJECTDIR}/_ext/1360937237/i2c.o ../src/i2c.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/lcd.o: ../src/lcd.c  .generated_files/1ff03edd8a2749c0e37ebd9ab8cd56a244598459.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/lcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/lcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/lcd.o.d" -o ${OBJECTDIR}/_ext/1360937237/lcd.o ../src/lcd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/rgbled.o: rgbled.c  .generated_files/54749102d38968d1cca5e972931a66bbf9b5252c.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/rgbled.o.d 
	@${RM} ${OBJECTDIR}/rgbled.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/rgbled.o.d" -o ${OBJECTDIR}/rgbled.o rgbled.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/996065237/drv_encx24j600_spi_bus.o: ../src/system_config/default/framework/driver/encx24j600/bus/spi/drv_encx24j600_spi_bus.c  .generated_files/a691956160b1103f3744f3462bba14c37a7afa2d.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/996065237" 
	@${RM} ${OBJECTDIR}/_ext/996065237/drv_encx24j600_spi_bus.o.d 
	@${RM} ${OBJECTDIR}/_ext/996065237/drv_encx24j600_spi_bus.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/996065237/drv_encx24j600_spi_bus.o.d" -o ${OBJECTDIR}/_ext/996065237/drv_encx24j600_spi_bus.o ../src/system_config/default/framework/driver/encx24j600/bus/spi/drv_encx24j600_spi_bus.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1600828880/drv_encx24j600_closed_state.o: ../src/system_config/default/framework/driver/encx24j600/closed_state/drv_encx24j600_closed_state.c  .generated_files/47ffcb9037aa23ce3de010f8dd737755b5e160be.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1600828880" 
	@${RM} ${OBJECTDIR}/_ext/1600828880/drv_encx24j600_closed_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/1600828880/drv_encx24j600_closed_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1600828880/drv_encx24j600_closed_state.o.d" -o ${OBJECTDIR}/_ext/1600828880/drv_encx24j600_closed_state.o ../src/system_config/default/framework/driver/encx24j600/closed_state/drv_encx24j600_closed_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/472602724/drv_encx24j600_initialization_state.o: ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_initialization_state.c  .generated_files/2b91df520f331b07cf6b59b6eb4ff7a123abdb7f.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/472602724" 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_initialization_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_initialization_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/472602724/drv_encx24j600_initialization_state.o.d" -o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_initialization_state.o ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_initialization_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/472602724/drv_encx24j600_configure_state.o: ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_configure_state.c  .generated_files/f2fb5f912cb2da343205190a74ae5fb83929a5cc.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/472602724" 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_configure_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_configure_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/472602724/drv_encx24j600_configure_state.o.d" -o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_configure_state.o ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_configure_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/472602724/drv_encx24j600_detect_state.o: ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_detect_state.c  .generated_files/9cc2e6476a503bd0c018aaf1647670ff5b0163ea.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/472602724" 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_detect_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_detect_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/472602724/drv_encx24j600_detect_state.o.d" -o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_detect_state.o ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_detect_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/472602724/drv_encx24j600_reset_state.o: ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_reset_state.c  .generated_files/222d66e60617fdac27531830fd1099c3cc14c14f.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/472602724" 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_reset_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_reset_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/472602724/drv_encx24j600_reset_state.o.d" -o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_reset_state.o ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_reset_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1728422854/drv_encx24j600_tx_packet.o: ../src/system_config/default/framework/driver/encx24j600/packet/drv_encx24j600_tx_packet.c  .generated_files/6a203dab483b153cb7452c0a338656ab7c6a6f5c.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1728422854" 
	@${RM} ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_tx_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_tx_packet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728422854/drv_encx24j600_tx_packet.o.d" -o ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_tx_packet.o ../src/system_config/default/framework/driver/encx24j600/packet/drv_encx24j600_tx_packet.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1728422854/drv_encx24j600_rx_packet.o: ../src/system_config/default/framework/driver/encx24j600/packet/drv_encx24j600_rx_packet.c  .generated_files/afcf4e2a30143e2f696bf88c8f2605d70cf21533.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1728422854" 
	@${RM} ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_rx_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_rx_packet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728422854/drv_encx24j600_rx_packet.o.d" -o ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_rx_packet.o ../src/system_config/default/framework/driver/encx24j600/packet/drv_encx24j600_rx_packet.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/999618079/drv_encx24j600_running_state.o: ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_running_state.c  .generated_files/f9e6324da0e0952f8a54f2731c2332a797fe4cf5.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/999618079" 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_running_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_running_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/999618079/drv_encx24j600_running_state.o.d" -o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_running_state.o ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_running_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/999618079/drv_encx24j600_change_duplex_state.o: ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_change_duplex_state.c  .generated_files/63b53f7708d8e059d11a2052255380849eff834.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/999618079" 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_change_duplex_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_change_duplex_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/999618079/drv_encx24j600_change_duplex_state.o.d" -o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_change_duplex_state.o ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_change_duplex_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_int_state.o: ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_int_state.c  .generated_files/47809776c17be6ed17515e2e386d06ad0e6fefae.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/999618079" 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_int_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_int_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_int_state.o.d" -o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_int_state.o ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_int_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_status_state.o: ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_status_state.c  .generated_files/aab4fa803177f3b2d55573c9680dd1cdce5b3112.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/999618079" 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_status_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_status_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_status_state.o.d" -o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_status_state.o ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_status_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_tx_status_state.o: ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_tx_status_state.c  .generated_files/cdca32654c85512b04de8fbc1b6b4d33ae9bbd67.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/999618079" 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_tx_status_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_tx_status_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_tx_status_state.o.d" -o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_tx_status_state.o ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_tx_status_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/999618079/drv_encx24j600_reset_rx_state.o: ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_reset_rx_state.c  .generated_files/21d8369bd2d36654cd9e7b67b81017c4cbda0e47.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/999618079" 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_reset_rx_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_reset_rx_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/999618079/drv_encx24j600_reset_rx_state.o.d" -o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_reset_rx_state.o ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_reset_rx_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/820865379/drv_encx24j600_api.o: ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_api.c  .generated_files/1d8aeb7551bfbb907a81d6ef110cdba6e12896ed.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/820865379" 
	@${RM} ${OBJECTDIR}/_ext/820865379/drv_encx24j600_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/820865379/drv_encx24j600_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/820865379/drv_encx24j600_api.o.d" -o ${OBJECTDIR}/_ext/820865379/drv_encx24j600_api.o ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/820865379/drv_encx24j600_main_state.o: ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_main_state.c  .generated_files/746adb4b812fdc0a36ba263fb52635af355d6943.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/820865379" 
	@${RM} ${OBJECTDIR}/_ext/820865379/drv_encx24j600_main_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/820865379/drv_encx24j600_main_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/820865379/drv_encx24j600_main_state.o.d" -o ${OBJECTDIR}/_ext/820865379/drv_encx24j600_main_state.o ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_main_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/820865379/drv_encx24j600_utils.o: ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_utils.c  .generated_files/b9658eff4d873f501dc81bb72dfcf644e5bba0c0.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/820865379" 
	@${RM} ${OBJECTDIR}/_ext/820865379/drv_encx24j600_utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/820865379/drv_encx24j600_utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/820865379/drv_encx24j600_utils.o.d" -o ${OBJECTDIR}/_ext/820865379/drv_encx24j600_utils.o ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_utils.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c  .generated_files/3532fe284427b07bc0732ccce1f01fde2ccc0602.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/977502197/drv_spi_api.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c  .generated_files/2934c1197fc784ede21c748e9a36143625c8d28.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_api.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c  .generated_files/e1aefca37d9abda045b162dee44d8d29e876c50.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/915312864/drv_spi.o: ../src/system_config/default/framework/driver/spi/src/dynamic/drv_spi.c  .generated_files/d9ec991618e059960d46cf12387f29fc9e5a8ce9.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/915312864" 
	@${RM} ${OBJECTDIR}/_ext/915312864/drv_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/915312864/drv_spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/915312864/drv_spi.o.d" -o ${OBJECTDIR}/_ext/915312864/drv_spi.o ../src/system_config/default/framework/driver/spi/src/dynamic/drv_spi.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2077795248/drv_spi_sys_queue_fifo.o: ../src/system_config/default/framework/driver/spi/src/drv_spi_sys_queue_fifo.c  .generated_files/a5c7469fbef230a666862f2962d6e39e37c309.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2077795248" 
	@${RM} ${OBJECTDIR}/_ext/2077795248/drv_spi_sys_queue_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/2077795248/drv_spi_sys_queue_fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2077795248/drv_spi_sys_queue_fifo.o.d" -o ${OBJECTDIR}/_ext/2077795248/drv_spi_sys_queue_fifo.o ../src/system_config/default/framework/driver/spi/src/drv_spi_sys_queue_fifo.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1298913485/drv_tmr.o: ../src/system_config/default/framework/driver/tmr/src/dynamic/drv_tmr.c  .generated_files/410778bc7929f6bd4013dccd827a9b5d751a517.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1298913485" 
	@${RM} ${OBJECTDIR}/_ext/1298913485/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1298913485/drv_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1298913485/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/1298913485/drv_tmr.o ../src/system_config/default/framework/driver/tmr/src/dynamic/drv_tmr.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c  .generated_files/6cb8ec8c41a8fc18827eaded3e4db41d03bc39f2.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327000265/drv_usart_static.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c  .generated_files/38c3ab95b46815122956c91ede5512424a9f5c2f.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327000265/drv_usart_static_buffer_queue.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static_buffer_queue.c  .generated_files/a024b97d565222e6d52df7aae57bea868a4f2948.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_buffer_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_buffer_queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static_buffer_queue.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static_buffer_queue.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static_buffer_queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327000265/drv_usart_static_read_write.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static_read_write.c  .generated_files/6cbc77b6a4c7a9bf1cdee2c8673d6b5c447956a5.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_read_write.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_read_write.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static_read_write.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static_read_write.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static_read_write.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o: ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/933cfadc4cde69caf9bc0110a53d870673b0204d.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/639803181" 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2001008086/sys_command.o: ../src/system_config/default/framework/system/command/src/sys_command.c  .generated_files/8e0b26b93e6148b996433c9fe3bbb5a4ab0a597a.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2001008086" 
	@${RM} ${OBJECTDIR}/_ext/2001008086/sys_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/2001008086/sys_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2001008086/sys_command.o.d" -o ${OBJECTDIR}/_ext/2001008086/sys_command.o ../src/system_config/default/framework/system/command/src/sys_command.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1544295906/sys_console.o: ../src/system_config/default/framework/system/console/src/sys_console.c  .generated_files/91a97229c31bd94a5d4dfeb5a256029b43d0cc9.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1544295906" 
	@${RM} ${OBJECTDIR}/_ext/1544295906/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1544295906/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1544295906/sys_console.o.d" -o ${OBJECTDIR}/_ext/1544295906/sys_console.o ../src/system_config/default/framework/system/console/src/sys_console.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1544295906/sys_console_uart.o: ../src/system_config/default/framework/system/console/src/sys_console_uart.c  .generated_files/3dab67ed22350f63ac75dcf02f20853075cb5f21.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1544295906" 
	@${RM} ${OBJECTDIR}/_ext/1544295906/sys_console_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1544295906/sys_console_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1544295906/sys_console_uart.o.d" -o ${OBJECTDIR}/_ext/1544295906/sys_console_uart.o ../src/system_config/default/framework/system/console/src/sys_console_uart.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/340578644/sys_devcon.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon.c  .generated_files/c5869f5496e423d1e788dce4f1819a7da3c310e5.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ../src/system_config/default/framework/system/devcon/src/sys_devcon.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/17aac8df417747c6d1d971c4809e4fe575920ac6.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1735427962/sys_int_pic32.o: ../src/system_config/default/framework/system/int/src/sys_int_pic32.c  .generated_files/93147c8cd0a8f3e6078d10373a88bbe3a5046e0e.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1735427962" 
	@${RM} ${OBJECTDIR}/_ext/1735427962/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1735427962/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1735427962/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1735427962/sys_int_pic32.o ../src/system_config/default/framework/system/int/src/sys_int_pic32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/822048611/sys_ports_static.o: ../src/system_config/default/framework/system/ports/src/sys_ports_static.c  .generated_files/ef5ecfa1588987a0d6e68e72cb1db3412cc31e4d.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/822048611" 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ../src/system_config/default/framework/system/ports/src/sys_ports_static.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327917790/sys_random.o: ../src/system_config/default/framework/system/random/src/sys_random.c  .generated_files/bb1398e90608d60289fd9350f0e5cdf5a60ac6ce.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327917790" 
	@${RM} ${OBJECTDIR}/_ext/327917790/sys_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/327917790/sys_random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327917790/sys_random.o.d" -o ${OBJECTDIR}/_ext/327917790/sys_random.o ../src/system_config/default/framework/system/random/src/sys_random.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/68765530/sys_reset.o: ../src/system_config/default/framework/system/reset/src/sys_reset.c  .generated_files/4319ebc31471790275be2e0c8b009d77c2a288b8.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/68765530" 
	@${RM} ${OBJECTDIR}/_ext/68765530/sys_reset.o.d 
	@${RM} ${OBJECTDIR}/_ext/68765530/sys_reset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/68765530/sys_reset.o.d" -o ${OBJECTDIR}/_ext/68765530/sys_reset.o ../src/system_config/default/framework/system/reset/src/sys_reset.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1417409628/sys_tmr.o: ../src/system_config/default/framework/system/tmr/src/sys_tmr.c  .generated_files/aad12c7a0e88181710780fdf4efd67714ca2e69f.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1417409628" 
	@${RM} ${OBJECTDIR}/_ext/1417409628/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1417409628/sys_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1417409628/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/1417409628/sys_tmr.o ../src/system_config/default/framework/system/tmr/src/sys_tmr.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1881663949/helpers.o: ../src/system_config/default/framework/tcpip/src/common/helpers.c  .generated_files/e54515dba1476182da1f2bbbe738fb6f8c1fe935.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1881663949" 
	@${RM} ${OBJECTDIR}/_ext/1881663949/helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1881663949/helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1881663949/helpers.o.d" -o ${OBJECTDIR}/_ext/1881663949/helpers.o ../src/system_config/default/framework/tcpip/src/common/helpers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/ipv4.o: ../src/system_config/default/framework/tcpip/src/ipv4.c  .generated_files/e816fb00996a3af99ec9c3215e47e000fb99b1c.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/ipv4.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/ipv4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/ipv4.o.d" -o ${OBJECTDIR}/_ext/26143033/ipv4.o ../src/system_config/default/framework/tcpip/src/ipv4.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/udp.o: ../src/system_config/default/framework/tcpip/src/udp.c  .generated_files/eef4a38b4456af5ffc4ba06fbc8c58083823355c.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/udp.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/udp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/udp.o.d" -o ${OBJECTDIR}/_ext/26143033/udp.o ../src/system_config/default/framework/tcpip/src/udp.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/tcpip_heap_alloc.o: ../src/system_config/default/framework/tcpip/src/tcpip_heap_alloc.c  .generated_files/251659e8c54b5a32e11f0ece2ed9a1590649d9d5.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_heap_alloc.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_heap_alloc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/tcpip_heap_alloc.o.d" -o ${OBJECTDIR}/_ext/26143033/tcpip_heap_alloc.o ../src/system_config/default/framework/tcpip/src/tcpip_heap_alloc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/tcpip_heap_internal.o: ../src/system_config/default/framework/tcpip/src/tcpip_heap_internal.c  .generated_files/fffcc8ada44a0cd68ee79799ac7337c2436b6eaf.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_heap_internal.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_heap_internal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/tcpip_heap_internal.o.d" -o ${OBJECTDIR}/_ext/26143033/tcpip_heap_internal.o ../src/system_config/default/framework/tcpip/src/tcpip_heap_internal.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/arp.o: ../src/system_config/default/framework/tcpip/src/arp.c  .generated_files/abbed5c1c660222f13d223850553616f348fcca5.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/arp.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/arp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/arp.o.d" -o ${OBJECTDIR}/_ext/26143033/arp.o ../src/system_config/default/framework/tcpip/src/arp.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/dns.o: ../src/system_config/default/framework/tcpip/src/dns.c  .generated_files/30432dd9f9c0ec0e80c79ab2537f98d36daa3cac.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/dns.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/dns.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/dns.o.d" -o ${OBJECTDIR}/_ext/26143033/dns.o ../src/system_config/default/framework/tcpip/src/dns.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/hash_fnv.o: ../src/system_config/default/framework/tcpip/src/hash_fnv.c  .generated_files/d181bcd70239eff350c107ebdd612046c3f3142d.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/hash_fnv.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/hash_fnv.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/hash_fnv.o.d" -o ${OBJECTDIR}/_ext/26143033/hash_fnv.o ../src/system_config/default/framework/tcpip/src/hash_fnv.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/oahash.o: ../src/system_config/default/framework/tcpip/src/oahash.c  .generated_files/6ce018066e59035b3063803f895c53f020a86ef.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/oahash.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/oahash.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/oahash.o.d" -o ${OBJECTDIR}/_ext/26143033/oahash.o ../src/system_config/default/framework/tcpip/src/oahash.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/tcpip_helpers.o: ../src/system_config/default/framework/tcpip/src/tcpip_helpers.c  .generated_files/1a7c5d4e162e0bb81944a7dcfb1fb9e64f6ce0fb.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/tcpip_helpers.o.d" -o ${OBJECTDIR}/_ext/26143033/tcpip_helpers.o ../src/system_config/default/framework/tcpip/src/tcpip_helpers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/tcpip_manager.o: ../src/system_config/default/framework/tcpip/src/tcpip_manager.c  .generated_files/565ef1f1a54dd9234ccf64263f9177efd7bde652.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/tcpip_manager.o.d" -o ${OBJECTDIR}/_ext/26143033/tcpip_manager.o ../src/system_config/default/framework/tcpip/src/tcpip_manager.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/tcpip_notify.o: ../src/system_config/default/framework/tcpip/src/tcpip_notify.c  .generated_files/35814f0aa1af9460c3d27de12b7285338692aba8.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_notify.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_notify.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/tcpip_notify.o.d" -o ${OBJECTDIR}/_ext/26143033/tcpip_notify.o ../src/system_config/default/framework/tcpip/src/tcpip_notify.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/tcpip_packet.o: ../src/system_config/default/framework/tcpip/src/tcpip_packet.c  .generated_files/bcd6c90b326212b178907b00d8c94dba3c6879a0.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_packet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/tcpip_packet.o.d" -o ${OBJECTDIR}/_ext/26143033/tcpip_packet.o ../src/system_config/default/framework/tcpip/src/tcpip_packet.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/system_init.o: ../src/system_config/default/system_init.c  .generated_files/749cef44e6d96ff7c1397c7399c87bf5f512e08c.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_init.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_init.o ../src/system_config/default/system_init.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/system_interrupt.o: ../src/system_config/default/system_interrupt.c  .generated_files/a8f00d80ebe2ec74cdab297344ed2cd0ab5f6ca7.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ../src/system_config/default/system_interrupt.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/system_tasks.o: ../src/system_config/default/system_tasks.c  .generated_files/81bacb79a4270e8703f5f87308f39a498b0cf840.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ../src/system_config/default/system_tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/app_commands.o: ../src/app_commands.c  .generated_files/f59805eb2dc38db9de44be7cab4dbc5515b656d6.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_commands.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_commands.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_commands.o ../src/app_commands.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/UDP_app.o: ../src/UDP_app.c  .generated_files/50637514a9b9e99a476db426bfa151268c8ce4b5.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/UDP_app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/UDP_app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/UDP_app.o.d" -o ${OBJECTDIR}/_ext/1360937237/UDP_app.o ../src/UDP_app.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/55f532e5da1a6ab0685f1b9e51b2de22a59d4a8e.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/sensorIR.o: ../src/sensorIR.c  .generated_files/4c1e3c3defbfc769c66fa60df33ca1844c7c587f.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/sensorIR.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/sensorIR.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/sensorIR.o.d" -o ${OBJECTDIR}/_ext/1360937237/sensorIR.o ../src/sensorIR.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/interface.o: ../src/interface.c  .generated_files/b5cb428134cd6167e5e8a785a7cdd0b6877fff6a.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/interface.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/interface.o.d" -o ${OBJECTDIR}/_ext/1360937237/interface.o ../src/interface.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/Config_Tests_DRV_stepper.o: Config_Tests_DRV_stepper.c  .generated_files/401af4d65b9b1c75a3c1d2290d5b3626efb19567.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Config_Tests_DRV_stepper.o.d 
	@${RM} ${OBJECTDIR}/Config_Tests_DRV_stepper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/Config_Tests_DRV_stepper.o.d" -o ${OBJECTDIR}/Config_Tests_DRV_stepper.o Config_Tests_DRV_stepper.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/Stepper.o: Stepper.c  .generated_files/18ed954be2f5225ca7970b8a22dea52bba9b947f.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Stepper.o.d 
	@${RM} ${OBJECTDIR}/Stepper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/Stepper.o.d" -o ${OBJECTDIR}/Stepper.o Stepper.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/main_stepper.o: main_stepper.c  .generated_files/b0ee8a284e177280fbf9a752c5e93a5d03118e38.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_stepper.o.d 
	@${RM} ${OBJECTDIR}/main_stepper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/main_stepper.o.d" -o ${OBJECTDIR}/main_stepper.o main_stepper.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/micro.o: ../src/micro.c  .generated_files/ed67c65359aa99d624176cb3ab32e280cd801019.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/micro.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/micro.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG   -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/micro.o.d" -o ${OBJECTDIR}/_ext/1360937237/micro.o ../src/micro.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
else
${OBJECTDIR}/_ext/1360937237/led.o: ../src/led.c  .generated_files/c9c6ef3d103e3af10d72d98b97ddc3035a718987.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/led.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/led.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/led.o.d" -o ${OBJECTDIR}/_ext/1360937237/led.o ../src/led.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/ssd.o: ../src/ssd.c  .generated_files/32a9182015c7140a0d491d3be38e66a1befbe68f.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ssd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/ssd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/ssd.o.d" -o ${OBJECTDIR}/_ext/1360937237/ssd.o ../src/ssd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/accel.o: ../src/accel.c  .generated_files/11aa3c3c37447b78a6a5063ee4f7403f76b6486.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/accel.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/accel.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/accel.o.d" -o ${OBJECTDIR}/_ext/1360937237/accel.o ../src/accel.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/i2c.o: ../src/i2c.c  .generated_files/d0c732f05c55b71e13a2622a97626ff2d9a71ef9.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/i2c.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/i2c.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/i2c.o.d" -o ${OBJECTDIR}/_ext/1360937237/i2c.o ../src/i2c.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/lcd.o: ../src/lcd.c  .generated_files/e187196f3183dc50341d5f0d16f659cc9493f69c.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/lcd.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/lcd.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/lcd.o.d" -o ${OBJECTDIR}/_ext/1360937237/lcd.o ../src/lcd.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/rgbled.o: rgbled.c  .generated_files/577f3ea04254dda4d7096e8fff21fce81c5bf184.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/rgbled.o.d 
	@${RM} ${OBJECTDIR}/rgbled.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/rgbled.o.d" -o ${OBJECTDIR}/rgbled.o rgbled.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/996065237/drv_encx24j600_spi_bus.o: ../src/system_config/default/framework/driver/encx24j600/bus/spi/drv_encx24j600_spi_bus.c  .generated_files/9bbfcb3ffb77159c002848374abc2f2a5d283f72.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/996065237" 
	@${RM} ${OBJECTDIR}/_ext/996065237/drv_encx24j600_spi_bus.o.d 
	@${RM} ${OBJECTDIR}/_ext/996065237/drv_encx24j600_spi_bus.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/996065237/drv_encx24j600_spi_bus.o.d" -o ${OBJECTDIR}/_ext/996065237/drv_encx24j600_spi_bus.o ../src/system_config/default/framework/driver/encx24j600/bus/spi/drv_encx24j600_spi_bus.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1600828880/drv_encx24j600_closed_state.o: ../src/system_config/default/framework/driver/encx24j600/closed_state/drv_encx24j600_closed_state.c  .generated_files/22ead0b10a5fd94d98acf75e18077d351bb1d8c3.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1600828880" 
	@${RM} ${OBJECTDIR}/_ext/1600828880/drv_encx24j600_closed_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/1600828880/drv_encx24j600_closed_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1600828880/drv_encx24j600_closed_state.o.d" -o ${OBJECTDIR}/_ext/1600828880/drv_encx24j600_closed_state.o ../src/system_config/default/framework/driver/encx24j600/closed_state/drv_encx24j600_closed_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/472602724/drv_encx24j600_initialization_state.o: ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_initialization_state.c  .generated_files/695081c8dad71c3765af154ac990bc79f8c244ff.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/472602724" 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_initialization_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_initialization_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/472602724/drv_encx24j600_initialization_state.o.d" -o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_initialization_state.o ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_initialization_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/472602724/drv_encx24j600_configure_state.o: ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_configure_state.c  .generated_files/d7b76004eee62242d22fece62878648e0605c98f.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/472602724" 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_configure_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_configure_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/472602724/drv_encx24j600_configure_state.o.d" -o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_configure_state.o ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_configure_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/472602724/drv_encx24j600_detect_state.o: ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_detect_state.c  .generated_files/c9f96653c65bdf6a1d2c9eb573a65897df161c83.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/472602724" 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_detect_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_detect_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/472602724/drv_encx24j600_detect_state.o.d" -o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_detect_state.o ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_detect_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/472602724/drv_encx24j600_reset_state.o: ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_reset_state.c  .generated_files/f00d4c93e3f1f5896812773fe4b0883fedc92e55.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/472602724" 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_reset_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/472602724/drv_encx24j600_reset_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/472602724/drv_encx24j600_reset_state.o.d" -o ${OBJECTDIR}/_ext/472602724/drv_encx24j600_reset_state.o ../src/system_config/default/framework/driver/encx24j600/initialization_state/drv_encx24j600_reset_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1728422854/drv_encx24j600_tx_packet.o: ../src/system_config/default/framework/driver/encx24j600/packet/drv_encx24j600_tx_packet.c  .generated_files/2e9a7cb4695f5b1b008ec1ef9226dfbc2e493fa0.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1728422854" 
	@${RM} ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_tx_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_tx_packet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728422854/drv_encx24j600_tx_packet.o.d" -o ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_tx_packet.o ../src/system_config/default/framework/driver/encx24j600/packet/drv_encx24j600_tx_packet.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1728422854/drv_encx24j600_rx_packet.o: ../src/system_config/default/framework/driver/encx24j600/packet/drv_encx24j600_rx_packet.c  .generated_files/1f43cafd3c24320d94d7f62e9a0d6eda84dd869e.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1728422854" 
	@${RM} ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_rx_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_rx_packet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1728422854/drv_encx24j600_rx_packet.o.d" -o ${OBJECTDIR}/_ext/1728422854/drv_encx24j600_rx_packet.o ../src/system_config/default/framework/driver/encx24j600/packet/drv_encx24j600_rx_packet.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/999618079/drv_encx24j600_running_state.o: ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_running_state.c  .generated_files/7fb9746025cc0097be8e67aa4c046120906cbef4.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/999618079" 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_running_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_running_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/999618079/drv_encx24j600_running_state.o.d" -o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_running_state.o ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_running_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/999618079/drv_encx24j600_change_duplex_state.o: ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_change_duplex_state.c  .generated_files/feaa31f41284f7f8b4c64b1dffc25c3fba776be0.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/999618079" 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_change_duplex_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_change_duplex_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/999618079/drv_encx24j600_change_duplex_state.o.d" -o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_change_duplex_state.o ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_change_duplex_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_int_state.o: ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_int_state.c  .generated_files/e64ba044bf1f706eaa87168dc6623b6e95619ed.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/999618079" 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_int_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_int_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_int_state.o.d" -o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_int_state.o ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_int_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_status_state.o: ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_status_state.c  .generated_files/e38eb881dee3d90c62bf49c4ff9f7c2b7ba3790f.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/999618079" 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_status_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_status_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_status_state.o.d" -o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_status_state.o ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_status_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_tx_status_state.o: ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_tx_status_state.c  .generated_files/e82266def1f84c5c2198e8d1fce2520dcebd8c74.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/999618079" 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_tx_status_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_tx_status_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_tx_status_state.o.d" -o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_check_tx_status_state.o ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_check_tx_status_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/999618079/drv_encx24j600_reset_rx_state.o: ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_reset_rx_state.c  .generated_files/6ec1003f8df08fa0bed44f6fc207c35e13f595ca.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/999618079" 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_reset_rx_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/999618079/drv_encx24j600_reset_rx_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/999618079/drv_encx24j600_reset_rx_state.o.d" -o ${OBJECTDIR}/_ext/999618079/drv_encx24j600_reset_rx_state.o ../src/system_config/default/framework/driver/encx24j600/running_state/drv_encx24j600_reset_rx_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/820865379/drv_encx24j600_api.o: ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_api.c  .generated_files/18652afb0842589ae23a10340b2f1bf5ea69ca0.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/820865379" 
	@${RM} ${OBJECTDIR}/_ext/820865379/drv_encx24j600_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/820865379/drv_encx24j600_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/820865379/drv_encx24j600_api.o.d" -o ${OBJECTDIR}/_ext/820865379/drv_encx24j600_api.o ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/820865379/drv_encx24j600_main_state.o: ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_main_state.c  .generated_files/132f015fdcc9fcd239d584e66a6e837ce9f4ad24.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/820865379" 
	@${RM} ${OBJECTDIR}/_ext/820865379/drv_encx24j600_main_state.o.d 
	@${RM} ${OBJECTDIR}/_ext/820865379/drv_encx24j600_main_state.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/820865379/drv_encx24j600_main_state.o.d" -o ${OBJECTDIR}/_ext/820865379/drv_encx24j600_main_state.o ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_main_state.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/820865379/drv_encx24j600_utils.o: ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_utils.c  .generated_files/c46c9232ec14ecfe8353c664dc67afb4f77cc712.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/820865379" 
	@${RM} ${OBJECTDIR}/_ext/820865379/drv_encx24j600_utils.o.d 
	@${RM} ${OBJECTDIR}/_ext/820865379/drv_encx24j600_utils.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/820865379/drv_encx24j600_utils.o.d" -o ${OBJECTDIR}/_ext/820865379/drv_encx24j600_utils.o ../src/system_config/default/framework/driver/encx24j600/drv_encx24j600_utils.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c  .generated_files/f067ef839ac09687c8e68c5c8067bccb9d720c77.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_tasks.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/977502197/drv_spi_api.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c  .generated_files/30db4eeb7e24d7e70d31c41b8a2f625edf0a42f.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_api.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_api.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_api.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_api.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o: ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c  .generated_files/964f43d4b1a4529d1dba5e48fe3abb3566082275.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/977502197" 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o.d" -o ${OBJECTDIR}/_ext/977502197/drv_spi_master_ebm_tasks.o ../src/system_config/default/framework/driver/spi/dynamic/drv_spi_master_ebm_tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/915312864/drv_spi.o: ../src/system_config/default/framework/driver/spi/src/dynamic/drv_spi.c  .generated_files/2d0233e0fbd019ed2e0f7d4f9d75ee15d1c7bcd3.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/915312864" 
	@${RM} ${OBJECTDIR}/_ext/915312864/drv_spi.o.d 
	@${RM} ${OBJECTDIR}/_ext/915312864/drv_spi.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/915312864/drv_spi.o.d" -o ${OBJECTDIR}/_ext/915312864/drv_spi.o ../src/system_config/default/framework/driver/spi/src/dynamic/drv_spi.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2077795248/drv_spi_sys_queue_fifo.o: ../src/system_config/default/framework/driver/spi/src/drv_spi_sys_queue_fifo.c  .generated_files/74cb4a02f6cd00f80862e3db2ba932e9fcfffc10.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2077795248" 
	@${RM} ${OBJECTDIR}/_ext/2077795248/drv_spi_sys_queue_fifo.o.d 
	@${RM} ${OBJECTDIR}/_ext/2077795248/drv_spi_sys_queue_fifo.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2077795248/drv_spi_sys_queue_fifo.o.d" -o ${OBJECTDIR}/_ext/2077795248/drv_spi_sys_queue_fifo.o ../src/system_config/default/framework/driver/spi/src/drv_spi_sys_queue_fifo.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1298913485/drv_tmr.o: ../src/system_config/default/framework/driver/tmr/src/dynamic/drv_tmr.c  .generated_files/d002fa156304e5a7ae6599b8a5af208bc1a6389b.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1298913485" 
	@${RM} ${OBJECTDIR}/_ext/1298913485/drv_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1298913485/drv_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1298913485/drv_tmr.o.d" -o ${OBJECTDIR}/_ext/1298913485/drv_tmr.o ../src/system_config/default/framework/driver/tmr/src/dynamic/drv_tmr.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c  .generated_files/9cefea084a6dbb25112c079a12ac870f680705aa.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_mapping.o ../src/system_config/default/framework/driver/usart/src/drv_usart_mapping.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327000265/drv_usart_static.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c  .generated_files/6cb8b61b3b60e05057fda3e9b588f7ad1d649f3b.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327000265/drv_usart_static_buffer_queue.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static_buffer_queue.c  .generated_files/981efe51b20fbb3e22ff8148c7822240f52d40ef.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_buffer_queue.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_buffer_queue.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static_buffer_queue.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static_buffer_queue.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static_buffer_queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327000265/drv_usart_static_read_write.o: ../src/system_config/default/framework/driver/usart/src/drv_usart_static_read_write.c  .generated_files/1634212f4d4061d10a9d189c9db45793fe237335.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327000265" 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_read_write.o.d 
	@${RM} ${OBJECTDIR}/_ext/327000265/drv_usart_static_read_write.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327000265/drv_usart_static_read_write.o.d" -o ${OBJECTDIR}/_ext/327000265/drv_usart_static_read_write.o ../src/system_config/default/framework/driver/usart/src/drv_usart_static_read_write.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o: ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c  .generated_files/1872bf6c43d3ef8ebe56f51b0ccfd344c988d1d0.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/639803181" 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o.d" -o ${OBJECTDIR}/_ext/639803181/sys_clk_pic32mx.o ../src/system_config/default/framework/system/clk/src/sys_clk_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/2001008086/sys_command.o: ../src/system_config/default/framework/system/command/src/sys_command.c  .generated_files/1453b0a1fee2d36c692fb1ba2ad24f868d2c8a74.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/2001008086" 
	@${RM} ${OBJECTDIR}/_ext/2001008086/sys_command.o.d 
	@${RM} ${OBJECTDIR}/_ext/2001008086/sys_command.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/2001008086/sys_command.o.d" -o ${OBJECTDIR}/_ext/2001008086/sys_command.o ../src/system_config/default/framework/system/command/src/sys_command.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1544295906/sys_console.o: ../src/system_config/default/framework/system/console/src/sys_console.c  .generated_files/c9c8782552c752a370e4ced2aeb1bf5f8be67525.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1544295906" 
	@${RM} ${OBJECTDIR}/_ext/1544295906/sys_console.o.d 
	@${RM} ${OBJECTDIR}/_ext/1544295906/sys_console.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1544295906/sys_console.o.d" -o ${OBJECTDIR}/_ext/1544295906/sys_console.o ../src/system_config/default/framework/system/console/src/sys_console.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1544295906/sys_console_uart.o: ../src/system_config/default/framework/system/console/src/sys_console_uart.c  .generated_files/1a1f17033a9398f1cac2b4552f9dd2e9812422da.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1544295906" 
	@${RM} ${OBJECTDIR}/_ext/1544295906/sys_console_uart.o.d 
	@${RM} ${OBJECTDIR}/_ext/1544295906/sys_console_uart.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1544295906/sys_console_uart.o.d" -o ${OBJECTDIR}/_ext/1544295906/sys_console_uart.o ../src/system_config/default/framework/system/console/src/sys_console_uart.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/340578644/sys_devcon.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon.c  .generated_files/bf4f90087faaed37760a37e7b46e1efda0161ed.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon.o ../src/system_config/default/framework/system/devcon/src/sys_devcon.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o: ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c  .generated_files/521d263805e0cee3440af6e6dafc672cb6d934d5.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/340578644" 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d 
	@${RM} ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o.d" -o ${OBJECTDIR}/_ext/340578644/sys_devcon_pic32mx.o ../src/system_config/default/framework/system/devcon/src/sys_devcon_pic32mx.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1735427962/sys_int_pic32.o: ../src/system_config/default/framework/system/int/src/sys_int_pic32.c  .generated_files/f5faed9594a4e459f06ba0b68c1de5c41768c3bd.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1735427962" 
	@${RM} ${OBJECTDIR}/_ext/1735427962/sys_int_pic32.o.d 
	@${RM} ${OBJECTDIR}/_ext/1735427962/sys_int_pic32.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1735427962/sys_int_pic32.o.d" -o ${OBJECTDIR}/_ext/1735427962/sys_int_pic32.o ../src/system_config/default/framework/system/int/src/sys_int_pic32.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/822048611/sys_ports_static.o: ../src/system_config/default/framework/system/ports/src/sys_ports_static.c  .generated_files/71431d3571c0d40dcf17aae35a313edb38cc2560.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/822048611" 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d 
	@${RM} ${OBJECTDIR}/_ext/822048611/sys_ports_static.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/822048611/sys_ports_static.o.d" -o ${OBJECTDIR}/_ext/822048611/sys_ports_static.o ../src/system_config/default/framework/system/ports/src/sys_ports_static.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/327917790/sys_random.o: ../src/system_config/default/framework/system/random/src/sys_random.c  .generated_files/50bdbeebf5a5dccf8deddae31c7dea85c3cc7d6a.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/327917790" 
	@${RM} ${OBJECTDIR}/_ext/327917790/sys_random.o.d 
	@${RM} ${OBJECTDIR}/_ext/327917790/sys_random.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/327917790/sys_random.o.d" -o ${OBJECTDIR}/_ext/327917790/sys_random.o ../src/system_config/default/framework/system/random/src/sys_random.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/68765530/sys_reset.o: ../src/system_config/default/framework/system/reset/src/sys_reset.c  .generated_files/f7aa164b4b9ea4d3478dee81d6fc1c54f622c80e.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/68765530" 
	@${RM} ${OBJECTDIR}/_ext/68765530/sys_reset.o.d 
	@${RM} ${OBJECTDIR}/_ext/68765530/sys_reset.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/68765530/sys_reset.o.d" -o ${OBJECTDIR}/_ext/68765530/sys_reset.o ../src/system_config/default/framework/system/reset/src/sys_reset.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1417409628/sys_tmr.o: ../src/system_config/default/framework/system/tmr/src/sys_tmr.c  .generated_files/f39ea0b65f01dfbefddcb4a25afed4c0f2d2ce98.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1417409628" 
	@${RM} ${OBJECTDIR}/_ext/1417409628/sys_tmr.o.d 
	@${RM} ${OBJECTDIR}/_ext/1417409628/sys_tmr.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1417409628/sys_tmr.o.d" -o ${OBJECTDIR}/_ext/1417409628/sys_tmr.o ../src/system_config/default/framework/system/tmr/src/sys_tmr.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1881663949/helpers.o: ../src/system_config/default/framework/tcpip/src/common/helpers.c  .generated_files/23ac6b9908f9bfc2eb721241d433d31a369555a9.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1881663949" 
	@${RM} ${OBJECTDIR}/_ext/1881663949/helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/1881663949/helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1881663949/helpers.o.d" -o ${OBJECTDIR}/_ext/1881663949/helpers.o ../src/system_config/default/framework/tcpip/src/common/helpers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/ipv4.o: ../src/system_config/default/framework/tcpip/src/ipv4.c  .generated_files/6a0a38ef0c43fe09c4ba1764f2535005b79b3b2.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/ipv4.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/ipv4.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/ipv4.o.d" -o ${OBJECTDIR}/_ext/26143033/ipv4.o ../src/system_config/default/framework/tcpip/src/ipv4.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/udp.o: ../src/system_config/default/framework/tcpip/src/udp.c  .generated_files/a2f7706fea6165e422d0609921537d4eda11ea0.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/udp.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/udp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/udp.o.d" -o ${OBJECTDIR}/_ext/26143033/udp.o ../src/system_config/default/framework/tcpip/src/udp.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/tcpip_heap_alloc.o: ../src/system_config/default/framework/tcpip/src/tcpip_heap_alloc.c  .generated_files/bba31ce289886408a263d1ceeff41832be2e287d.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_heap_alloc.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_heap_alloc.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/tcpip_heap_alloc.o.d" -o ${OBJECTDIR}/_ext/26143033/tcpip_heap_alloc.o ../src/system_config/default/framework/tcpip/src/tcpip_heap_alloc.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/tcpip_heap_internal.o: ../src/system_config/default/framework/tcpip/src/tcpip_heap_internal.c  .generated_files/61607d0545efd82404432fcfd59e0d6c58fcff46.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_heap_internal.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_heap_internal.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/tcpip_heap_internal.o.d" -o ${OBJECTDIR}/_ext/26143033/tcpip_heap_internal.o ../src/system_config/default/framework/tcpip/src/tcpip_heap_internal.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/arp.o: ../src/system_config/default/framework/tcpip/src/arp.c  .generated_files/b9fdbd44499069e46371b669f7ee437ffc93d801.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/arp.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/arp.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/arp.o.d" -o ${OBJECTDIR}/_ext/26143033/arp.o ../src/system_config/default/framework/tcpip/src/arp.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/dns.o: ../src/system_config/default/framework/tcpip/src/dns.c  .generated_files/1f0f841bd9df680b78d425a9616ff5a4cb6bf1ee.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/dns.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/dns.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/dns.o.d" -o ${OBJECTDIR}/_ext/26143033/dns.o ../src/system_config/default/framework/tcpip/src/dns.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/hash_fnv.o: ../src/system_config/default/framework/tcpip/src/hash_fnv.c  .generated_files/cd2d6b9864128b7b2d4919c2eb6049e851b28653.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/hash_fnv.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/hash_fnv.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/hash_fnv.o.d" -o ${OBJECTDIR}/_ext/26143033/hash_fnv.o ../src/system_config/default/framework/tcpip/src/hash_fnv.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/oahash.o: ../src/system_config/default/framework/tcpip/src/oahash.c  .generated_files/b87967164e06c93207313badccc486e0886c37ba.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/oahash.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/oahash.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/oahash.o.d" -o ${OBJECTDIR}/_ext/26143033/oahash.o ../src/system_config/default/framework/tcpip/src/oahash.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/tcpip_helpers.o: ../src/system_config/default/framework/tcpip/src/tcpip_helpers.c  .generated_files/ea63003798a25939a218293a9a3e4fbcaead1eab.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_helpers.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_helpers.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/tcpip_helpers.o.d" -o ${OBJECTDIR}/_ext/26143033/tcpip_helpers.o ../src/system_config/default/framework/tcpip/src/tcpip_helpers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/tcpip_manager.o: ../src/system_config/default/framework/tcpip/src/tcpip_manager.c  .generated_files/f6fb248b91a90280ee19c1ce0add47b7a870ea9e.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_manager.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_manager.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/tcpip_manager.o.d" -o ${OBJECTDIR}/_ext/26143033/tcpip_manager.o ../src/system_config/default/framework/tcpip/src/tcpip_manager.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/tcpip_notify.o: ../src/system_config/default/framework/tcpip/src/tcpip_notify.c  .generated_files/db1d50ebb69c120044b6aa299e0aafb97a69f096.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_notify.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_notify.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/tcpip_notify.o.d" -o ${OBJECTDIR}/_ext/26143033/tcpip_notify.o ../src/system_config/default/framework/tcpip/src/tcpip_notify.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/26143033/tcpip_packet.o: ../src/system_config/default/framework/tcpip/src/tcpip_packet.c  .generated_files/d37a223cf53f7e1080dfa3c4ba5cd3f66dbeff1e.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/26143033" 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_packet.o.d 
	@${RM} ${OBJECTDIR}/_ext/26143033/tcpip_packet.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/26143033/tcpip_packet.o.d" -o ${OBJECTDIR}/_ext/26143033/tcpip_packet.o ../src/system_config/default/framework/tcpip/src/tcpip_packet.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/system_init.o: ../src/system_config/default/system_init.c  .generated_files/f36b46e22b81bbfd09fe445d5578c3cf0c88dc63.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_init.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_init.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_init.o ../src/system_config/default/system_init.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/system_interrupt.o: ../src/system_config/default/system_interrupt.c  .generated_files/ea1b145882020b9528a1b7cb6b5ffc233717c529.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_interrupt.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_interrupt.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_interrupt.o ../src/system_config/default/system_interrupt.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1688732426/system_tasks.o: ../src/system_config/default/system_tasks.c  .generated_files/ba5bd8df0484297785d5d33697a4d6f33c48b470.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1688732426" 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o.d 
	@${RM} ${OBJECTDIR}/_ext/1688732426/system_tasks.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1688732426/system_tasks.o.d" -o ${OBJECTDIR}/_ext/1688732426/system_tasks.o ../src/system_config/default/system_tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/app_commands.o: ../src/app_commands.c  .generated_files/5048c81f1feccef7d5004a7a184495913ef9ff3c.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_commands.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_commands.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/app_commands.o.d" -o ${OBJECTDIR}/_ext/1360937237/app_commands.o ../src/app_commands.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/UDP_app.o: ../src/UDP_app.c  .generated_files/a258bf846e111927c7d31bcfe96ae3021c353704.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/UDP_app.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/UDP_app.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/UDP_app.o.d" -o ${OBJECTDIR}/_ext/1360937237/UDP_app.o ../src/UDP_app.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/main.o: ../src/main.c  .generated_files/a9f6a86f4156190c8642a2e6fe067b75974abc8.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/main.o.d" -o ${OBJECTDIR}/_ext/1360937237/main.o ../src/main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/sensorIR.o: ../src/sensorIR.c  .generated_files/27ebfe0e66ed4d628d4a471b19454f70d57bbac3.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/sensorIR.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/sensorIR.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/sensorIR.o.d" -o ${OBJECTDIR}/_ext/1360937237/sensorIR.o ../src/sensorIR.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/interface.o: ../src/interface.c  .generated_files/51b1d1decb59dcc6b3053a9b056d14242d91d030.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/interface.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/interface.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/interface.o.d" -o ${OBJECTDIR}/_ext/1360937237/interface.o ../src/interface.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/Config_Tests_DRV_stepper.o: Config_Tests_DRV_stepper.c  .generated_files/46dfc10c082079e40fc24869dc36e20f28a3e468.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Config_Tests_DRV_stepper.o.d 
	@${RM} ${OBJECTDIR}/Config_Tests_DRV_stepper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/Config_Tests_DRV_stepper.o.d" -o ${OBJECTDIR}/Config_Tests_DRV_stepper.o Config_Tests_DRV_stepper.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/Stepper.o: Stepper.c  .generated_files/c2b71ce0897182b6c1bf59d87b7836316d3541e6.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Stepper.o.d 
	@${RM} ${OBJECTDIR}/Stepper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/Stepper.o.d" -o ${OBJECTDIR}/Stepper.o Stepper.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/main_stepper.o: main_stepper.c  .generated_files/155b6b08496596a2f50c7663d05a6a0be245d8d1.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main_stepper.o.d 
	@${RM} ${OBJECTDIR}/main_stepper.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/main_stepper.o.d" -o ${OBJECTDIR}/main_stepper.o main_stepper.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
${OBJECTDIR}/_ext/1360937237/micro.o: ../src/micro.c  .generated_files/3c11b56bc69c99a2be98498f7bd79fa6c3fe1c81.flag .generated_files/fdebff246d98c53401df99cb176b1a347b430941.flag
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/micro.o.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/micro.o 
	${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -ffunction-sections -O1 -I"../src" -I"../src/system_config/default" -I"../src/default" -I"../src/system_config/default/framework" -Wall -MP -MMD -MF "${OBJECTDIR}/_ext/1360937237/micro.o.d" -o ${OBJECTDIR}/_ext/1360937237/micro.o ../src/micro.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)    
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/projet_mplab.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -g   -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/projet_mplab.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=_min_heap_size=44960,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/projet_mplab.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/projet_mplab.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=44960,--gc-sections,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml 
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/projet_mplab.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
