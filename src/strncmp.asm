section .text
global strncmp
strncmp:
    xor rcx, rcx; creer mon compteur à 0

.loop:
    cmp rdx, rcx
    je .end

    mov al, BYTE[rdi + rcx] ; move mon tmp à mon argument1
    mov bl, BYTE[rsi + rcx] ; move mon tmp à mon argument2

    cmp al, 0 ; compare si ma string est à '\0'
    je .end ; si oui go to end

    cmp bl, 0 ; compare si ma string est a '\0'
    je .end ; si oui go to end

    cmp al, bl ; compare mon argument1 à mon argument2
    jne .end ; go to end;1 - Base functions / 05 - strcmp

    inc rcx ; increment mon compteur
    jmp .loop ; go to loop;

.end:
    movsx rax, al ; met mon char al dans ma valeur de return
    movsx rbx, bl ; met mon char bl dans ma valeur de return
    sub rax, rbx ; rax = rax - rbx (pour recuperer la valeur de rbx)
    ret ; return rax