/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.h

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

#ifndef _TIMERS_H    /* Guard against multiple inclusion */
#define _TIMERS_H


void Timer3_Config_ADC(void);
void Timer3_Demarre_ADC(void);
void Timer3_Stop_ADC(void);

void Timer4_Config_LED(void);
void Timer4_set_LED(_Bool etat);
void init_sine_wave(void);
void setupPWM(void);

float Starttest(float volume);
float Startlecture(float volume);

void sendSinus();
void sendEnregistrement();

void speakerJoue(uint16_t sample);
void speakerJoueRaw(uint16_t sample);
#endif
/* *****************************************************************************
 End of File
 */
