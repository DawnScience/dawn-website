#! /usr/bin/env python3

import secrets
import sys

def to_hex(values):
    return "".join("%02x" % v for v in values)

def encipher(text):
    secret_bytes = secrets.token_bytes(len(text))
    stext = to_hex(a ^ ord(b) for a,b in zip(secret_bytes, text))
    return to_hex(secret_bytes), stext

def split_hex(text):
    l = len(text)
    return [ int(text[l:l+2], 16) for l in range(0,l,2)]

def decipher(texta, textb):
    inta, intb = split_hex(texta), split_hex(textb)
    values = bytes(a ^ b for a,b in zip(inta, intb))
    return values.decode()

if len(sys.argv) == 1:
    print('Usage: string1 [string2 ...] to be enciphered')

for a in sys.argv[1:]:
    ea = encipher(a)
    print(a, ",".join(ea))
