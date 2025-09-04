# Parcial 1 — Lenguajes de Programación

> **Estructura**  
```
.
├── 01_regex_afd
│   └── regex_afd.py
├── 02_id_afd
│   └── id_dfa.py
├── 03_flex_bison_cbrt_calc
│   ├── Makefile
│   ├── calc.l
│   ├── calc.y
│   ├── input.txt
│   └── README.md
└── 04_euclid_perf_C_vs_HS
    ├── euclid.c
    ├── euclid.hs
    ├── run_c.sh
    ├── run_hs.sh
    └── ANALISIS.md

```
---

## 1) Expresión regular y AFD sobre {a,b,c} con todas las **a** antes de las **b** y éstas antes de las **c**

- Regex: `a* b* c*`
- Implementación: **Python** en `01_regex_afd/regex_afd.py` con AFD explícito (5 estados) + pruebas rápidas.

## 2) AFD para IDs
- Regex: `[A-Za-z][A-Za-z0-9]*`
- Implementación: **Python** en `02_id_afd/id_dfa.py` con 5 casos de prueba (3 aceptados, 2 rechazados).

## 3) Calculadora en C (Flex/Bison) con **raíz cúbica** de reales
- Archivos: `03_flex_bison_cbrt_calc/`
- Soporta: suma, resta, multiplicación, división, paréntesis, números reales, `cbrt(x)` y `sqrt(x)`.
- Entrada: archivo de texto (`input.txt`); Salida: consola.
- Compilar y ejecutar:
  ```bash
  cd 03_flex_bison_cbrt_calc
  make
  ./calc input.txt
  ```

## 4) Rendimiento de Euclides recursivo: C (imperativo) vs Haskell (declarativo)
- Código en `04_euclid_perf_C_vs_HS/`. Incluye scripts `run_c.sh` y `run_hs.sh` para compilar/medir tiempo.
- Reporte editable en `ANALISIS.md`.

## 5) ANTLR: primeros *n* términos de la serie de Maclaurin de **e^x**
- Gramática `ExMaclaurin.g4` y programa Java `Main.java` que parsea entradas tipo `maclaurin(n=10, x=1.5);` y calcula
  \(\sum_{k=0}^n \frac{x^k}{k!}\).
- Requiere ANTLR 4 (Java). Script `build.sh` y `run.sh` incluidos.
