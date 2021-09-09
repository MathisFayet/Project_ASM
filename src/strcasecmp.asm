section	.text
global strcasecmp
strcasecmp:
    xor rcx, rcx
    xor rax, rax
    jmp .loop

.error_handling:
    cmp al, 0
    je .end

    cmp bl, 0
    je .end

    inc rcx
    jmp .loop

.compare_two_string:
    cmp al, bl
    je .error_handling
    jmp .end

.compare_with_str2:
    cmp bl, "A"
    jl .compare_two_string

    cmp bl, "Z"
    jg .compare_two_string

    add bl, 32
    jmp .compare_two_string

.loop:
    mov al, BYTE [rdi + rcx]
    mov bl, BYTE [rsi + rcx]

    cmp al, "A"
    jl .compare_with_str2

    cmp bl, "Z"
    jg .compare_with_str2

    add al, 32
    jmp .compare_with_str2

.end:
    movsx rax, al
    movsx rbx, bl
    sub rax, rbx
    ret