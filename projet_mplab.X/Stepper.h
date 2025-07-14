/* 
 * File:   Stepper.h
 * Author: Xavier Robidoux
 *
 * Created on June 6, 2025, 11:05 PM
 */

//General Include
#include <stdbool.h>

/* Microchip includes */
#include <xc.h>
#include <sys/attribs.h>

/* Basys MX3 includes */
#include "config.h"


#ifndef STEPPER_H
#define	STEPPER_H

extern volatile uint16_t position_pas;

void config_stepper();
void stepper_home();
void stepper_move(bool direction, uint8_t dst);
uint8_t stepper_get_height();


#endif	/* STEPPER_H */

