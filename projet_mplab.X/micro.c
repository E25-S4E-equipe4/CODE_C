
#include "micro.h"

#define MICROBUFFERSIZE 1024
uint8_t microBuffer[MICROBUFFERSIZE];
char microBufferTest[MICROBUFFERSIZE];
volatile uint16_t dataCompteur = 0;

volatile int flag_micro = 0;

int flag_fft = 0;
uint8_t modeADC = 0;
uint8_t confirm_fft = 0;

uint8_t window[MICROBUFFERSIZE] = {5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,8,8,8,8,8,8,8,8,8,8,8,8,8,9,9,9,9,9,9,9,9,9,9,9,10,10,10,10,10,10,10,10,10,10,11,11,11,11,11,11,11,11,11,12,12,12,12,12,12,12,12,12,13,13,13,13,13,13,13,13,14,14,14,14,14,14,14,14,15,15,15,15,15,15,15,16,16,16,16,16,16,16,16,17,17,17,17,17,17,18,18,18,18,18,18,18,19,19,19,19,19,19,19,20,20,20,20,20,20,21,21,21,21,21,21,21,22,22,22,22,22,22,23,23,23,23,23,23,24,24,24,24,24,24,25,25,25,25,25,25,26,26,26,26,26,26,27,27,27,27,27,28,28,28,28,28,28,29,29,29,29,29,29,30,30,30,30,30,31,31,31,31,31,31,32,32,32,32,32,32,33,33,33,33,33,34,34,34,34,34,34,35,35,35,35,35,35,36,36,36,36,36,37,37,37,37,37,37,38,38,38,38,38,38,39,39,39,39,39,40,40,40,40,40,40,41,41,41,41,41,41,42,42,42,42,42,42,43,43,43,43,43,43,44,44,44,44,44,45,45,45,45,45,45,45,46,46,46,46,46,46,47,47,47,47,47,47,48,48,48,48,48,48,49,49,49,49,49,49,49,50,50,50,50,50,50,50,51,51,51,51,51,51,51,52,52,52,52,52,52,52,53,53,53,53,53,53,53,54,54,54,54,54,54,54,54,55,55,55,55,55,55,55,55,56,56,56,56,56,56,56,56,56,57,57,57,57,57,57,57,57,57,58,58,58,58,58,58,58,58,58,58,59,59,59,59,59,59,59,59,59,59,59,60,60,60,60,60,60,60,60,60,60,60,60,60,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,63,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,62,61,61,61,61,61,61,61,61,61,61,61,61,61,61,61,60,60,60,60,60,60,60,60,60,60,60,60,60,59,59,59,59,59,59,59,59,59,59,59,58,58,58,58,58,58,58,58,58,58,57,57,57,57,57,57,57,57,57,56,56,56,56,56,56,56,56,56,55,55,55,55,55,55,55,55,54,54,54,54,54,54,54,54,53,53,53,53,53,53,53,52,52,52,52,52,52,52,51,51,51,51,51,51,51,50,50,50,50,50,50,50,49,49,49,49,49,49,49,48,48,48,48,48,48,47,47,47,47,47,47,46,46,46,46,46,46,45,45,45,45,45,45,45,44,44,44,44,44,43,43,43,43,43,43,42,42,42,42,42,42,41,41,41,41,41,41,40,40,40,40,40,40,39,39,39,39,39,38,38,38,38,38,38,37,37,37,37,37,37,36,36,36,36,36,35,35,35,35,35,35,34,34,34,34,34,34,33,33,33,33,33,32,32,32,32,32,32,31,31,31,31,31,31,30,30,30,30,30,29,29,29,29,29,29,28,28,28,28,28,28,27,27,27,27,27,26,26,26,26,26,26,25,25,25,25,25,25,24,24,24,24,24,24,23,23,23,23,23,23,22,22,22,22,22,22,21,21,21,21,21,21,21,20,20,20,20,20,20,19,19,19,19,19,19,19,18,18,18,18,18,18,18,17,17,17,17,17,17,16,16,16,16,16,16,16,16,15,15,15,15,15,15,15,14,14,14,14,14,14,14,14,13,13,13,13,13,13,13,13,12,12,12,12,12,12,12,12,12,11,11,11,11,11,11,11,11,11,10,10,10,10,10,10,10,10,10,10,9,9,9,9,9,9,9,9,9,9,9,8,8,8,8,8,8,8,8,8,8,8,8,8,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5};


void __ISR(_ADC_VECTOR , IPL5AUTO) ADC_ISR(void)
{
    
//    if(modeADC == 0){
//        
//        if (flag_micro == 0) {
//            //SYS_CONSOLE_MESSAGE("TP1.3\n\r");
//
//            //microBuffer[dataCompteur] = ((ADC1BUF0 >> 2) & 0x00FF);
//            uint16_t valeur_temp = ADC1BUF0 * window[dataCompteur];
//
//            microBuffer[dataCompteur] = (valeur_temp >> 8) & 0xFF;
//
//            dataCompteur++;
//
//            SYS_CONSOLE_PRINT("dataCompteur: %d\n\r", dataCompteur);
//
//            if(dataCompteur > MICROBUFFERSIZE){
//
//
//                flag_micro = 1;
//
//
//                SYS_CONSOLE_MESSAGE("TP1.0\n\r");
//
//            }
//        }
//    }
//    if (modeADC == 1) {
//            sensor_distance_1 += ADC1BUF0;
//            sensor_distance_2 += ADC1BUF1;
//            echantillions++;
//    }
    IFS0bits.AD1IF = 0;
}


void config_micro(){
    
    /* Étape 1: Configuring Analog Port Pins */
    TRISBbits.TRISB4 = 1;
    ANSELBbits.ANSB4 = 1;
     
    AD1CON1 = 0; /* AD1CON1 est définie dans p32mx370f512l.h qui est inclus via xc.h;
                  * Ceci met tout le registre AD1CON1 à zéro pour s'assurer que
                  * tout est bien à zéro avant de configurer le registre. */
    AD1CON2 = 0;

    /* Étape 3: Selecting the Format of the ADC Result */
    AD1CON1bits.FORM = 0b000; /* Integer 16-bit (DOUT = 0000 0000 0000 0000 0000 00dd dddd dddd) */
    
    /* Étape 4: Selecting the Sample Clock Source */
    AD1CON1bits.SSRC = 0b010; /* Timer3 period match ends sampling and starts conversion */
    
    /* Étapes 5 et 6 sont ensemble. */
    /* Étape 5: Synchronizing ADC Operations to Internal or External Events */
    /* Étape 6: Selecting Automatic or Manual Sampling */
    AD1CON1bits.ASAM = 1; /* Automatic sampling: Sampling begins immediately after
                           * last conversion completes; SAMP bit is automatically set in this approach. */
    
    /* Étape 7: Selecting the Voltage Reference Source */
    AD1CON2bits.VCFG = 0b000; /* VREFH = AVDD, VREFL = AVSS */
    
    /* Étape 8: Selecting the Scan Mode */
    AD1CON2bits.CSCNA = 0; /* Scan mode is disabled and positive input to MUX A controlled by CH0SA bits */

    /* Étape 11: Selecting the MUX to be Connected to the ADC (Alternating Sample Mode)*/
    AD1CON2bits.ALTS = 0; /* Always use Sample A input multiplexer settings */
    /* Étape 2: Selecting the Analog Inputs to the ADC Multiplexers */
    AD1CHSbits.CH0SA = 0b00100; /* Channel 0 positive input is AN4 */
    AD1CHSbits.CH0NA = 0; /* Channel 0 negative input is VREFL for Sample A */

    /* Étape 9: Setting the Number of Conversions per Interrupt */
    AD1CON2bits.SMPI = 0b0000; /* Interrupt at completion of conversion for each sample/convert sequence */
    
    /* Étape 10: Buffer Fill Mode */
    AD1CON2bits.BUFM = 0; /* Buffer configured as one 16-word buffer, CETTE LIGNE NE SERAIT PAS NÉCESSAIRE, CAR AD1CON2 A ÉTÉ MIS TOUT À ZÉRO AU DÉPART. */

    AD1CON3 = 0;
    
    /* Étape 12: Selecting the ADC Conversion Clock Source and Prescaler */
    AD1CON3bits.ADRC = 0; /* Clock derived from Peripheral Bus Clock (PBCLK) */

    
    /* Configurer les interruptions générées par le module ADC */
    IPC5bits.AD1IP = 5;
    IPC5bits.AD1IS = 0;
    IFS0bits.AD1IF = 0; /* S'assurer que le fanion d'interruption est à 0 - make sure interrupt flag is cleared */
    IEC0bits.AD1IE = 1; /* Activer les interruptions du module ADC - Enable ADC interrupts */
   
    
     //Configuration de Timer 3
    T3CON = 0;
    //T3CONbits.TCKPS = 0b111; //prescaler: N = 256
    T3CONbits.TCKPS = 0; //prescaler: N = 1
    
    TMR3 = 0; //Initialise compteur du timer a 0
    //PR3 = 2999; //16 kHz
    // PR3 = (fPB / (N * fsignal)) - 1 = 48 000 000 / (1 * 16000) - 1 = 7999
    
    PR3 = 16000; //6 kHz 7999
    // PR3 = (fPB / (N * fsignal)) - 1 = 48 000 000 / (1 * 6000) - 1 = 7999
    
    //Demarrage du Timer 3
    T3CONbits.ON = 1;
    
    // Lancement de l'ADC
    AD1CON1bits.ON   = 1;       
    
}

uint8_t get_fft(){
    
    return confirm_fft;
    
}


void micro_TASKS(){
    
   
    if(flag_micro){
       
        //strcpy(UDP_Send_Buffer, microBuffer);
        
        memcpy(UDP_Send_Buffer, microBuffer,1024);
        UDP_bytes_to_send = 1024;
        UDP_Send_Packet = true;
        
        SYS_CONSOLE_MESSAGE("TP micro tasks\n\r");
        
        //strcpy(UDP_Send_Buffer, "allo zybo\n\r");
        //UDP_Send_Packet = true;
        
        flag_micro = 0;
        dataCompteur = 0;
       
        
        
        //TCPIP_UDP_ArrayPut(appData.clientSocket, (uint8_t*)UDP_Send_Buffer, UDP_bytes_to_send);
        
    }
    if(flag_fft){
        
        AD1CON1bits.ON = 0;   
        T3CONbits.ON = 0;
        
        SYS_CONSOLE_MESSAGE("Commande vocale recue !\n\r");
        
        confirm_fft = 1;
        
    }
    
}