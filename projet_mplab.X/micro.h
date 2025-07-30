/* 
 * File:   micro.h
 * Author: robid
 *
 * Created on July 17, 2025, 5:29 PM
 */


#ifndef MICRO_H
#define	MICRO_H

#include <xc.h>
#include <sys/attribs.h>
#include <string.h>
#include "../src/app_commands.h"
#include "../src/UDP_app.h"
#include "../src/config.h"
#include "../src/sensorIR.h"

extern int flag_fft;
extern uint8_t modeADC;
void config_micro();
void micro_TASKS();
uint8_t get_fft();

#endif	/* MICRO_H */

