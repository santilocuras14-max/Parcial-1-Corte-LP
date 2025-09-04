# Análisis de rendimiento: Euclides recursivo C vs Haskell

> Fecha: 2025-09-04

## Metodología
- **Entrada**: N pares pseudoaleatorios en [1, 10^6].
- **Métrica**: tiempo de CPU total (segundos). Se imprime `checksum` para evitar que el compilador elimine el cálculo.
- **Comandos**:
```bash
cd 04_euclid_perf_C_vs_HS
./run_c.sh 1000000
./run_hs.sh 1000000
```
Repite varias veces (3+) y promedia.

## Resultados (ejemplo — completa con tus mediciones)
| Lenguaje | N | tiempo (s) | notas |
|---|---:|---:|---|
| C       | 1,000,000 | ... | gcc -O2 |
| Haskell | 1,000,000 | ... | ghc -O2 |

## Discusión
- **C (imperativo)** suele mostrar menor overhead de llamada y estructuras más “planas”, favoreciendo el rendimiento.
- **Haskell (declarativo)**, compilado con `-O2`, aplica inlining y optimizaciones; con `-fllvm` puede acercarse más al rendimiento de C en algunos escenarios.
- El algoritmo (gcd recursivo) es idéntico; las diferencias provienen de:
  - *Runtime* y *GC* (Haskell) vs ejecución directa (C).
  - Representación de enteros y manejo de pila/recursión.
- Si tu entorno varía (CPU, RAM, versiones de compilador), también variarán los tiempos.

## Conclusión
Resume con tus números si **C** vence consistentemente a **Haskell** o si están cercanos con optimizaciones fuertes.
