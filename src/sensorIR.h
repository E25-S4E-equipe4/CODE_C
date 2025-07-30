/* ************************************************************************** */
/** Descriptive File Name

  @Responsable
    Alexis Watelle (wata1801)

  @File Name
    distance_sensor.h

  @Summary
    Fichier effectuant la lecture en sur-�chantillonnage des deux capteur de distances
    et leur conversion.

 */
/* ************************************************************************** */

#ifndef _DISTANCE_SENSOR_H    /* Guard against multiple inclusion */
#define _DISTANCE_SENSOR_H

/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */



#ifdef __cplusplus
extern "C" {
#endif

/**
 * Fonction utilis�e en interne afin de configurer les timers et l'ADC lors de l'acquisition des capteur
 */
void config_IR();

/**
 * Fonction appel�e afin d'avoir les distances des capteurs de distances
 * @return Un tableau de 2 �l�ments (2 capteurs) de leur distance en mm
 *      Le premier �l�ment est AN16 et le deuxi�me AN19
 */
uint16_t * IR_get_dst();
extern uint32_t sensor_distance_1;
extern uint32_t sensor_distance_2;
extern volatile uint16_t echantillions;
//extern int modeADC;
    
#ifdef __cplusplus
}
#endif

#endif 

/* *****************************************************************************
 End of File
 */
