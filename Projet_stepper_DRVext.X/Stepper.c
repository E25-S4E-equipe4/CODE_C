
//Include C Header
#include "Stepper.h"


#define fct_mm_to_step 110  //Facteur de conversion de distance mm a nombre de pas en fonction du gear ratio
#define max_hauteur_pas 200 * fct_mm_to_step  //hauteur max en pas
#define min_hauteur_pas 0

//variable globale de position en reference a "home", en pas
volatile uint16_t position_pas = 0;

bool direction_globale = 0;


/**
 *void T2_ISR()
 * 
 * Description:
 * Interrupt service routine (ISR) du Timer 2 permettant d'ajuster la valeur de position du moteur.
 * 
 * Parametres:
 * Aucun parametre.
 * 
 * Return:
 * Aucun return.
**/

void __ISR(_TIMER_2_VECTOR, IPL2AUTO) T2_ISR(){
    
    if(!direction_globale){
        position_pas++;
    }
    else{
        position_pas--;
    }
    
    IFS0bits.T2IF = 0;
}



/**
 *void config_stepper()
 * 
 * Description:
 * Cette fonction initialise toutes les configurations
 * nécessaires au fonctionnement du moteur pas a pas.
 * 
 * Parametres:
 * Aucun parametre.
 * 
 * Return:
 * Aucun return.
**/
void config_stepper(){
    
    //(pour tests) config BTNR pour remplacer limit switch
    TRISBbits.TRISB8 = 1; // RB8 (BTNR) configured as input
    ANSELBbits.ANSB8 = 0; // RB8 (BTNR) disabled analog
    
    //Configuration des broches de sortie
    TRISCbits.TRISC1 = 0; //RPC1 en output, PMODA_2 sur Basys, sortie step
    TRISCbits.TRISC2 = 0; //RPC2 en output, PMODA_1 sur Basys, sortie direction
    TRISCbits.TRISC3 = 0; //RPC3 en output, PMODA_7 sur basys, sortie reset
    TRISCbits.TRISC4 = 0; //RPC4 en output, PMODA_3 sur Basys, sortie sleep
    
    //Configuration de broche d'entree
    //A configurer, entree de limit switch
    
    RPC1R = 0b1011; //broche RPC1 configure pour sortir le PWM de OC3, sur PMODA_2 sur Basys
    
    LATCbits.LATC1 = 0; //RPC1 initialise a 0
    LATCbits.LATC2 = 0; //RPC2 initialise a 0
    LATCbits.LATC3 = 1; //Reset a 1 (active low, donc reset disable)
    LATCbits.LATC4 = 1; //Sleep a 0 (active low, donc sleep enable)
    
    //Configuration de Timer 2
    T2CON = 0;
    T2CONbits.TCKPS = 0b111; //prescaler: N = 256
    
    TMR2 = 0; //Initialise compteur du timer a 0
    PR2 = 312; 
    // PR2 = (fPB / (N * fsignal)) - 1 = 48 000 000 / (256 * 100) - 1 = 1874
    // a 100 Hz, le moteur aura une vitesse de 0.5 tour/s (1 tour = 200 pas)
    // 600 Hz = 3 tours/s et PR2 = 312
    
    //Configuration de OC3
    OC3CON = 0; //Initialise le OC3 a 0. Configure le timer 2 comme reference
    OC3CONbits.OCM = 0b110; //Mode sans detection de faute
    
    OC3R = 0; //rapport cyclique initial
    OC3RS = 156; // PR2 * 50% de rapport cyclique
    
    
    //Configuration d'interrupt
    IPC2bits.T2IP = 2;
    IPC2bits.T2IS = 0;
    IFS0bits.T2IF = 0;
    IEC0bits.T2IE = 1;
    
    
    //Fin de la fonction
}


/**
 *void stepper_home()
 * 
 * Description:
 * Cette fonction commande au moteur de descendre jusqu'a sa position
 * la plus basse (home). Une limit switch informe le moteur de son arrivee au point home.
 * 
 * Parametres:
 * Aucun parametre.
 * 
 * Return:
 * Aucun return.
**/
void stepper_home(){
    
    LATCbits.LATC4 = 1; //Sleep mode off
    
    LATCbits.LATC2 = 1;     //Direction descendre
    
    //Demarrage du Timer 2
    T2CONbits.ON = 1;
    
    //Demarrage de OC3
    OC3CONbits.ON = 1;
        
    while(!PORTBbits.RB8);
        
    //Arret de OC3
    OC3CONbits.ON = 0;
    
    //Arret du Timer 2
    T2CONbits.ON = 0;
   
    position_pas = 0;
    
    
    LATCbits.LATC4 = 0; //Sleep mode on
    
    //Fin de la fonction
}


/**
 *void stepper_move(bool direction, uint8_t dst)
 * 
 * Description:
 * Cette fonction commande au moteur de tourner dans une direction donnee par le
 * parametre <direction>. Le parametre <dst> permet de commander la distance
 * a parcourir par le moteur.
 * 
 * Parametres:
 *      -direction: 1 -> Descend
 *                  0 -> Monte
 *      
 *      -dst:       valeur de distance a parcourir en mm. Plage de 0 a 255.
 * 
 * Return:
 * Aucun return.
**/
void stepper_move(bool direction, uint8_t dst){
    
    LATCbits.LATC4 = 1; //Sleep mode off
    
    direction_globale = direction;
    
    uint16_t nb_step = 0;
    nb_step = dst * fct_mm_to_step;
    
    uint16_t pos_initiale = position_pas;
    uint16_t pos_finale = 0;
    
    LATCbits.LATC2 = direction; //Selectionne la sortie de direction
    
    if(!direction_globale){     //Monter
        
        pos_finale = pos_initiale + nb_step;
        
        //Demarrage du Timer 2
        T2CONbits.ON = 1;
        
        //Demarrage de OC3
        OC3CONbits.ON = 1;
        
        while(position_pas < pos_finale && position_pas < max_hauteur_pas){}
        
        //Arret de OC3
        OC3CONbits.ON = 0;
        
        //Arret du Timer 2
        T2CONbits.ON = 0;
        
    }
    
    else if(direction_globale){
        
        pos_finale = pos_initiale - nb_step;
        
        //Demarrage du Timer 2
        T2CONbits.ON = 1;
        
        //Demarrage de OC3
        OC3CONbits.ON = 1;
        
        while(position_pas > pos_finale && position_pas > min_hauteur_pas){}
        
        //Arret de OC3
        OC3CONbits.ON = 0;
        
        //Arret du Timer 2
        T2CONbits.ON = 0;
        
    }
    
    
    LATCbits.LATC4 = 0; //Sleep mode on
    
    //Fin de la fonction
}


/**
 *uint8_t stepper_get_height()
 * 
 * Description:
 * Cette fonction retourne la valeur actuelle de la variable
 * globale "position" avec facteur d'ajustement pour obtenir unaleur en mm.
 * 
 * Parametres:
 * Aucun parametre.
 * 
 * Return:
 *      - position de hauteur en mm. Plage de 0 a 255.
**/
uint8_t stepper_get_height(){
    
    uint8_t position_mm;
    position_mm = position_pas / fct_mm_to_step;
    
    return position_mm;
    
 //Fin de la fonction   
}