cmake_minimum_required (VERSION 2.8)
project (libhsdis)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake ${CMAKE_MODULE_PATH})
include(TargetArch)
target_architecture(target_arch)

if("${target_arch}" STREQUAL "x86_64")
    set(ARCH_FLAG " -DLIBARCH_amd64")
    set(target_name "hsdis-amd64")
elseif("${target_arch}" STREQUAL "i386")
    set(ARCH_FLAG " -DLIBARCH_i386")
    set(target_name "hsdis-i386")
else()
    message(SEND_ERROR "System architecture not recognized")
    message("TargetArch returned : ")
    message("${target_arch}")
endif()


find_package(BFD REQUIRED)
find_package(OPCODES REQUIRED)

add_library(${target_name} SHARED hsdis.c)
set_target_properties(${target_name} PROPERTIES COMPILE_FLAGS "-Wall -Werror -Wpendantic -fPIC -std=c99")
set_target_properties(${target_name} PROPERTIES COMPILE_FLAGS ${ARCH_FLAG})
set_target_properties(${target_name} PROPERTIES PREFIX "")
set_target_properties(${target_name} PROPERTIES LINK_FLAGS "-fPIC")

target_link_libraries(${target_name} ${BFD_LIBRARY} ${OPCODES_LIBRARY} )

