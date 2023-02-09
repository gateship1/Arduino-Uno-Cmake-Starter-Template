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
    
    # Transform binary into hex file, this is the eeprom part (empty if you don't use eeprom static variables)
    add_custom_target(eeprom avr-objcopy -j .eeprom --set-section-flags=.eeprom="alloc,load" --change-section-lma .eeprom=0 -O ihex ${ARGS_TARGET}.elf ${ARGS_TARGET}.eep DEPENDS strip)

endfunction(build_arduino_exe)
