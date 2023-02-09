#include "loop.hpp"

void loop() {

    while(true) {
        PORTB |= (0x01 << PORTB5); // turn onboard led on
        _delay_ms(5000);
        PORTB &= ~(0x01 << PORTB5); // turn onboard led off
        _delay_ms(2500);
    }

}
