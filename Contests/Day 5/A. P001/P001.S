;codefun submission: https://codefun.vn/submissions/2062557

SECTION .bss
    input: resb 4

SECTION .text
%define SYS_READ 0
%define SYS_WRITE 1
%define SYS_EXIT 60

%define STDIN 0
%define STDOUT 1

; Parameters:
;   string s (%rdi)
stringToInt:
    push rdi
    push rbx

iterate:
    cmp byte [rdi], 48
    jb convertToNum
    inc rdi
    jmp iterate

convertToNum:
    dec rdi
    mov rcx, 1
    mov rax, 0

iterateBack:
    cmp rdi, input
    jb doneConversion

    movzx rbx, byte [rdi]
    sub rbx, 48 ; ASCII code to digit
    
    imul rbx, rcx
    add rax, rbx

    imul rcx, 10
    dec rdi

    jmp iterateBack

doneConversion:
    pop rbx
    pop rdi

    ret

; Parameters:
;   int a (%rdi), char* buf (%rsi)
intToString:
    push rdx
    push rbx
    push rax
    push rcx

    mov rbx, 10
    mov rax, rdi
    mov rcx, 0

divideLoop:
    
    cmp rax, 0
    je writeDigitToStr

    xor rdx, rdx
    div rbx
    add rdx, 48
    push rdx
    inc rcx

    jmp divideLoop

writeDigitToStr:
    cmp rcx, 0
    jz endLoop

    pop rdx
    mov byte [rsi], dl
    inc rsi
    dec rcx

    jmp writeDigitToStr

endLoop:

    pop rcx
    pop rax
    pop rbx
    pop rdx

    ret

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
    mov rdx, 4  ; number of bytes to read
    mov rsi, input  ; reserved space to store our input (known as a buffer)
    mov rdi, STDIN
    mov rax, SYS_READ
    
    syscall

    mov rdi, rsi ; Now rdi holds the address of the first char of input
    call stringToInt ; Now rax holds the converted integer

    ; multiply rax with 2
    mov rcx, 1
    shl rax, cl

    mov rdi, rax 
    mov rsi, input
    call intToString

    mov rsi, input
    call sprint

end:    
    xor rdi, rdi ; Set exit status to 0
    mov rax, SYS_EXIT
    syscall

    

