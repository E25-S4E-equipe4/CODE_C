/*
#include <xc.h>
#include <sys/attribs.h>

#include "config.h"
#include "config_bits.h"

#include "Stepper.h"
#include "Config_Tests_DRV_stepper.h"


void main(){
    
    config_stepper();
    config_UART4();
    config_BTN();
    config_DEL();
    
    macro_enable_interrupts();
    
    while(1){
    
        MEF_test_DRV_stepper();
    
    }
        
    
}
 * */