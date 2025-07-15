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
int distance;
uint16_t distance_IR[2];
uint16_t distance_IR_1;
uint16_t distance_IR_2;
static int current_distance = 000;
static bool hand_detected = false;

// Initialise les entrées (boutons) et sorties (DELs), et affiche l'état initial.
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
    //LATAbits.LATA7 = 0;       // Éteinte par défaut
    
    // --- LEDS RGB
    tris_LED8_R = 0; ansel_LED8_R = 0;
    tris_LED8_G = 0;
    tris_LED8_B = 0; ansel_LED8_B = 0;

}

// Change le mode actuel et met à jour l'affichage LCD et les couleurs des DELs RGB.
void interface_set_mode(void) {
    switch (current_state) {
        case MODE_AUTO:  
            //ajuster la hauteur avec le detecteur de proximité
            LATD = 0;
            lat_LED8_G = 1;
            LATACLR = 0b0000000000011110;
            if (prt_BTN_BTNR == 1) { delay_ms(DEBOUNCE_DELAY_MS); current_state = MODE_MANUAL;}
            LCD_WriteStringAtPos("Auto  ", 1, 6);
            current_distance = stepper_get_height();
            interface_LCD_height(current_distance);
            //Appelle de la detection de voix de la FFT
//            start_voix();
//            if (get_FFT()) {
//                distance_IR = IR_get_dst();
//                distance_IR_1 = distance_IR[0]; //AN16
//                distance_IR_2 = distance_IR[1]; //AN19
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
                //distance_IR = IR_get_dst();
                //distance_IR_1 = distance_IR[0]; //AN16
                //distance_IR_2 = distance_IR[1]; //AN19
//                if (distance_IR_1 > 300) {
//                    stepper_move(0, distance_IR_1);
//                }
//                if (distance_IR_2 > 300) {
//                    stepper_move(1, distance_IR_2);
//                }
                //Overwrite de la lecture des capteurs de distances
                //Enlever lorsque les capteurs sont fonctionnels
                interface_hand_confirm(1);
                stepper_move(0, 50);
            }
            interface_hand_confirm(0);
            
            break;
        case MODE_MANUAL:  
            LATD = 0;
            lat_LED8_B = 1;
            LATACLR = 0b0000000000011110;
            if (prt_BTN_BTNR == 1){ delay_ms(DEBOUNCE_DELAY_MS); current_state = MODE_LOCK;}
            //if (hauteur >= 1) hauteur -= 1;
            //interface_LCD_height(hauteur);
            LCD_WriteStringAtPos("Manual", 1, 6);
            current_distance = stepper_get_height();
            if (prt_BTN_BTNU == 1) { 
                //delay_ms(DEBOUNCE_DELAY_MS); 
                LATAbits.LATA1 = 1; 
                //hauteur = hauteur + 5;
                //config_stepper();
                stepper_move(0, 2);
                //delay_ms(DEBOUNCE_DELAY_MS);
            }
            if (prt_BTN_BTNC == 1) { 
                delay_ms(DEBOUNCE_DELAY_MS); 
                LATAbits.LATA2 = 1; 
                //envoyer la hauteur
                stepper_home();
            }
            if (prt_BTN_BTND == 1) { 
                //delay_ms(DEBOUNCE_DELAY_MS); 
                LATAbits.LATA3 = 1;
                //hauteur= hauteur - 5;
                stepper_move(1, 2);
            }
//            hauteur_manuel = current_distance + hauteur;
//            interface_LCD_height(hauteur_manuel);
            interface_LCD_height(current_distance);
            break;
        case MODE_LOCK:  
            LATD = 0;
            lat_LED8_R = 1;
            LATA = 0;
            if (prt_BTN_BTNR == 1){ delay_ms(DEBOUNCE_DELAY_MS); current_state = MODE_AUTO;}
            LCD_WriteStringAtPos("Lock  ", 1, 6);
            break;
        
    }
}

// Vérifie les boutons et applique un antirebond logiciel. Retourne un code selon le bouton pressé.
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