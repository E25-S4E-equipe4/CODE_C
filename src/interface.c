#include "interface.h"
#include "lcd.h"
#include "config.h"
#include "../projet_mplab.X/Stepper.h"
#include "sensorIR.h"
#include <xc.h>
#include <string.h>
typedef enum {
    
    MODE_AUTO,    
    MODE_MANUAL,  
    MODE_LOCK
} Etat;
Etat current_state = MODE_AUTO;
#define DEBOUNCE_DELAY_MS 20

int hauteur = 0;
int hauteur_manuel = 0;
bool direction;
uint16_t * distances_IR;
uint16_t distance_IR_1;
uint16_t distance_IR_2;
static int current_distance = 000;
static bool hand_detected = false;

// Initialise les entr�es (boutons) et sorties (DELs), et affiche l'�tat initial.
void config_interface(void) {
    LCD_Init();
    LCD_WriteStringAtPos("Hauteur: ", 0, 0);
    LCD_WriteIntAtPos(current_distance, 3, 0, 8, 0);
    LCD_WriteStringAtPos("Mode: ", 1, 0);
    LCD_WriteStringAtPos("Auto  ", 1, 6);
    lat_LED8_G = 1;
   // --- Boutons
    tris_BTN_BTND = 1;          
    tris_BTN_BTNC = 1;          
    tris_BTN_BTNR = 1; ansel_BTN_BTNR = 0; 
    tris_BTN_BTNL = 1; ansel_BTN_BTNL = 0; 
    tris_BTN_BTNU = 1; ansel_BTN_BTNU = 0; 

    // --- LEDs 
    TRISACLR = 0xFF;   
    LATA = 0x00;  
    //LATAbits.LATA7 = 0;       // �teinte par d�faut
    
    // --- LEDS RGB
    tris_LED8_R = 0; ansel_LED8_R = 0;
    tris_LED8_G = 0;
    tris_LED8_B = 0; ansel_LED8_B = 0;

    // --- Switch
    tris_SWT_SWT7 = 1;  //Switch 7 (B9) set as input
    ansel_SWT_SWT7 = 0; //No analog read
    tris_SWT_SWT6 = 1;  //Switch 6 (B10) set as input
    ansel_SWT_SWT6 = 0; //No analog read
}

// Change le mode actuel et met � jour l'affichage LCD et les couleurs des DELs RGB.
void interface_set_mode(void) {
    switch (current_state) {
//        #################################################################################
//        ##                                                                             ##
//        ##                             MODE AUTOMATIC                                  ##
//        ##                                                                             ##
//        #################################################################################
        case MODE_AUTO:  
            LATD = 0;
            lat_LED8_G = 1;
            LATACLR = 0b0000000000011110;
            LCD_WriteStringAtPos("Auto  ", 1, 6);
            current_distance = stepper_get_height();
            interface_LCD_height(current_distance);
            if (prt_BTN_BTNR == 1) { delay_ms(DEBOUNCE_DELAY_MS); current_state = MODE_MANUAL;}
            //Appelle de la detection de voix de la FFT
//            start_voix();
//            if (get_FFT()) {
//                distances_IR = IR_get_dst();
//                distance_IR_1 = distances_IR[0]; //AN16 distance pour monter
//                distance_IR_2 = distances_IR[1]; //AN19 distance pour descendre
//                if (distance_IR_1 > 300) {
//                    stepper_move(0, distance_IR_1);
//                }
//                if (distance_IR_2 > 300) {
//                    stepper_move(1, distance_IR_2);
//                }
//            }
            
            //Simulation de la detection de la voix avec le bouton du centre en mode auto
            if (prt_BTN_BTNC) {
                delay_ms(DEBOUNCE_DELAY_MS); 
                //Overwrite de la lecture des capteurs de distances si la switch 6 est active
                if (prt_SWT_SWT6) {
                    interface_hand_confirm(1);
                    stepper_move(0, 50);
                }
                else {
                    int i=0;
                    distances_IR = 0;
                    distance_IR_1 = 0;
                    distance_IR_2 = 0;
//                    for (i = 0;i<3;i++) {
//                        distances_IR = IR_get_dst();
//                        distance_IR_1 += distances_IR[0]; //AN16 pointe vers le haut
//                        distance_IR_2 += distances_IR[1]; //AN19 pointe vers le bas
//                    }
//                    distance_IR_1 = distance_IR_1 / 3; //AN19 pointe vers le bas
//                    distance_IR_2 = distance_IR_2 / 3; //AN19 pointe vers le bas
                    distances_IR = IR_get_dst();
                    distance_IR_1 = distances_IR[0]; //AN16 pointe vers le haut
                    distance_IR_2 = distances_IR[1]; //AN19 pointe vers le bas
                    distance_IR_1 = distance_IR_1 * 1.0601 - 25.588; //AN16 pointe vers le haut
                    distance_IR_2 = distance_IR_2 * 1.0601 - 25.588; //AN16 pointe vers le haut
                    if (distance_IR_1 < 300) {
                        interface_hand_confirm(1);
                        stepper_move(0, distance_IR_1);
                    }
                    else if (distance_IR_2 < 300) {     //ajouter detection du sol en fonction de la position actuelle
                        interface_hand_confirm(1);
                        stepper_move(1, distance_IR_2);
                    }
                }
            }
            interface_hand_confirm(0);
            break;
            
//        #################################################################################
//        ##                                                                             ##
//        ##                             MODE MANUEL                                     ##
//        ##                                                                             ##
//        #################################################################################
        case MODE_MANUAL:  
            LATD = 0;
            lat_LED8_B = 1;
            LATACLR = 0b0000000000011110;
            LCD_WriteStringAtPos("Manual", 1, 6);
            current_distance = stepper_get_height();
            if (prt_BTN_BTNR == 1){ delay_ms(DEBOUNCE_DELAY_MS); current_state = MODE_LOCK;}
            if (prt_BTN_BTNU == 1) { 
                //delay_ms(DEBOUNCE_DELAY_MS); 
                LATAbits.LATA1 = 1; 
                stepper_move(0, 2);
            }
            if (prt_BTN_BTNC == 1) { 
                delay_ms(DEBOUNCE_DELAY_MS); 
                LATAbits.LATA2 = 1; 
                //Envoie le moteur chercher sa valeur initiale selon la limit switch
                stepper_home();
            }
            if (prt_BTN_BTND == 1) { 
                //delay_ms(DEBOUNCE_DELAY_MS); 
                LATAbits.LATA3 = 1;
                stepper_move(1, 2);
            }
            interface_LCD_height(current_distance);
            break;
            
//        #################################################################################
//        ##                                                                             ##
//        ##                             MODE LOCK                                       ##
//        ##                                                                             ##
//        #################################################################################
        case MODE_LOCK:  
            LATD = 0;
            lat_LED8_R = 1;
            LATA = 0;
            LCD_WriteStringAtPos("Lock  ", 1, 6);
            if (prt_BTN_BTNR == 1){ delay_ms(DEBOUNCE_DELAY_MS); current_state = MODE_AUTO;}
            break;
        
    }
}

// V�rifie les boutons et applique un antirebond logiciel. Retourne un code selon le bouton press�.
uint8_t interface_get_bouton(void) {
    //if (current_state = MODE_MANUAL){
        
    //}
    if (prt_BTN_BTNU == 1) { 
        delay_ms(DEBOUNCE_DELAY_MS); 
        LATAbits.LATA1 = 1; 
        hauteur = hauteur + 5;
        interface_LCD_height(hauteur);
    }
    if (prt_BTN_BTNC == 1) { 
        delay_ms(DEBOUNCE_DELAY_MS); 
        LATAbits.LATA2 = 1; 
        //envoyer la hauteur
    }
    if (prt_BTN_BTND == 1) { 
        delay_ms(DEBOUNCE_DELAY_MS); 
        LATAbits.LATA3 = 1;
        hauteur= hauteur - 5;
        interface_LCD_height(hauteur);
    }
    if (prt_BTN_BTNR == 1) { 
        delay_ms(DEBOUNCE_DELAY_MS); 
        LATAbits.LATA4 = 1; 
        interface_set_mode();
    }
    if (prt_BTN_BTNL == 1) { 
        delay_ms(DEBOUNCE_DELAY_MS); 
        LATAbits.LATA5 = 1; 
    }
}

// Met � jour la valeur de la hauteur affich�e sur le LCD.
void interface_LCD_height(uint16_t distance) {
    current_distance = distance;
    LCD_WriteIntAtPos(current_distance, 4, 0, 8, 0);
    LATAbits.LATA0 = 1;

}

// Allume ou �teint la DEL D7 selon si une main est d�tect�e (1 = d�tect�e, 0 = rien).
void interface_hand_confirm(bool state) {
    hand_detected = state;
    //LATAbits.LATA7 = (state ? 1 : 0);
    if (hand_detected == 1){
        LATAbits.LATA7 = 1;
        LATAbits.LATA6 = 0;
    }
    else{
        LATAbits.LATA6 = 1;
        LATAbits.LATA7 = 0;
    }
}

// Cr�e un d�lai logiciel approximatif en millisecondes (utilis� pour l?antirebond).
void delay_ms(int ms) {
    int cycles = ms * 24000;  // approximatif pour 24 MHz
    while (cycles--) {
        asm volatile("nop");
    }
}