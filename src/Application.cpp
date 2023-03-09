#include "Application.h"

const uint16_t resetValue { 0x00 };

void Application::initLEDs() {

    DDRB |= (0x01 << DDB5); // set onboard led pin to output pin
    DDRD |= (0x01 << DDB7); // set digital pin 7 to output pin
    PORTD |= (0x01 << PORTD7); // pull pin 7 up

}


void Application::initTimer1() {

    TCCR1A = 0x00;  // reset Timer 1 Control Register A
    TCCR1B |= (0x01 << CS12); // set prescaler to 1024
    TCCR1B &= ~(0x01 << CS11);
    TCCR1B |= (0x01 << CS10);
    TCNT1 = resetValue; // load timer 1 with resetValue
    OCR1A = t1Comp; // set timer 1 compare value
    TIMSK1 |= (0x01 << OCIE1A); // enable timer 1 compare interupt

}


ISR(TIMER1_COMPA_vect) {

    TCNT1 = resetValue; // reset timer to resetValue
    PORTB ^= (0x01 << PORTB5); // turn onboard led on
    PORTD ^= (0x01 << PORTD7); // toggle pin 7 down

}
