cmake_minimum_required(VERSION 3.0)

set(CMAKE_VERBOSE_MAKEFILE ON)

project(getopt LANGUAGES C)
add_definitions(-DEXPORTS_GETOPT)
add_library(getopt SHARED getopt.h getopt.c)
 
install(TARGETS getopt
    RUNTIME DESTINATION "bin"
    ARCHIVE DESTINATION "lib"
    LIBRARY DESTINATION "lib"
    )
install(FILES getopt.h DESTINATION include)
