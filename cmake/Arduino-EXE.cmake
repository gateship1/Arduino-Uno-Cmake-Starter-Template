function(build_arduino_exe)

    set(prefix ARGS)
    set(single_value_args TARGET)
    cmake_parse_arguments(
        PARSE_ARGV 0 ${prefix}
        "" "${single_value_args}" ""
    )

    # Strip binary for upload
    add_custom_target(strip ALL avr-strip ${ARGS_TARGET}.elf DEPENDS ${ARGS_TARGET})
    
    # Transform binary into hex file, we ignore the eeprom segments in the step
    add_custom_target(hex ALL avr-objcopy -R .eeprom -O ihex ${ARGS_TARGET}.elf ${ARGS_TARGET}.hex DEPENDS strip)

    add_custom_target(flash)
    add_custom_command(
        TARGET flash
        POST_BUILD
        COMMAND avrdude -F -V -p atmega328p -c arduino -P /dev/ttyACM0 -b 115200 -D -U flash:w:$${CMAKE_CURRENT_BINARY_DIR}/${ARGS_TARGET}.hex
        WORKING_DIRECTORY
        DEPENDS hex
    )

    # Transform binary into hex file, this is the eeprom part (empty if you don't use eeprom static variables)
    add_custom_target(eeprom avr-objcopy -j .eeprom --set-section-flags=.eeprom="alloc,load" --change-section-lma .eeprom=0 -O ihex ${ARGS_TARGET}.elf ${ARGS_TARGET}.eep DEPENDS strip)

    # Upload the firmware with avrdude
    #avrispmkII is the programmer type (see manual)
    #atmega328p is the mcu


   

    # Upload the eeprom with avrdude
    add_custom_target(upload_eeprom avrdude -c avrispmkII -p atmega328p -U eeprom:w:${ARGS_TARGET}.eep DEPENDS eeprom)

    # Clean extra files
    set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES "${ARGS_TARGET}.hex;${ARGS_TARGET}.eeprom;$${ARGS_TARGET}.lst")


endfunction(build_arduino_exe)
