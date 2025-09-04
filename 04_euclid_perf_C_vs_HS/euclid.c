#include <stdio.h>
#include <stdlib.h>
#include <time.h>

long long gcd(long long a, long long b){
    return (b==0) ? a : gcd(b, a % b);
}

int main(int argc, char** argv){
    int N = (argc>1? atoi(argv[1]) : 1000000);
    unsigned int seed = 1234567u;
    srand(seed);

    clock_t t0 = clock();
    long long agg = 0;
    for(int i=0;i<N;i++){
        long long x = rand() % 1000000 + 1;
        long long y = rand() % 1000000 + 1;
        agg ^= gcd(x,y);
    }
    clock_t t1 = clock();
    double secs = (double)(t1 - t0) / CLOCKS_PER_SEC;
    printf("C - N=%d  tiempo=%.6f s  checksum=%lld\n", N, secs, agg);
    return 0;
}
