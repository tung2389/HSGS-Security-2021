mov rax, -1 ; Now all 64 bits of rax is 1
mov rcx, rdi

; Shift A bitS right, then shift A bits left to change last A bits to 0
shr rax, cl
shl rax, cl

mov rcx, 64
sub rcx, rdi
sub rcx, rsi
; rcx = 64 - A - B

; Shift 64 - A - b bits left, then shift 64 - A - b bits right to change first 64 - A - B bits to 0
shl rax, cl
shr rax, cl

hlt