section .text
%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_EXIT 60
global _start
_start:
    mov rdi, 1            ; fd
    mov rsi, s            ; buf
    mov rdx, s.end - s    ; length
    mov rax, SYS_WRITE
    syscall
    xor rdi, rdi        ; status
    mov rax, SYS_EXIT
    syscall
    hlt

section .data
a:
    db 0 ; 1 byte
b:
    dq 1337 ; 8 byte
s:
    dd "Hello World", 0xa
.end:
