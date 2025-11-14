global somme
global pgcd
global add_fact
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
    ; save non-volatile registers we will use (r12-r15, rbx)
    ; sauvegarde de la mémoire non volatile 
    push r12
    push r13
    push r14
    push r15
    push rbx
    


    ;mis des valeur dans des registtre 
    mov r12, rdi    ; r12 <- a.quotien
    mov rbx, rsi    ; rbx <- a.div
    mov r14, rdx    ; r14 <- b.quotien
    mov r15, rcx    ; r15 <- b.div


    ; mis en argument
    mov rdi, rbx    ; arg1 = a.d
    mov rsi, r15    ; arg2 = b.d

    ; appel de la fonction pgcd
    sub rsp,8
    call pgcd
    add rsp,8

    ; calcul a.div/pgcd
    mov rdi,rax;pgcd ->rdi
    mov rax,rbx 
    xor rdx,rdx
    div rdi
    ; calcul quo b
    mul r14
    mov r14,rax;pois faible quo
    mov r13,rdx;pois fort quo
    ; r15->b.div
    ; r14->poids faible de quo final
    ; r13->poids fort de quo final
    ; r12->a.quo
    ; rbx->a.div
    ; rdi->pgcd

    ; calcul b.div/pgcd
    mov rax,r15
    xor rdx,rdx
    div rdi
    ; cal du sd quo
    mov r11,rax;
    mul rbx
    mov rbx,rax; rbx<-poids faible de div 
    mov r15,rdx; r15<-poids fort de div
    mov rax,r11
    mul r12
    add r13,rdx
    add r14,rax
    ;todo verifie que rbx==r13==0
    mov rdi,rbx
    mov rsi,r14
    call pgcd
    cmp rax,1
    je add_fact.fin1
    mov r8,rax
    xor rdx,rdx
    mov rax,rbx
    div r8
    mov rbx,rax
    xor rdx,rdx
    mov rax,r14
    div r8
    mov rdx,rbx
    jmp add_fact.retour







.fin1:
    mov rax,r14
    mov rdx,rbx
    jmp add_fact.retour








.retour:
    pop rbx
    pop r15
    pop r14
    pop r13
    pop r12
    ret
