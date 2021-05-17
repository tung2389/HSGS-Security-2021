SECTION .data
    space db 0x20 

SECTION .bss
    input: resb 100

SECTION .text
%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_EXIT 60

%define STDIN 0
%define STDOUT 1

;------------------------------------------
; int slen(char * s (%rax))
; String length calculation function
slen:
    push    rbx
    mov     rbx, rax
 
nextchar:
    cmp     byte [rax], 0
    jz      finished
    inc     rax
    jmp     nextchar
 
finished:
    sub     rax, rbx
    pop     rbx
    
    ret

;------------------------------------------
; void sprint(char *buf (%rsi))
; String printing function
sprint:
    push    rdx
    push    rax
    push    rdi
    
    mov     rax, rsi
    call    slen
    mov     rdx, rax
 
    mov     rdi, STDOUT
    mov     rax, SYS_WRITE
    syscall
    
    pop     rdi
    pop     rax
    pop     rdx 

    ret

global  _start
 
_start:

    ; Read input
    mov rdx, 100    ; number of bytes to read
    mov rsi, input  ; reserved space to store our input (known as a buffer)
    mov rdi, STDIN
    mov rax, SYS_READ
    
    syscall

    mov rsi, input
    call sprint

    mov rsi, space
    call sprint
    
    mov rsi, input
    call sprint

end:    
    xor rdi, rdi ; Set exit status to 0
    mov rax, SYS_EXIT
    syscall


