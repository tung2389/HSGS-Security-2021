; Question: Print 100 lines "Chau Bac Ho"
 
section .text
%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_EXIT 60

global  _start
 
_start:
    mov rbx, 100

iterate:
    cmp rbx, 0
    je end

    ; Print output
    mov rdi, 1
    mov rsi, output
    mov rdx, output.end - output
    mov rax, SYS_WRITE
    syscall

    sub rbx, 1

    jmp iterate

end:    
    xor rdi, rdi ; Set exit status to 0
    mov rax, SYS_EXIT
    syscall

section .data
    output: 
        db "Chau Bac Ho", 0xa
    .end: