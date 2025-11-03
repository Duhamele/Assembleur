add_executable(programme-1 main.c cal.asm)



add_custom_target(run-programme-1
    COMMAND programme-1      # lance le programme
    DEPENDS programme-1      # construit d'abord programme-1 si nécessaire
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}  # dossier de travail
)