cmp rdi, rsi ; If n >= S
jae .L1

mov rax, rsi
xor rdx, rdx
div rdi ; Take S / n
cmp rdx, 0 ; If (S / n)'s remainder is greateer than 0
ja .L2 ; Jump to .L2
jmp .L3 ; Or the number of coin needed is (S / n)

.L1:
    mov rax, 1 ; Then the number of coin needed is 1
    jmp .L3

.L2:
    add rax, 1 ; Then the number of coin needed is (S / n) + 1
    jmp .L3

.L3:
    hlt