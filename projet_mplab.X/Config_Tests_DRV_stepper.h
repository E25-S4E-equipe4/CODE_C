/* 
 * File:   Config_Tests_DRV_stepper.h
 * Author: robid
 *
 * Created on June 25, 2025, 12:35 PM
 */

/* Microchip includes */
#include <xc.h>
#include <sys/attribs.h>

/* Basys MX3 includes */
#include "config.h"

#include "Stepper.h"

#ifndef CONFIG_TESTS_DRV_STEPPER_H
#define	CONFIG_TESTS_DRV_STEPPER_H

void config_UART4();
void UART4_PutUChar(unsigned char c);
void UART4_PutUint(uint8_t c);
void config_BTN();
void config_DEL();
void MEF_test_DRV_stepper();

#endif	/* CONFIG_TESTS_DRV_STEPPER_H */

