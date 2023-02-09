#include "setup.hpp"

void setup() {
    DDRB |= (0x01 << DDB5); // set onboard led pin to output pin
}
