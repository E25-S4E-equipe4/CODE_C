#include "Microphone.h"
#include <xc.h>
#include "led.h"
#include "timers.h"

#define MICROBUFFERSIZE 1000

unsigned short microBuffer[MICROBUFFERSIZE];
uint8_t dataCompteur = 0;

void setupRecording(){
    TRISDbits.TRISD2 = 0; // RGB Red en entrée
    TRISDbits.TRISD12 = 0; // RGB Green en entrée
    TRISDbits.TRISD3 = 0; // RGB Blue en entrée
    LATDbits.LATD2 = 0;
    LATDbits.LATD12 = 0;
    LATDbits.LATD3 = 0;
    
    
    tris_MIC = 1; // Micro mode entrée (RB4)
    ansel_MIC = 1; // Entrée analog sur MIC (RB4)
    
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
    Timer3_Config_ADC();
    Timer3_Demarre_ADC();
    AD1CON1bits.ON   = 1;       // Lancement de l'ADC
}

void __attribute__((vector(_ADC_VECTOR), interrupt(IPL4SOFT))) ADCEnregistrement(void)
{
    microBuffer[dataCompteur] = ADC1BUF0;
    dataCompteur++;
    if(dataCompteur > MICROBUFFERSIZE){
        dataCompteur = 0;
        TCPIP_UDP_ArrayPut(appData.clientSocket, (uint8_t*)UDP_Send_Buffer, UDP_bytes_to_send);
    }
    IFS0bits.AD1IF = 0;
}
