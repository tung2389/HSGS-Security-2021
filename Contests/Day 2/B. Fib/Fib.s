mov rcx, rdi 
cmp rcx, 2
jbe .INITVAL

mov rsi, 1
mov rdi, 1
sub rcx, 2 

jmp .FOR

.INITVAL:
    mov rax, 1
    jmp .END

.FOR:
    cmp rcx, 0
    jbe .ASSIGN

    mov rdx, rdi
    add rdi, rsi
    mov rsi, rdx

    sub rcx, 1
    jmp .FOR

.ASSIGN:
    mov rax, rdi
    jmp .END

.END:
    hlt