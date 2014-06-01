cmake_minimum_required (VERSION 2.8)
project (libhsdis)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})
include(TargetArch)
target_architecture(target_arch)

if("${target_arch}" STREQUAL "x86_64")
    set(ARCH_FLAG " -DLIBARCH_amd64")
elseif("${target_arch}" STREQUAL "i386")
    set(ARCH_FLAG " -DLIBARCH_i386")
else()
    message(SEND_ERROR "System architecture not recognized")
    message("TargetArch returned : ")
    message("${target_arch}")
endif()


find_package(BFD REQUIRED)
find_package(OPCODES REQUIRED)

add_library(hsdis SHARED hsdis.c)
set_target_properties(hsdis PROPERTIES COMPILE_FLAGS "-Wall -Werror -Wpendantic -fPIC -std=c99")
set_target_properties(hsdis PROPERTIES COMPILE_FLAGS ${ARCH_FLAG})
set_target_properties(hsdis PROPERTIES LINK_FLAGS "-fPIC")

target_link_libraries(hsdis ${BFD_LIBRARY} ${OPCODES_LIBRARY} )

