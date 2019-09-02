cmake_minimum_required(VERSION 3.0)

project(Chat)

if(EXISTS ${CMAKE_CURRENT_BINARY_DIR}/conanbuildinfo_multi.cmake)
    include(${CMAKE_CURRENT_BINARY_DIR}/conanbuildinfo_multi.cmake)
else()
    include(${CMAKE_CURRENT_BINARY_DIR}/conanbuildinfo.cmake)
endif()

conan_basic_setup(NO_OUTPUT_DIRS)

add_library(chat ${CMAKE_CURRENT_SOURCE_DIR}/src/chat.cpp)
target_include_directories(chat PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
conan_target_link_libraries(chat)

add_executable(app ${CMAKE_CURRENT_SOURCE_DIR}/src/app.cpp)
target_link_libraries(app PRIVATE chat)
