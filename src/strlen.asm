section	.text ; code executable (sortie standard printf)
global strlen
strlen:
    xor rax, rax ; initier la valeur de return a 0
    jmp .loop ; go to boucle

.loop:
    cmp BYTE[rdi + rax], 0x0 ; comparer donc une byte de la string avec 0
    je .end ; si c'est egale go to end sinon on continue
    inc rax ; incrementer mon return pour avoir la taille
    jmp .loop ; rappel de ma boucle pour recursivité

.end:
    ret ; return ma valeur de rax