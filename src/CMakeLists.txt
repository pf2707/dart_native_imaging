cmake_minimum_required(VERSION 3.6)
project(Imaging)
cmake_policy(SET CMP0069 NEW)

add_library(Imaging SHARED Blend.c BoxBlur.c Copy.c Except.c extra.c Geometry.c Palette.c Resample.c Storage.c blurhash/encode.c)
target_link_libraries(Imaging m jpeg)

set_property(TARGET Imaging PROPERTY INTERPROCEDURAL_OPTIMIZATION True)
