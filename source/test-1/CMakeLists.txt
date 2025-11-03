add_executable(programme-1 main.c cal.asm)
add_executable(programme-1b test-pgcd.c cal.asm)



add_custom_target(run-programme-1
    COMMAND programme-1 
    COMMAND programme-1b     # lance le programme
    DEPENDS programme-1 programme-1b    # construit d'abord programme-1 si nécessaire
    WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}  # dossier de travail
)