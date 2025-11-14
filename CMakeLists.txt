cmake_minimum_required(VERSION 3.20)
project(AsmProject ASM C)
enable_language(ASM_NASM)
set(CMAKE_ASM_NASM_COMPILER nasm)
set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64) 

set(CMAKE_C_FLAGS "-g -O0")      # flags debug
set(CMAKE_ASM_NASM_FLAGS "-g -F dwarf")  # debug NASM
add_subdirectory(source)