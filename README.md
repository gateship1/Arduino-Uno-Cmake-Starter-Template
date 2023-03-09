# Arduino Uno CMake Template Project

This repo serves as a starter template for building Arduino Uno projects. This project is a "bare metal" project in that it manipulates the ATmega328p microcontroller registers directly, without leveraging the Arduino SDK.

For reference, the ATmega328p microcontroller datasheet can be found [here](https://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7810-Automotive-Microcontrollers-ATmega328P_Datasheet.pdf).

#
## Table of Contents

* [Prerequisites](#prerequisites)
* [General Directory Structure](#general-directory-structure)
* [Build Instructions](#build-instructions)
* [Example of Transferring Executable to Arduiono UNO](#example-of-transferring-executable-to-arduiono-uno)

<br>

#
## Prerequisites

1. [AVR-C++](https://gcc.gnu.org/wiki/avr-gcc) compiler
    
    <details>
    <summary>Install command</summary>
    
    - Debian / Ubuntu:
        
            sudo apt-get install avr-libc avrdude binutils-avr gcc-avr gdb-avr
    
    - MacOS:
        
            ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
            brew tap osx-cross/avr
            brew install avr-libc
            brew install avrdude --with-usb
    <br>
<br>

2. [CMake 3.20+](https://cmake.org/)

    <details>
    <summary>Install Command</summary>
    
    - Debian / Ubuntu:
        
            sudo apt-get install cmake
    
    - MacOS:
        
            brew install cmake

    <summary>Alternatively, Download</summary>
    
    - download and install from [source](https://cmake.org/download/)
    </details>
    <br>
    

2. [Ninja](https://ninja-build.org/)

    <details>
    <summary>Install Command</summary>
    
    - Debian / Ubuntu:
        
            sudo wget -qO /usr/local/bin/ninja.gz https://github.com/ninja-build/ninja/releases/latest/download/ninja-linux.zip
            sudo gunzip /usr/local/bin/ninja.gz
            sudo chmod a+x /usr/local/bin/ninja
            ninja --version
    
    - MacOS:
        
            brew install ninja

    <summary>
    </details>

\[[toc](#table-of-contents)\]

#
## General Directory Structure

```console
Arduino-Uno-Cmake-Starter-Template
├── cmake
│   ├── Arduino-EXE.cmake
│   └── Arduino-toolchain.cmake
├── src
│   └── CMakeLists.txt
├── .gitignore
├── CMakeLists.txt
├── CMakePresets.json
└── README.md
```

To review each directory and file provided in the directory structure in detail, review the following Details.

<details>

### `Arduino-Uno-Cmake-Starter-Template` directory (parent directory)

This is the parent directory for the project.

In addition to the directories described below, the `Arduino-Uno-Cmake-Starter-Template` directory contains a `.gitignore` file, the main (driver) `CMakeLists.txt` file, a `CMakePresets.json` file (which contains the path to the Arduiono toolchain, compiler settings, build presets, etc.), and a `README.md` file that contains build instructions (i.e. **this** file).

<br>

### `cmake` directory

The `cmake` directory contains the [CMake](https://cmake.org/) Arduino toolchain file and include file to convert the project binary to format suitable for use on the ATmega328p microcontroller.

<br>


### `src` directory

The `src` directory is where all of the project source code is provided:
* *.hpp for C++ header files
* *.cpp for C++ source files

The `src` directory contains a `CMakeLists.txt` file which handles compiling and linking the source code.


<br>


</details>

\[[toc](#table-of-contents)\]

#
#
## Build Instructions

- <summary>Debian / Ubuntu / MacOS:</summary> <details>

    Open a terminal and navigate to the `Arduino-Uno-Cmake-Starter-Template` directory (referred to in the following as the parent directory).

    From the parent directory:
        
        cmake --preset=<preset>

    where \<preset\> is one of the configuration presets listed by the command

        cmake --list-presets
    
    for example,

        cmake --preset=arduino-uno-examples

    Upon generating the preset configuration, an `out` directory will be created which will hold the `build` and `install` subdirectories for the configutation.
    Navigate into the `out/build/<config>` directory.
    This directory will now contain a `build.ninja` file.
    
    Build the code with:
        
        ninja

</details>

<br>

</details>

\[[toc](#table-of-contents)\]

#

#
## Example of Transferring Executable to Arduiono UNO

- Debian / Ubuntu:
    
        sudo avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:leds.hex

\[[toc](#table-of-contents)\]

#
