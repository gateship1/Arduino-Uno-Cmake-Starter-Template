add_library(arduino_${PROJECT_NAME} STATIC)

target_sources(arduino_${PROJECT_NAME}
    PRIVATE Application.cpp
)

target_include_directories(arduino_${PROJECT_NAME}
    PUBLIC ${CMAKE_CURRENT_LIST_DIR}
)

set_target_properties(arduino_${PROJECT_NAME}
    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
    LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib"
)
