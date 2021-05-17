SECTION .data
    newline db 0xa 

SECTION .bss
    input: resb 10000

SECTION .text
%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_EXIT 60

%define STDIN 0
%define STDOUT 1

; void fprint(String message (%rsi), int len (%rdx))
; String printing function
fprint:

    push    rdi
    push    rax
 
    mov     rdi, STDOUT
    mov     rax, SYS_WRITE
    syscall

    pop     rax
    pop     rdi

    ret

global  _start

_start:

    ; Read input
    mov rdx, 10000  ; number of bytes to read
    mov rsi, input  ; reserved space to store our input (known as a buffer)
    mov rdi, STDIN
    mov rax, SYS_READ
    
    syscall

printForward:
    mov rax, input
    mov rbx, 1

nextchar:
    cmp     byte [rax], 0
    jz      printBackward
    
    mov rsi, input
    mov rdx, rbx
    call fprint

    mov rsi, newline
    mov rdx, 1
    call fprint

    inc     rax
    inc     rbx
    jmp     nextchar

printBackward:
    mov rax, input
    dec rbx

iterateChar:
    cmp     rbx, 0
    jz      end
    
    mov rsi, input
    mov rdx, rbx
    call fprint

    mov rsi, newline
    mov rdx, 1
    call fprint

    dec     rax
    dec     rbx
    jmp     iterateChar


end:    
    xor rdi, rdi ; Set exit status to 0
    mov rax, SYS_EXIT
    syscall