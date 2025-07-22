#include "detect_voix.h"
#include <math.h>
#include <stdint.h>
#include <stdbool.h>
#include <string.h>
#include <stdio.h>

#define PROFO_FILTRE 25
#define SEUIL_BRUIT 3500
#define DEADZONE 6
#define TRIGGER 500

#define FREQUENCE_PRINC_1 5405
#define FREQUENCE_PRINC_1_TOL 350
#define FREQUENCE_SECON_1 6000
#define FREQUENCE_SECON_1_TOL 1500

typedef struct {
    int principaux[PROFO_FILTRE];
    int secondaires[PROFO_FILTRE];
    int amplitude[PROFO_FILTRE];
    int last_detect_index;
} MemoireDetection;

static void shift_right(int *array) {
    for (int i = PROFO_FILTRE - 1; i > 0; i--) {
        array[i] = array[i - 1];
    }
}

bool detect_position(int *fft_buffer_1024) {
    static MemoireDetection memoire;

    int spectrum[512];
    int delta_f = 16000.0f / 1024.0f; // fe = 16 kHz typique

    int max_val = 0;
    int max_idx1 = 0;
    int max_idx2 = 0;

    for (int i = 1; i < 512; i++) {
        spectrum[i] = fabsf(fft_buffer_1024[i]);
        if (spectrum[i] > max_val) {
            max_val = spectrum[i];
            max_idx2 = max_idx1;
            max_idx1 = i;
        }
    }

    int freq1 = max_idx1 * delta_f;
    int freq2 = max_idx2 * delta_f;

    shift_right(memoire.principaux);
    memoire.principaux[0] = (max_val > TRIGGER && freq1 > 250) ? freq1 : 0;

    shift_right(memoire.secondaires);
    memoire.secondaires[0] = (max_val > TRIGGER && freq2 > 250) ? freq2 : 0;

    shift_right(memoire.amplitude);
    memoire.amplitude[0] = max_val;

    int detect_princ_1 = 0;
    int detect_secon_1 = 0;

    for (int j = 0; j < PROFO_FILTRE; j++) {
        if (memoire.principaux[j] > (FREQUENCE_PRINC_1 - FREQUENCE_PRINC_1_TOL) &&
            memoire.principaux[j] < (FREQUENCE_PRINC_1 + FREQUENCE_PRINC_1_TOL)) {
            detect_princ_1 = 1;
        }
        if (memoire.secondaires[j] > (FREQUENCE_SECON_1 - FREQUENCE_SECON_1_TOL) &&
            memoire.secondaires[j] < (FREQUENCE_SECON_1 + FREQUENCE_SECON_1_TOL)) {
            detect_secon_1 = 1;
        }
    }

    int max_debut = 0;
    int max_fin = 0;
    for (int j = 0; j < PROFO_FILTRE / 4; j++) {
        if (memoire.amplitude[j] > max_debut) max_debut = memoire.amplitude[j];
        if (memoire.amplitude[PROFO_FILTRE - 1 - j] > max_fin) max_fin = memoire.amplitude[PROFO_FILTRE - 1 - j];
    }

    if (max_debut < SEUIL_BRUIT && max_fin < SEUIL_BRUIT) {
        if (detect_secon_1 && detect_princ_1) {
            if (memoire.last_detect_index < -DEADZONE || 1) {
                memoire.last_detect_index = 0;
                return true;
            }
        }
    }
    return false;
}
