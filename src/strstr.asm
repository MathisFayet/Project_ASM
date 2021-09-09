section	.text

global strstr

strstr:
    xor rcx, rcx ; initier mon compteur a 0
    xor rax, rax ; intier ma valeur de return a 0

.loop:
    mov al, BYTE [rdi + rcx] ; mon tmp = argument1
    mov bl, BYTE [rsi + rcx] ; mon tmp = argument2
    cmp al, bl ; donc compare mon argument1 à mon argument2
    je .end ; si c'est egale go to end

    cmp bl, 0 ; compare argument2 si == '\0'
    je .end ; si oui go to end

    cmp al, 0 ; compare argument1 si == '\0'
    je .end ; si oui go to end

    inc rcx ; incremente mon compteur
    je .loop ; systeme de recursivité jump en haut de ma boucle

.end:
    mov rax, rdi ; mov argument1 à ma valeur de return
    add rdi, rax ; 
    ret