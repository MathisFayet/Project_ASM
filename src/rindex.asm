section .text
global rindex
rindex:
	xor rcx, rcx

.loop:
	inc rcx
	cmp [rdi + rcx], sil

	mov rax, rdi
	add rax, rcx
    jmp .end

	cmp rcx, 0
	dec rcx
	jmp .loop

.end:
	mov rax, rdi
	add rax, rcx
	ret