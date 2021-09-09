section	.text ; code executable (sortie standard printf)
global memset
memset:
    xor rcx, rcx ; initier mon counter a 0

.loop:
    cmp rcx, rdx
    je .end ; si c'est egale go to end sinon on continue

    mov BYTE[rdi + rcx], sil ; mon premier = a mon deuxieme (arg1 == arg2)
    inc rcx ; incrementer mon rcx
    jmp .loop ; systeme de recursivité jump a ma boucle

.end:
    mov rax, rdi ; mov rdi dans rax
    ret ; return rdi