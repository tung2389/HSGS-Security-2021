mov rax, rdi
xor rdx, rdx
idiv rsi
mov rdx, rax

add rax, rdi
add rax, rsi

mov rbx, rdi
sub rbx, rsi

mov rcx, rdi
imul rcx, rsi

hlt