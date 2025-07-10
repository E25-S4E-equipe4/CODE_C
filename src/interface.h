#ifndef INTERFACE_H
#define INTERFACE_H

#include <stdint.h>
#include <stdbool.h>

// Modes d'opération
//#define MODE_AUTO      0
//#define MODE_MANUEL    1
//#define MODE_VELOCK    2

void delay_ms(int ms);
void config_interface(void);
void interface_set_mode(void);


uint8_t interface_get_bouton(void);
void interface_LCD_height(uint16_t distance);  // distance en mm
void interface_hand_confirm(bool state);

#endif
