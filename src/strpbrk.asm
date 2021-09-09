section	.text
global strpbrk
strpbrk:
;    xor rcx, rcx
;
;.loop:
;    mov al, BYTE[rdi + rcx]
;    cmp al, 0
;    je .end_ret
;    inc rcx
;
;    mov bl, BYTE[rdi + rsi]
;    cmp bl, 0
;    je .loop
;
;    cmp al, bl
;    je .end
;    inc rsi
;    jmp .loop
;
;.end_ret:
;    mov rax, 0
;    ret
;
;.end:
;    mov rax, rdi
;    add rdi, rcx
;    ret
;