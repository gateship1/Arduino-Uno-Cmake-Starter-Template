#ifndef _APPLICATION_H_
#define _APPLICATION_H_

#include <avr/io.h>
#include <avr/interrupt.h>

class Application {

public:

    Application() = default;
    ~Application() = default;
    Application(const Application&) = delete;
    Application(Application&&) = delete;
    inline void init();
    inline void run();

private:

    const uint16_t t1Comp { 31'250 }; //

    void initLEDs();
    void initTimer1();

};


void Application::init() {

    initLEDs();
    initTimer1();
    sei(); // enable global interupts

}


void Application::run() {

    while (true);

}

#endif /* _APPLICATION_H_ */
