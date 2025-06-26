
#include "Config_Tests_DRV_stepper.h"

int etat = 0; //etat MEF


void config_UART4(){
    
    
    TRISFbits.TRISF12 = 0; //RF12 (UART_TX) set as an output
    TRISFbits.TRISF13 = 1; //RF13 (UART_RX) set as an input
    
    U4RXR = 0x09; // UART_RX (RF13) -> U4RX
    RPF12R = 0x02; // UART_TX (RF12) -> U4TX
    
    
    U4MODE = 0;
    U4MODEbits.BRGH = 0;// division par 16 (baud rate)
    U4MODEbits.PDSEL = 0; //8 bits, sans parite
    U4MODEbits.STSEL = 1; //2 stop bits
    
    U4STAbits.UTXEN = 1;//enable transmission
    
    U4BRG = 53; // On veut un débit de 56 000 baud avec une horloge de périph.
                 // de 48 MHz. Avec cette valeur de UxBRG, on a un débit de
                 // 55 556 baud, ce qui correspond à une erreur de 0.79%
    
    U4MODEbits.ON = 1;
    
    
}

void UART4_PutUChar(unsigned char c)
{
    while(U4STAbits.UTXBF); // Tant que le tampon FIFO pour transmettre est
                            // plein, on ne peut pas écrire dedans et on
                            // reste ici.
    // On écrit dans le registre, ce qui est mis par la suite par le UART dans
    // le tampon de transmission.
    U4TXREG = c;
}

void UART4_PutUint(uint8_t c)
{
    while(U4STAbits.UTXBF); // Tant que le tampon FIFO pour transmettre est
                            // plein, on ne peut pas écrire dedans et on
                            // reste ici.
    // On écrit dans le registre, ce qui est mis par la suite par le UART dans
    // le tampon de transmission.
    U4TXREG = c;
}

void config_BTN(){
    
    TRISBbits.TRISB1 = 1; // RB1 (BTNU) configured as input
    ANSELBbits.ANSB1 = 0; // RB1 (BTNU) disabled analog
    TRISBbits.TRISB0 = 1; // RB1 (BTNL) configured as input
    ANSELBbits.ANSB0 = 0; // RB1 (BTNL) disabled analog
    TRISFbits.TRISF4 = 1; // RF0 (BTNC) configured as input
    TRISAbits.TRISA15 = 1; // RA15 (BTND) configured as input
    
}

void config_DEL(){
    
    TRISACLR = 0b11111111;
    
}

void MEF_test_DRV_stepper(){
    
    int BTNU = PORTBbits.RB1; // read BTNU
    int BTNL = PORTBbits.RB0; // read BTNL
    int BTNC = PORTFbits.RF0; // read BTNC
    int BTND = PORTAbits.RA15; // read BTND
    int i;
    
    switch(etat){
        
        case 0:     //attente
            
            LATACLR = 0b11111111;
            LATAbits.LATA0 = 1;
            
            if(BTNC){
                etat = 1;
            }
            else if(BTNL){
                etat = 4;
            }
            else if(BTNU){
                etat = 2;
            }
            else if(BTND){
                etat = 3;
            }
            else {
                etat = 0;
            }
            
            break;
            
        case 1:     //get_height
            
            LATACLR = 0b11111111;
            LATAbits.LATA1 = 1;
            
            uint8_t message = stepper_get_height();
            UART4_PutUint(message);
            
            for(i=0;i<1000000;i++){}    //delai
            
            etat = 0;
            
            break;
            
        case 2:     //Monter
            
            LATACLR = 0b11111111;
            LATAbits.LATA2 = 1;
            
            stepper_move(0, 10);
            
            etat = 0;
            
            for(i=0;i<1000000;i++){}    //delai
            
            break;
            
        case 3:     //Descendre
            
            LATACLR = 0b11111111;
            LATAbits.LATA3 = 1;
            
            stepper_move(1, 10);
  
            etat = 0;
            
            for(i=0;i<1000000;i++){}    //delai
            
            break;
            
        case 4:     //Stepper home     
        
            LATACLR = 0b11111111;
            LATAbits.LATA4 = 1;
            
            stepper_home();
            
            etat = 0;
            
            for(i=0;i<1000000;i++){}    //delai
            
            break;
        
    }
            
    
}