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
    mov r14,rax;div a
    xor rdx,rdx
    div rcx;div a/ pgcd
    pop r9;quo a
    mov r13,rax;div a/ pgcd
    mul r9;
    add r11,rdx;poid fort du quo
    add r12,rax;poid faible du quo
    jnc add_fact.suite
    add r11,1
.suite:
    mov rax,r14
    mul r13
    add r13,rdx;poid fort du div
    add r14,rax;poid faible du div
    ;todo pgcd du quo et div 128 bit
    cmp r13,0
    jne add_fact.pgcd128
    cmp r11,0
    jne add_fact.pgcd128
    push2p r14:r12
    mov rdi,r14
    mov rsi,r12
    call pgcd
    mov r13,rax
    pop2p rax:r12
    div r13
    



.pgcd128:

    









