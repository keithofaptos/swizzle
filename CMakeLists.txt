cmake_minimum_required(VERSION 3.10.0)

project(swizzle)
add_definitions(-O2)

file(GLOB_RECURSE SOURCE *.m)
add_library(swizzle SHARED ${SOURCE})
target_link_libraries(swizzle "-framework AppKit")
