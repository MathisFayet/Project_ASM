section .text ; code executable (sortie standard printf)
global strcspn
strcspn:
	xor	rcx, rcx ; met mon premier compteur a 0
	xor	rax, rax ; met mon deuxieme compteur a 0

.check_other_loop:
	mov rax, 0 ; re initialise mon compteur a 0
	inc	rcx ; incrementation de mon premier index
	jmp .loop ; on jump dans loop

.loop1:
	mov	al, BYTE [rdi + rax] ; initie donc al à s1[]
	mov	bl, BYTE [rsi + rcx] ;initie donc bl à s2[]
	cmp	al, bl ; compare str[i] avec mon str[i2]
	je .end ; si validé alors on go to end

	cmp	al, 0 ; on compare mon al à '\0'
	je .check_other_loop ; si c'est == alors on va dans check_other_loop

    inc rax ; on incremente mon deuxieme argument
	jmp	.loop1 ; ici systeme de recursivité on remonte en haut

.loop:
	cmp	BYTE [rdi + rcx], 0 ; compare str[i] est egale à '\0'
	je .end ; si c'est == donc go to end
	jmp	.loop1 ; on jump alors dans loop1

.end:
    mov rax, 0 ; on remet notre compteur a 0
	mov rax, rcx ; pour pouvoir mettre rcx à rax
	ret ; donc ici on return rax