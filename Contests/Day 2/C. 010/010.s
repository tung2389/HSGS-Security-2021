mov rbx, rsi
add rsi, rdi

mov rdx, 1
mov rax, 0

.FOR:
    cmp rsi, rdi
    jbe .END
    sub rsi, 1
    mov rcx, rsi
    shl rdx, cl
    add rax, rdx
    mov rdx, 1
    jmp .FOR

.END:
    hlt