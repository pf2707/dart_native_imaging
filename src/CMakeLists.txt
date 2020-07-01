cmake_minimum_required(VERSION 3.6)
project(Imaging)
cmake_policy(SET CMP0069 NEW)

add_subdirectory(libjpeg-turbo EXCLUDE_FROM_ALL)
set_property(TARGET jpeg-static PROPERTY POSITION_INDEPENDENT_CODE ON)
set_property(TARGET jpeg-static PROPERTY INTERPROCEDURAL_OPTIMIZATION True)

add_library(Imaging SHARED Blend.c BoxBlur.c Copy.c Except.c extra.c Geometry.c Palette.c Resample.c Storage.c blurhash/encode.c)
target_include_directories(Imaging PRIVATE libjpeg-turbo ${CMAKE_CURRENT_BINARY_DIR}/libjpeg-turbo)
target_link_libraries(Imaging m jpeg-static)

set_property(TARGET Imaging PROPERTY INTERPROCEDURAL_OPTIMIZATION True)
