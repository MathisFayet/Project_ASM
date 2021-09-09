section	.text ; code executable (sortie standard printf)
global strchr
strchr:
	xor rax, rax ; initier ma valeur de return a 0

.loop:
	cmp	BYTE [rdi], sil ; compare un byte de la sting avec le deuxieme argument int
	je	.end ; si c'est egale go to end sinon on continue

	cmp BYTE [rdi], 0x0 ; gestion d'erreur si on contient pas alors
	je	.end_error ; go to end_error

	inc rdi ; on incremente simplement rdi
	jmp	.loop ; donc systeme de recursivité on jump en haut de la boucle

.end_error:
	mov rax, 0x0 ; on met donc la valeur de return a 0 (null)
	ret ; on return ici rax

.end:
	mov rax, rdi ; on mov rdi dans rax pour recuperer les valeurs
    ret ; on return ici rdi