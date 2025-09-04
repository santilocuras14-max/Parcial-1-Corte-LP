#!/usr/bin/env python3
# AFD para el lenguaje { a^* b^* c^* } sobre Σ={a,b,c}
# Acepta cadenas donde TODAS las 'a' preceden a TODAS las 'b' y éstas preceden a TODAS las 'c'.
# Estados:
#   S0: inicio (no hemos visto nada)
#   S1: en zona de 'a's
#   S2: ya vimos al menos una 'b' (zona de 'b's)
#   S3: ya vimos al menos una 'c' (zona de 'c's)
#   DEAD: estado trampa (violación de orden)
#
# Transiciones válidas:
#   S0 --a--> S1, S0 --b--> S2, S0 --c--> S3
#   S1 --a--> S1, S1 --b--> S2, S1 --c--> S3
#   S2 --b--> S2, S2 --c--> S3
#   S3 --c--> S3
#
# Todo lo demás -> DEAD
#
# Estados de aceptación: S0,S1,S2,S3 (la cadena vacía ε también es válida)

from enum import Enum

class Q(Enum):
    S0=0; S1=1; S2=2; S3=3; DEAD=4

def step(state: Q, ch: str) -> Q:
    if ch not in {'a','b','c'}:
        return Q.DEAD
    if state == Q.S0:
        if ch=='a': return Q.S1
        if ch=='b': return Q.S2
        if ch=='c': return Q.S3
    elif state == Q.S1:
        if ch=='a': return Q.S1
        if ch=='b': return Q.S2
        if ch=='c': return Q.S3
    elif state == Q.S2:
        if ch=='b': return Q.S2
        if ch=='c': return Q.S3
        # 'a' después de haber visto 'b' rompe el orden
        return Q.DEAD
    elif state == Q.S3:
        if ch=='c': return Q.S3
        # cualquier 'a' o 'b' después de 'c' rompe el orden
        return Q.DEAD
    return Q.DEAD

ACCEPTING = {Q.S0, Q.S1, Q.S2, Q.S3}

def accepts(s: str) -> bool:
    st = Q.S0
    for ch in s:
        st = step(st, ch)
        if st == Q.DEAD:
            return False
    return st in ACCEPTING

def main():
    tests = ["", "a", "b", "c", "aaabbbccc", "aaabbb", "bbbccc", "aaaccc", "abca", "bbaac", "acb", "aaabbccca"]
    for t in tests:
        print(f"{t!r:12s} -> {'ACEPTA' if accepts(t) else 'NO ACEPTA'}")

if __name__ == "__main__":
    main()
