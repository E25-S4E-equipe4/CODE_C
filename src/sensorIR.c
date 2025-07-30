/* ************************************************************************** */
/** Descriptive File Name

  @Responsable
    Alexis Watelle (wata1801)

  @File Name
    distance_sensor.h

  @Summary
    Fichier effectuant la lecture en sur-échantillonnage des deux capteur de distances
    et leur conversion.

 */
/* ************************************************************************** */

#include <xc.h>
#include "sensorIR.h"
#include "config.h"
#include "../projet_mplab.X/micro.h"
//#include "config_bits.h"

#define NB_ECH 2500

#define VREF 3.3 
#define ADC_MAX 1023

uint32_t sensor_distance_1 = 0;
uint32_t sensor_distance_2 = 0;
volatile uint16_t echantillions = 0;
static uint16_t distances[2];

void setup_timer3_ADC(void) {
    T3CON = 0;                 // Désactiver Timer3
    TMR3 = 0;                  // Réinitialisation
    PR3 = 1000;               // Période pour 1 kHz (Assuming 40 MHz Fosc / 4) on a enlever le dernier 9 (etait 39999) - maintenant 40kHz
    T3CONbits.TCKPS = 2;       // Prescaler 1:8
    T3CONbits.TGATE = 0;       // Mode de comptage normal
    T3CONbits.ON = 1;          // Activer Timer3
}

void timer3_stop(void){
    T3CONbits.ON = 0;
}

void config_IR(void) {
    TRISBbits.TRISB5 = 1;       //RPB5 Analog discovery header BIN2 with AN5
    //TRISBbits.TRISB3 = 1;       //RPB3 Analog discovery header AIN1 with AN3
    TRISDbits.TRISD1 = 1;       //RPD1 PMODB_9 with AN24
    ANSELBbits.ANSB5 = 1;
    ANSELDbits.ANSD1 = 1;
    //ANSELBbits.ANSB3 = 1;
    macro_disable_interrupts;
    echantillions = 0;
    sensor_distance_1 = 0;
    sensor_distance_2 = 0;
    AD1CON1 = 0;               // Désactiver ADC pour config
    AD1CON1bits.FORM = 0;      // Format 16-bit
    AD1CON1bits.SSRC = 2;      // Synchronisé avec Timer3
    AD1CON1bits.ASAM = 1;      // Auto-sampling activé
    AD1CON2bits.VCFG = 0;      // Référence AVdd et AVss
    AD1CON2bits.CSCNA = 1;     // Scan mode activé
    AD1CON2bits.SMPI = 1;      // Interruption après 2 conversions
    AD1CON3bits.ADCS = 2;      // ADC clock divisor
    AD1CON3bits.SAMC = 4;      // Sample time

    //AD1CSSL = (1 << 5) | (1 << 24);  // Sélection des canaux AN5 et AN24
    AD1CSSL = 0;
    //AD1CSSLbits.CSSL3 = 1;
    AD1CSSLbits.CSSL5 = 1;
    AD1CSSLbits.CSSL24 = 1;

    IFS0bits.AD1IF = 0;         // Effacer le flag d'interruption
    IEC0bits.AD1IE = 1;         // Activer interuption
    IPC5bits.AD1IP = 4;         // Priorité 4
    IPC5bits.AD1IS = 0;         // Sous-priorité 0
    
    setup_timer3_ADC();
    macro_enable_interrupts();
    AD1CON1bits.ON = 1;        // Activer ADC
}

void __attribute__((vector(_ADC_VECTOR), interrupt(IPL4SOFT))) ADCEnregistrement(void)
{
    sensor_distance_1 += ADC1BUF0;
    sensor_distance_2 += ADC1BUF1;
    echantillions++;
    IFS0bits.AD1IF = 0;
}

uint16_t * IR_get_dst(){
    config_IR();
    while(echantillions < NB_ECH){
        if (echantillions > NB_ECH) {
            break;
        }
    };
    AD1CON1bits.ON = 0;
    distances[0] = (uint16_t)(-260.67 * (((float)sensor_distance_1/NB_ECH) * VREF / ADC_MAX) + 630.34);
    distances[1] = (uint16_t)(-260.67 * (((float)sensor_distance_2/NB_ECH) * VREF / ADC_MAX) + 630.34);


    timer3_stop();
    return distances;
}
