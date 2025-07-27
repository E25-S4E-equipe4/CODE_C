
#include "TEST_comm_UDP.h"

int etat_strobe_BTNC = 0;
int debounce_BTNC = 0;
int etat_strobe_BTNU = 0;
volatile int compt_debounce = 0;

int flag = 0;
int etat_test = 0;
volatile int delais_UDP = 0;


void __ISR(_TIMER_5_VECTOR, IPL2AUTO) T5_ISR(){
    
    delais_UDP++;
    
    IFS0bits.T5IF = 0;
}

//void __ISR(_TIMER_3_VECTOR, IPL3AUTO) T3_ISR(){
//    
//    flag = 1;
//    compt_debounce++;
//    
//    if(compt_debounce>100){
//        compt_debounce = 0;
//    }
//    
//    IFS0bits.T3IF = 0;
//}


void config_TEST_COMM(){
    
    TRISFbits.TRISF4 = 1; // RF0 (BTNC) configured as input
    
    TRISBbits.TRISB1 = 1; // RB1 (BTNU) configured as input
    ANSELBbits.ANSB1 = 0; // RB1 (BTNU) disabled analog
    
    TRISAbits.TRISA15 = 1; // RA15 (BTND) configured as input
    
    
    //Configuration de Timer 5
    T5CON = 0;
    T5CONbits.TCKPS = 0; //prescaler: N = 1
    
    TMR5 = 0; //Initialise compteur du timer a 0
    PR5 = 47; 
    // PR5 = (fPB / (N * fsignal)) - 1 = 48 000 000 / (1 * 1 000 000) - 1 = 47
    
    
    //Configuration d'interrupt
    IPC5bits.T5IP = 2;
    IPC5bits.T5IS = 0;
    IFS0bits.T5IF = 0;
    IEC0bits.T5IE = 1;
    
    //Demarrage du Timer 5
    T5CONbits.ON = 1;
    
    /*
     //Configuration de Timer 3
    T3CON = 0;
    T3CONbits.TCKPS = 0b111; //prescaler: N = 256
    
    TMR3 = 0; //Initialise compteur du timer a 0
    PR3 = 11718; 
    // PR3 = (fPB / (N * fsignal)) - 1 = 48 000 000 / (256 * 16) - 1 = 11 718
    
    
    //Configuration d'interrupt
    IPC3bits.T3IP = 3;
    IPC3bits.T3IS = 0;
    IFS0bits.T3IF = 0;
    IEC0bits.T3IE = 1;
    
    //Demarrage du Timer 3
    T3CONbits.ON = 1;
     */
    
}

int strobe_BTNC(){
    
    //static int etat_strobe_BTNC = 0;
    
    if(!etat_strobe_BTNC && PORTFbits.RF0){
        etat_strobe_BTNC = 1;
        compt_debounce = 0;
        return 1;
    }
    else if(etat_strobe_BTNC && PORTFbits.RF0){
        return 0;
    }
    else if(etat_strobe_BTNC && !PORTFbits.RF0 && compt_debounce > 5){
        etat_strobe_BTNC = 0;
        
        return 0;
    }
    return 0;
    
}

int strobe_BTNU(){
    
    //static int etat_strobe_BTNU = 0;
    
    if(!etat_strobe_BTNU && PORTBbits.RB1){
        etat_strobe_BTNU = 1;
        compt_debounce = 0;
        return 1;
    }
    else if(etat_strobe_BTNU && PORTBbits.RB1){
        return 0;
    }
    else if(etat_strobe_BTNU && !PORTBbits.RB1 && compt_debounce > 5){
        etat_strobe_BTNU = 0;
        return 0;
    }
    return 0;
    
}


void send_once_to_zybo(char buffer[MAX_PACKET_SIZE+1]){
    
    if(strobe_BTNC()){
        
        
        strcpy(UDP_Send_Buffer, buffer);
        delais_UDP = 0;
        UDP_Send_Packet = true;
       
    }
   
}


void send_commTEST_to_zybo(){
    
    switch(etat_test){
        
        case 0:
            
            if(strobe_BTNU()){
                etat_test = 1;
            }
            break;
            
        case 1:
            
            if(flag){
                strcpy(UDP_Send_Buffer, "Allo Zybo\n\r");
                delais_UDP = 0;
                UDP_Send_Packet = true;
                
                flag = 0;
            }
            
            else if(strobe_BTNU()){
                etat_test = 0;
            }
            break;
    }
}
