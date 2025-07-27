
#include "micro.h"

#define MICROBUFFERSIZE 1024
char microBuffer[MICROBUFFERSIZE];
char microBufferTest[MICROBUFFERSIZE];
volatile uint16_t dataCompteur = 0;
volatile int flag_micro = 0;


void __ISR(_ADC_VECTOR , IPL5AUTO) ADC_ISR(void)
{
    
    if(flag_micro == 0){
        
        microBuffer[dataCompteur] = (char)((ADC1BUF0 >> 2) & 0x00FF);
        dataCompteur++;
        if(dataCompteur > MICROBUFFERSIZE){
            
            flag_micro = 1;
            
        }
    }
    IFS0bits.AD1IF = 0;
}


void config_micro(){
    
    //Pour test
    int i;
    for (i = 0; i < 1024; i++) {
        microBufferTest[i] = 1;
    }
    
    
    //Pin configure en input analogique
    TRISBbits.TRISB4 = 1;
    ANSELBbits.ANSB4 = 1;
    
    AD1CON1 = 0; /* AD1CON1 est définie dans p32mx370f512l.h qui est inclus via xc.h;
                  * Ceci met tout le registre AD1CON1 à zéro pour s'assurer que
                  * tout est bien à zéro avant de configurer le registre. */
    AD1CON2 = 0;
    
    AD1CON3 = 0;
    
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
    //AD1CON3bits.SAMC = 16;
    AD1CON2bits.ALTS = 0;       // Utilisation du MUX A
    
    IFS0bits.AD1IF = 0;         // Effacer le flag d'interruption
    IEC0bits.AD1IE = 1;         // Activer interuption
    IPC5bits.AD1IP = 5;         // Priorité 5
    IPC5bits.AD1IS = 0;         // Sous-priorité 0
   
    
     //Configuration de Timer 3
    T3CON = 0;
    //T3CONbits.TCKPS = 0b111; //prescaler: N = 256
    T3CONbits.TCKPS = 0; //prescaler: N = 1
    
    TMR3 = 0; //Initialise compteur du timer a 0
    PR3 = 4799; //10kHz temporaire
    // PR3 = (fPB / (N * fsignal)) - 1 = 48 000 000 / (1 * 16000) - 1 = 2999
    
    //Demarrage du Timer 3
    T3CONbits.ON = 1;
    
    // Lancement de l'ADC
    AD1CON1bits.ON   = 1;       
    
}


void micro_TASKS(){
    
   
    if(flag_micro){
       
        //strcpy(UDP_Send_Buffer, microBuffer);
        memcpy(UDP_Send_Buffer, microBuffer,1024);
        UDP_bytes_to_send = 1024;
        UDP_Send_Packet = true;
        
        
        //strcpy(UDP_Send_Buffer, "allo zybo\n\r");
        //UDP_Send_Packet = true;
        
        flag_micro = 0;
        dataCompteur = 0;
       
        
        
        //TCPIP_UDP_ArrayPut(appData.clientSocket, (uint8_t*)UDP_Send_Buffer, UDP_bytes_to_send);
        
    }
    
}