set(LIBIBERTY_PREFER_STATIC False)

if(LIBIBERTY_PREFER_STATIC)
    set(LIBIBERTY_SEARCHORDER libiberty.a libiberty.so)
else()
    set(LIBIBERTY_SEARCHORDER libiberty.so libiberty.a)
endif()

find_library(LIBIBERTY_LIBRARY NAMES ${LIBIBERTY_SEARCHORDER})
find_path(LIBIBERTY_INCLUDE_DIR libiberty.h PATHS /usr/include /usr/include/libiberty)

if(LIBIBERTY_INCLUDE_DIR AND LIBIBERTY_LIBRARY)
    set(LIBIBERTY_FOUND TRUE)
endif()

if(LIBIBERTY_FOUND)
    if(NOT LIBIBERTY_FIND_QUIETLY)
        MESSAGE(STATUS "Found libiberty: ${LIBIBERTY_LIBRARY}")
    endif()
else()
    if(LIBIBERTY_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could not find libiberty")
    endif()
endif()
