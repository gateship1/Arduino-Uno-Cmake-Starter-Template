set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR avr)
set(CMAKE_CROSSCOMPILING TRUE)

option(WITH_MCU "Add the mCU type to the target file name." ON)

# toolchain extension of OS
IF(WIN32)
    SET(TOOLCHAIN_EXT ".exe")
ELSE()
    SET(TOOLCHAIN_EXT "")
ENDIF()

# compiler prefix
SET(COMPILER_PREFIX "avr-")

find_program(AVR_CC "${COMPILER_PREFIX}gcc${TOOLCHAIN_EXT}" REQUIRED)
MESSAGE(STATUS "C COMPILER_ON_PATH: " ${AVR_CC})
find_program(AVR_CXX "${COMPILER_PREFIX}g++${TOOLCHAIN_EXT}" REQUIRED)
MESSAGE(STATUS "C++ COMPILER_ON_PATH: " ${AVR_CXX})

get_filename_component(AVR_TOOLCHAIN_DIR ${AVR_CXX} DIRECTORY)
find_program(AVR_OBJCOPY "${COMPILER_PREFIX}objcopy${TOOLCHAIN_EXT}" REQUIRED)
find_program(AVR_SIZE_TOOL "${COMPILER_PREFIX}size${TOOLCHAIN_EXT}" REQUIRED)
find_program(AVR_OBJDUMP "${COMPILER_PREFIX}objdump${TOOLCHAIN_EXT}" REQUIRED)

set(BINUTILS_PATH ${AVR_TOOLCHAIN_DIR}) 
set(TOOLCHAIN_PREFIX ${AVR_TOOLCHAIN_DIR}/${COMPILER_PREFIX})

set(CMAKE_C_COMPILER ${AVR_CC})
set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER})
set(CMAKE_CXX_COMPILER ${AVR_CXX})

set(CMAKE_FIND_ROOT_PATH ${BINUTILS_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
