cmake_minimum_required(VERSION 3.20)
project(AsmProject ASM C)
enable_language(ASM_NASM)
set(CMAKE_ASM_NASM_COMPILER nasm)
set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64) 


add_subdirectory(source)