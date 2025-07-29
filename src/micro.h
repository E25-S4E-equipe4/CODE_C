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

#ifndef _MICROPHONE_H    /* Guard against multiple inclusion */
#define _MICROPHONE_H



void setupRecording();
void StartMicRecording();
void StartIntercom();
/**
 * Set le mode pour l'adc,
 * 0 pour l'enregistrement du micro
 * 1 pour les capteurs de distances
 * @param mode le numéro du mode
 */
void setADCmode(uint8_t mode);
#endif 

/* *****************************************************************************
 End of File
 */
