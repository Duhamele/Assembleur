global somme
global pgcd
section .text


somme:
    MOV rax,rdi
    add rax,rsi
    ret



pgcd:
    cmp rdi,0
    je pgcd.retour0
    cmp rsi, 0
    je pgcd.retour0


.etape1:
    cmp rdi,rsi
    jg pgcd.etape1b
    xor rdx, rdx; ;cas rsi>rdi
    mov rax, rsi
    div rdi ;rsi%rdi
    mov rsi,rdx
    cmp rdx,0
    jne pgcd.etape1
    mov rax, rdi
    ret


.etape1b:;cas où rdi>rsi
    xor rdx, rdx; 
    mov rax, rdi
    div rsi ;rdi%rsi
    mov rdi,rdx
    cmp rdx,0
    jne pgcd.etape1
    mov rax, rsi
    ret
.retour0:
    mov rax,0
    ret



section .note.GNU-stack noalloc noexec nowrite progbits

section .text

add_fact:
    push rdi;quotion a
    push rsi;div a
    push rdx;quo b
    push rcx;div b
    mov rdi, rcx
    call pgcd;
    mov rcx,rax; sauvegarde pgcd dans rcx
    pop rax;div b
    xor rdx,rdx
    div rcx; divb /pgcd
    pop r9;quo b
    mul r9
    mov r12,rax;poid faible
    mov r11,rdx; poids fort
    pop rax;div a
    xor rdx,rdx
    div rcx
    pop r9;quo a
    mul r9;
    add r11,rdx
    add r12,rax
    jnc add_fact.suite
    add r11,1
.suite:
    









