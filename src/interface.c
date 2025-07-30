#include "interface.h"
#include "lcd.h"
#include "config.h"
#include "../projet_mplab.X/Stepper.h"
#include "sensorIR.h"
#include <xc.h>
#include <string.h>
//#include "../projet_mplab.X/micro.h"

typedef enum {
    
    MODE_AUTO,    
    MODE_MANUAL,  
    MODE_LOCK
} Etat;
Etat current_state = MODE_LOCK;
#define DEBOUNCE_DELAY_MS 300

int hauteur = 0;
int hauteur_manuel = 0;
bool direction;
uint16_t * distances_IR;
uint16_t distance_IR_1;
uint16_t distance_IR_2;
static int current_distance = 000;
static bool hand_detected = false;
uint8_t reussi;

// Initialise les entrées (boutons) et sorties (DELs), et affiche l'état initial.
void config_interface(void) {
    LCD_Init();
    LCD_WriteStringAtPos("Hauteur: ", 0, 0);
    LCD_WriteIntAtPos(current_distance, 3, 0, 8, 0);
    LCD_WriteStringAtPos("Mode: ", 1, 0);
    LCD_WriteStringAtPos("Lock  ", 1, 6);
    lat_LED8_R = 1;
   // --- Boutons
    tris_BTN_BTND = 1;          
    tris_BTN_BTNC = 1;          
    tris_BTN_BTNR = 1; ansel_BTN_BTNR = 0; 
    tris_BTN_BTNL = 1; ansel_BTN_BTNL = 0; 
    tris_BTN_BTNU = 1; ansel_BTN_BTNU = 0; 

    // --- LEDs 
    TRISACLR = 0xFF;   
    LATA = 0x00;  
    //LATAbits.LATA7 = 0;       // Éteinte par défaut
    
    // --- LEDS RGB
    tris_LED8_R = 0; ansel_LED8_R = 0;
    tris_LED8_G = 0;
    tris_LED8_B = 0; ansel_LED8_B = 0;

    // --- Switch
    tris_SWT_SWT7 = 1;  //Switch 7 (B9) set as input
    ansel_SWT_SWT7 = 0; //No analog read
    tris_SWT_SWT6 = 1;  //Switch 6 (B10) set as input
    ansel_SWT_SWT6 = 0; //No analog read
    
    // PMODB - Seulement pour la communication
    //PMODB_4
    TRISDbits.TRISD8 = 0;       //PMODB_4 RPD8 en output
    LATDbits.LATD8 = 0;
    //ANSELDbits.ANSD8 = 0;
    //PMODB_10
    TRISCbits.TRISC13 = 1;      //PMODB_10 RPC13 en input
    //ANSELCbits.ANSC13 = 0;
    reussi = 0;
}

// Change le mode actuel et met à jour l'affichage LCD et les couleurs des DELs RGB.
void interface_set_mode(void) {
    switch (current_state) {
//        #################################################################################
//        ##                                                                             ##
//        ##                             MODE AUTOMATIC                                  ##
//        ##                                                                             ##
//        #################################################################################
        case MODE_AUTO:  
            lat_LED8_R = 0;
            lat_LED8_G = 1;
            lat_LED8_B = 0;
            LATACLR = 0b0000000000011110;
            LCD_WriteStringAtPos("Auto  ", 1, 6);
            current_distance = stepper_get_height();
            interface_LCD_height(current_distance);
            if (prt_BTN_BTNR == 1) { delay_ms(DEBOUNCE_DELAY_MS); current_state = MODE_MANUAL;}
            //Appelle de la detection de voix de la FFT
            LATDbits.LATD8 = 1;                 //Commence la lecture de Signal de FFT (PMODB_4)
            reussi = PORTCbits.RC13;
            if (reussi) {                       //Lecture du signal FFT reussi du PMODB_10
                LATAbits.LATA5 = 1;
                distances_IR = IR_get_dst();
                distance_IR_1 = distances_IR[0]; //AN5  distance pour monter
                distance_IR_2 = distances_IR[1]; //AN24 distance pour descendre
                distance_IR_1 = (distance_IR_1 * 1.0601 - 25.588) - 4; //AN5  pointe vers le haut
                distance_IR_2 = (distance_IR_2 * 1.0601 - 25.588) - 4; //AN24 pointe vers le haut
                if (distance_IR_1 < 300) {
                    stepper_move(0, distance_IR_1);
                }
                if (distance_IR_2 < 250) {
                    stepper_move(1, distance_IR_2);
                }
                LATDbits.LATD8 = 0;             //Commence la lecture de Signal de FFT (PMODB_4)
            }
            
            //Simulation de la detection de la voix avec le bouton du centre en mode auto
            else if (prt_BTN_BTNC) {
                delay_ms(DEBOUNCE_DELAY_MS); 
                //Overwrite de la lecture des capteurs de distances si la switch 6 est active
                if (prt_SWT_SWT6) {
                    interface_hand_confirm(1);
                    stepper_move(0, 50);
                }
                else {
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
                    distance_IR_1 = distances_IR[0]; //AN5  pointe vers le haut
                    distance_IR_2 = distances_IR[1]; //AN24 pointe vers le bas
                    distance_IR_1 = (distance_IR_1 * 1.0601 - 25.588) - 4; //AN5  pointe vers le haut
                    distance_IR_2 = (distance_IR_2 * 1.0601 - 25.588) - 4; //AN24 pointe vers le haut
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
            else {
                LATAbits.LATA5 = 0;
            }
            interface_hand_confirm(0);
            break;
            
//        #################################################################################
//        ##                                                                             ##
//        ##                             MODE MANUEL                                     ##
//        ##                                                                             ##
//        #################################################################################
        case MODE_MANUAL:  
            LATDbits.LATD8 = 0;
            lat_LED8_R = 0;
            lat_LED8_G = 0;
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
            LATDbits.LATD8 = 0;
            lat_LED8_R = 1;
            lat_LED8_G = 0;
            lat_LED8_B = 0;
            LATA = 0;
            LCD_WriteStringAtPos("Lock  ", 1, 6);
            if (prt_BTN_BTNR == 1){ delay_ms(DEBOUNCE_DELAY_MS); current_state = MODE_AUTO;}
            break;
        
    }
}

// Vérifie les boutons et applique un antirebond logiciel. Retourne un code selon le bouton pressé.
//uint8_t interface_get_bouton(void) {
//    //if (current_state = MODE_MANUAL){
//        
//    //}
//    if (prt_BTN_BTNU == 1) { 
//        delay_ms(DEBOUNCE_DELAY_MS); 
//        LATAbits.LATA1 = 1; 
//        hauteur = hauteur + 5;
//        interface_LCD_height(hauteur);
//    }
//    if (prt_BTN_BTNC == 1) { 
//        delay_ms(DEBOUNCE_DELAY_MS); 
//        LATAbits.LATA2 = 1; 
//        //envoyer la hauteur
//    }
//    if (prt_BTN_BTND == 1) { 
//        delay_ms(DEBOUNCE_DELAY_MS); 
//        LATAbits.LATA3 = 1;
//        hauteur= hauteur - 5;
//        interface_LCD_height(hauteur);
//    }
//    if (prt_BTN_BTNR == 1) { 
//        delay_ms(DEBOUNCE_DELAY_MS); 
//        LATAbits.LATA4 = 1; 
//        interface_set_mode();
//    }
//    if (prt_BTN_BTNL == 1) { 
//        delay_ms(DEBOUNCE_DELAY_MS); 
//        LATAbits.LATA5 = 1; 
//    }
//}

// Met à jour la valeur de la hauteur affichée sur le LCD.
void interface_LCD_height(uint16_t distance) {
    current_distance = distance;
    LCD_WriteIntAtPos(current_distance, 4, 0, 8, 0);
    LATAbits.LATA0 = 1;

}

// Allume ou éteint la DEL D7 selon si une main est détectée (1 = détectée, 0 = rien).
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

// Crée un délai logiciel approximatif en millisecondes (utilisé pour l?antirebond).
void delay_ms(int ms) {
    int cycles = ms * 24000;  // approximatif pour 24 MHz
    while (cycles--) {
        asm volatile("nop");
    }
}