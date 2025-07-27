/* 
 * File:   TEST_comm_UDP.h
 * Author: robid
 *
 * Created on July 14, 2025, 2:15 PM
 */

#include <xc.h>
#include <sys/attribs.h>
#include <string.h>
#include "app_commands.h"
#include "UDP_app.h"

#ifndef TEST_COMM_UDP_H
#define	TEST_COMM_UDP_H

extern volatile int delais_UDP;

int strobe_BTNC();
int strobe_BTNU();
void config_TEST_COMM();
void send_once_to_zybo();
void send_commTEST_to_zybo();


#endif	/* TEST_COMM_UDP_H */

