section .text ; code executable (sortie standard printf)
global memcpy
memcpy:
	xor rcx, rcx ; initie mon compteur √† 0

.loop:
	cmp rcx, rdx ; compare si mon argument == i
	je .end ; si c'est vrai go to end sinon on continue

	mov al, BYTE [rsi+rcx] ; moove mon argument2 (byte) dans mon tmp
	mov BYTE [rdi+rcx], al ; moove mon tmp dans mon argument1 (byte)
	inc rcx ; incremente mon compteur

	jmp .loop ; systeme de recursivit√© jmp √† ma boucle

.end:
	mov rax, rdi ; mov rdi dans rax
	ret ; return rdi (mon tableau)