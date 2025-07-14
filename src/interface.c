#include "interface.h"
#include "lcd.h"
#include "config.h"
#include "../projet_mplab.X/Stepper.h"
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
static int current_distance = 000;
static bool hand_detected = false;

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

// Initialise les entrées (boutons) et sorties (DELs), et affiche l'état initial.

void interface_set_mode(void) {
    switch (current_state) {
        case MODE_AUTO:  
            //ajuster la hauteur avec le detecteur de proximité
            LATD = 0;
            lat_LED8_G = 1;
            if (prt_BTN_BTNR == 1) { delay_ms(DEBOUNCE_DELAY_MS); current_state = MODE_MANUAL;}
            LCD_WriteStringAtPos("Auto  ", 1, 6);
            break;
        case MODE_MANUAL:  
            LATD = 0;
            lat_LED8_B = 1;
            if (prt_BTN_BTNR == 1){ delay_ms(DEBOUNCE_DELAY_MS); current_state = MODE_LOCK;}
            //if (hauteur >= 1) hauteur -= 1;
            //interface_LCD_height(hauteur);
            LCD_WriteStringAtPos("Manual", 1, 6);
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
            break;
        case MODE_LOCK:  
            LATD = 0;
            lat_LED8_R = 1;
            if (prt_BTN_BTNR == 1){ delay_ms(DEBOUNCE_DELAY_MS); current_state = MODE_AUTO;}
            LCD_WriteStringAtPos("Lock  ", 1, 6);
            break;
        
    }
}
// Change le mode actuel et met à jour l'affichage LCD et les couleurs des DELs RGB.


// Retourne le mode actuellement actif (Automatique, Manuel ou Verrouillé).

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
// Vérifie les boutons et applique un antirebond logiciel. Retourne un code selon le bouton pressé.

void interface_LCD_height(uint16_t distance) {
    current_distance = distance;
    LCD_WriteIntAtPos(current_distance, 4, 0, 8, 0);
    LATAbits.LATA0 = 1;

}
// Met à jour la valeur de la hauteur affichée sur le LCD.

void interface_hand_confirm(bool state) {
    hand_detected = state;
    //LATAbits.LATA7 = (state ? 1 : 0);
    if (hand_detected == 1){
        LATAbits.LATA7 == 1;
    }
    else{
        LATAbits.LATA6 == 1;
    }
}
// Allume ou éteint la DEL D7 selon si une main est détectée (1 = détectée, 0 = rien).

void delay_ms(int ms) {
    int cycles = ms * 24000;  // approximatif pour 24 MHz
    while (cycles--) {
        asm volatile("nop");
    }
}
// Crée un délai logiciel approximatif en millisecondes (utilisé pour l?antirebond).
