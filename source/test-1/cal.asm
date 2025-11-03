global somme
global pgcd
section .text


somme:
    MOV rax,rdi
    add rax,rsi
    ret



pgcd:
    cmp rdi,rsi
    je pgcd.entre_egal
.etape1:
    cmp rdi,rsi
    jg pgcd.etape1b
    xor rdx, rdx; 
    mov rax, rsi
    div rdi
    mov rsi,rdx
    cmp rdx,0
    jne pgcd.etape1
    mov rax, rdi
    ret


.etape1b:
    xor rdx, rdx; 
    mov rax, rdi
    div rsi 
    mov rdi,rdx
    cmp rdx,0
    jne pgcd.etape1
    mov rax, rsi
    ret


.entre_egal:
    mov rax,rdi
    ret
