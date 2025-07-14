/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Company Name

  @File Name
    filename.c

  @Summary
    Brief description of the file.

  @Description
    Describe the purpose of this file.
 */
/* ************************************************************************** */

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Included Files                                                    */
/* ************************************************************************** */
/* ************************************************************************** */

#include <xc.h>
#include <sys/attribs.h>
#include <math.h>
#include "timers.h"
#include "Microphone.h"
#include "ledCustom.h"
#include "MEF.h"
#include "Boutons.h"
#include "ledCustom.h"
#include "FIFOSend.h"

#define MICROBUFFERSIZE 62000
#define AUDIO_BUF_SIZE 62000
#define SINE_SAMPLES 20                                 //Répétition de l'onde
#define SPEAKER RPB14R          

volatile uint16_t sineWave[SINE_SAMPLES];               //Onde 400hz
volatile uint16_t sineIndex = 0;                        //Index sinus
volatile uint16_t sinetemps = 0;                        //temps opération lecture
float volumeGain = 1.0;                                 //Volume 100%



extern volatile uint16_t microBuffer[AUDIO_BUF_SIZE];   //donné enregistré
volatile uint32_t audioIndex = 0;                       //Index de l'audio
/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Timer 3 (ADC)                                                   */
/* ************************************************************************** */
/* ************************************************************************** */


void Timer3_Config_ADC(void){
    // SETUP du timer 3
    T3CONbits.TCKPS = 0b011;    // PAGE 174 : Prescaler 1:8
    T3CONbits.TON = 0;
    PR3 = 749;                 // P.377 : Nombre de périodes pour 8khz
    TMR3 = 0;                   // P.377 : Valeur du compteur de départ
    IFS0bits.T3IF = 0;          // Clear interrupt flag for timer 1
    IPC3bits.T3IP = 3;          // Définir la priorité à 3
    IPC3bits.T3IS = 0;          // Sous-priorité à 0
    IEC0bits.T3IE = 1;
    //T3CONbits.TON = 1;
}
void Timer3_Demarre_ADC(void){
    T3CONbits.TON = 1; 
}
void Timer3_Stop_ADC(void){
    T3CONbits.TON = 0; 
}

void speakerJoue(uint16_t sample){
    OC1RS = (uint32_t)sample * PR2 / 1023;
}

void speakerJoueRaw(uint16_t sample){
    OC1RS = sample;
}

void __attribute__((vector(_TIMER_3_VECTOR), interrupt(IPL3SOFT))) Timer3ISR(void)
{
    switch (MEFgetState()){
        case Lecture :
            sinetemps++;                                        //compte durée de la lecture
            if (audioIndex >= AUDIO_BUF_SIZE) audioIndex = 0;   //termine a la fin du fichier d'audio
            speakerJoue(microBuffer[audioIndex++]);        // Valeur temporaire
            
            break;
            
        case Sinus :
            sinetemps++;                                        //compte durée du test
            if (sineIndex >= SINE_SAMPLES) {sineIndex = 0;}     //permet de répéter l'onde
            speakerJoueRaw(sineWave[sineIndex++]);      //Donne la valeur au PWM
            break;
            
        case Envoi :
            sinetemps++;                                        //compte durée de la lecture
            if (audioIndex >= AUDIO_BUF_SIZE) audioIndex = 0;   //termine a la fin du fichier d'audio
            uint16_t sampleEnv = microBuffer[audioIndex++];        // Valeur temporaire
            FIFOSendPut((uint32_t)sampleEnv * PR2 / 1023);
            break;
            
        case EnvoiSinus :
            sinetemps++;                                        //compte durée du test
            if (sineIndex >= SINE_SAMPLES) {sineIndex = 0;}     //permet de répéter l'onde
            FIFOSendPut(sineWave[sineIndex++]);    //Donne la valeur au PWM
            break;
    }
    IFS0bits.T3IF = 0;
}

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Tiemr4 (LED clignote à 10 Hz)                                     */
/* ************************************************************************** */
/* ************************************************************************** */

void Timer4_Config_LED(void){
    T4CONbits.TCKPS = 0b111; // PAGE 174 : Prescaler 256
    T4CONbits.TON = 0;

    PR4 = 18749; // P.377 : Nombre de périodes
    TMR4 = 0; // P.377 : Valeur du compteur de départ
    IFS0bits.T4IF = 0;  // Clear interrupt flag for timer 1
    IPC4bits.T4IP = 2; // Définir la priorité à 2
    IPC4bits.T4IS = 1; // Sous-priorité à 0
    IEC0bits.T4IE = 1;
}
void Timer4_set_LED(_Bool etat){
    T4CONbits.TON = etat;
}

void __attribute__((vector(_TIMER_4_VECTOR), interrupt(IPL2SOFT))) TimerTrickyLED(void)
{
    if(LATAbits.LATA1){
        LATAbits.LATA1 = 0;
    }else{
        LATAbits.LATA1 = 1;
    }
    IFS0bits.T4IF = 0;
}

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Configuration de l'onde de test (400Hz)                           */
/* ************************************************************************** */
/* ************************************************************************** */

void init_sine_wave(void) {
    float multiplier = 1;
    if(getSwitchesUser()[1]){
        multiplier = 2;
    }
    /*for (i = 0; i < SINE_SAMPLES; i++) {
        float sine_val = (sinf(2.0f * 3.14159265f * multiplier * i / SINE_SAMPLES) + 1.0f) / 2.0f;
        sineWave[i] = (uint16_t)(sine_val * 999); 
        //LD0Etat(1);
    }*/
    for (int i = 0; i < SINE_SAMPLES; i++) {
        double t = (double)i / 8000;        // Calcule la valeur de l'échantillon sinusoïdal
        double sine = sin(2.0 * 3.1415 * 400 * multiplier * t); 
        sineWave[i] = (uint16_t)((sine + 1.0) * (1000 / 2.0));
    }
}

/* ************************************************************************** */
/* ************************************************************************** */
/* Section: Setup pour le test, le PWM et la lecture                          */
/* ************************************************************************** */
/* ************************************************************************** */


void setupPWM(){
    
    // Configure Timer2 pour PWM à 48kHz
    T2CON = 0;
    T2CONbits.TCKPS = 0;        // Prescaler 1:1
    T2CONbits.TON = 1;
    PR2 = 1022;                 // Période pour 48kHz avec Fpb = 48MHz
    TMR2 = 0;                   // Valeur du compteur au départ
    IPC2bits.T2IP = 3;          // Définir la priorité à 3
    IPC2bits.T2IS = 0;          // Sous-priorité à 0
    IFS0bits.T2IF = 0;          // Clear interrupt flag
    IEC0bits.T2IE = 1;          // activer les intéruptions


    // Configure OC1 pour PWM mode
    TRISBbits.TRISB14 = 0;
    ANSELBbits.ANSB14 = 0; 

    OC1CON = 0;
    OC1R = 0;
    OC1RS = 0;
    SPEAKER = 0x0C;
    OC1CONbits.OCM = 0b110; // PWM mode sans fault pin
    OC1CONbits.OCTSEL = 0; // Timer2 comme source
    OC1CONbits.ON = 1;
}

void __attribute__((vector(_TIMER_2_VECTOR), interrupt(IPL3SOFT))) Timer2ISR(void)
{
    //LED_ToggleValue(2);
    IFS0bits.T2IF = 0;
}


float Starttest(float volume){
    volumeGain = volume / 4;
    sinetemps = 0;
    init_sine_wave();
    Timer3_Demarre_ADC();
    enum BoutonPressed bout = Aucun;
    while (sinetemps < 32000){ 
        bout = checkBoutons();
        
        if(bout == BTNU && volumeGain < 1){
            volumeGain += 0.25;
            setVolumeLEDs((volumeGain * 4));
        }else if(bout == BTND && volumeGain > 0.0){
            volumeGain -= 0.25;
            setVolumeLEDs((volumeGain * 4));
        }
    }
    return volumeGain;
}



float Startlecture(float volume){
    volumeGain = volume / 4;
    sinetemps = 0;
    Timer3_Demarre_ADC();
    enum BoutonPressed bout = Aucun;
    while (sinetemps < 62000){ 
        if(MEFgetState() != Lecture){
            break;
        }
    }
    return volumeGain;
}

void sendSinus(){
    sinetemps = 0;
    init_sine_wave();
    Timer3_Demarre_ADC();
    while (sinetemps < 32000){ 
        if(MEFgetState() != EnvoiSinus){
            break;
        }
    }
}
void sendEnregistrement(){
    sinetemps = 0;
    Timer3_Demarre_ADC();
    while (sinetemps < 62000){ 
        
    }
}