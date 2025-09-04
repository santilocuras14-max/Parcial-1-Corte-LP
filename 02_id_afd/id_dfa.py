#!/usr/bin/env python3
# AFD para IDs: [A-Za-z][A-Za-z0-9]*

import string

def is_letter(ch): return ch in (string.ascii_letters)
def is_digit(ch): return ch in string.digits

def accepts(s: str) -> bool:
    if not s:
        return False
    if not is_letter(s[0]):
        return False
    for ch in s[1:]:
        if not (is_letter(ch) or is_digit(ch)):
            return False
    return True

def main():
    # 5 pruebas: 3 aceptadas, 2 rechazadas
    tests = ["Alpha", "a1b2c3", "Zx9", "9start", "with-hyphen"]
    for t in tests:
        print(f"{t!r:12s} -> {'ACEPTE' if accepts(t) else 'NO ACEPTE'}")

if __name__ == "__main__":
    main()
