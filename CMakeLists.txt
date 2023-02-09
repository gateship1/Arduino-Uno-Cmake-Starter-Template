cmake_minimum_required(VERSION 3.20)

project(leds
    LANGUAGES CXX
)

include(cmake/Arduino-EXE.cmake)

add_subdirectory(src)

add_executable(${PROJECT_NAME} src/main.cpp)

target_link_libraries(${PROJECT_NAME}
    PUBLIC arduino_${PROJECT_NAME}
)

set_target_properties(${PROJECT_NAME}
    PROPERTIES
    OUTPUT_NAME ${PROJECT_NAME}.elf # Rename the output to .elf
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}" # place .elf in the "build" directory
)

build_arduino_exe(TARGET ${PROJECT_NAME})
