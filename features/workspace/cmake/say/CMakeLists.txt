cmake_minimum_required(VERSION 3.0)

project(Say)

if(EXISTS ${CMAKE_CURRENT_BINARY_DIR}/conanbuildinfo_multi.cmake)
    include(${CMAKE_CURRENT_BINARY_DIR}/conanbuildinfo_multi.cmake)
else()
    include(${CMAKE_CURRENT_BINARY_DIR}/conanbuildinfo.cmake)
endif()

conan_basic_setup(NO_OUTPUT_DIRS)

add_library(say src/say.cpp)
target_include_directories(say PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
