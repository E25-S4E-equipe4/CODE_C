#include <xc.h>
#include "micro.h"
#include "sensorIR.h"
#define MICROBUFFERSIZE 1024
#define byte uint8_t

byte microBuffer[MICROBUFFERSIZE];
unsigned short microIndex = 0;
byte actif = 0;
byte adcMode = 0;
byte done = 0;

void setADCmode(byte mode){
    adcMode = mode;
}

void Timer3_Config_ADC_Micro(void){
    // SETUP du timer 3
    T3CONbits.TCKPS = 0b011;    // PAGE 174 : Prescaler 1:8
    T3CONbits.TON = 0;
    PR3 = 749;                 // P.377 : TODO mettre la valeur pour 6 kHz
    TMR3 = 0;                   // P.377 : Valeur du compteur de départ
    IFS0bits.T3IF = 0;          // Clear interrupt flag for timer 1
    IPC3bits.T3IP = 3;          // Définir la priorité à 3
    IPC3bits.T3IS = 0;          // Sous-priorité à 0
    IEC0bits.T3IE = 1;
    //T3CONbits.TON = 1;
}
void Timer3_Demarre_ADC_Micro(void){
    T3CONbits.TON = 1; 
}
void Timer3_Stop_ADC_Micro(void){
    T3CONbits.TON = 0; 
}

void setupRecording(){
    TRISDbits.TRISD2 = 0; // RGB Red en entrée
    TRISDbits.TRISD12 = 0; // RGB Green en entrée
    TRISDbits.TRISD3 = 0; // RGB Blue en entrée
    LATDbits.LATD2 = 0;
    LATDbits.LATD12 = 0;
    LATDbits.LATD3 = 0;
    
    microIndex = 0;
    
    AD1CHSbits.CH0SA = 4;       // Entrée AN4 pour le micro du système
    AD1CHSbits.CH0NA = 0;       // Entrée négative du ADC sur Vref- (défault)
    AD1CON1bits.FORM = 0b0000;  // Format données sortie (Integer 16 bits)
    AD1CON2bits.CSCNA = 0;      // Mode single (1 seul channel) 1 pour scanner plusieurs channels
    AD1CON1bits.SSRC = 0b010;   // Synchronisation de l'ADC sur timer3, sinon 111 pour auto
    AD1CON1bits.ASAM = 0b1;     // Active l'auto-sample
    AD1CON2bits.VCFG = 0b000;   // Références voltage (Vr+ = AVdd ; Vr- = AVss)
    AD1CON2bits.SMPI = 0b000;   // Nombre de samples / interuptions (1x)
    AD1CON2bits.BUFM = 0b0;     // Configuration du buffer (1x mot de 16 bits)
    AD1CON3bits.ADRC = 0;       // ADC prend horloge système
    AD1CON3bits.SAMC = 16;
    AD1CON2bits.ALTS = 0;       // Utilisation du MUX A
    
    IFS0bits.AD1IF = 0;         // Effacer le flag d'interruption
    IEC0bits.AD1IE = 1;         // Activer interuption
    IPC5bits.AD1IP = 4;         // Priorité 4
    IPC5bits.AD1IS = 0;         // Sous-priorité 0
    Timer3_Config_ADC_Micro();
    Timer3_Demarre_ADC_Micro();
    AD1CON1bits.ON   = 1;       // Lancement de l'ADC
}

void __attribute__((vector(_ADC_VECTOR), interrupt(IPL4SOFT))) ADCEnregistrementMicro(void)
{
    if(adcMode){
        traitementIR();
    }else{
        
        microBuffer[microIndex] = (ADC1BUF0 >> 2);
        microIndex++;
        if(microIndex > MICROBUFFERSIZE){
            done = 1;
            microIndex = 0;
        }
    }
       
    IFS0bits.AD1IF = 0;
}


void StartMicRecording(){
    setupRecording();
    actif = 1;
    setADCmode(0);
    while(actif){
        //TODO Ajouter condition détection sortie + Réception données
        //TODO Envoi des données lorsque done = 1 et le remettre à 0 après
    }; 
    Timer3_Stop_ADC_Micro();
}