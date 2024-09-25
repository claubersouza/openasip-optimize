#include <stdio.h>

int main() {
    int n = 13; // O termo da sequência de Fibonacci que deseja calcular
    int a = 0, b = 1;

    printf("%d %d ", a, b); // Imprime os dois primeiros termos da sequência

    for (int i = 2; i < n; i++) {
        __asm__ volatile (
            "add %[a], %[b];" // Adiciona 'a' e 'b' e armazena o resultado em 'b'
            "xchg %[a], %[b];" // Troca os valores de 'a' e 'b'
            : [a] "+r" (a), [b] "+r" (b) // Operandos de saída
            : // Nenhum operando de entrada
            : // Registros afetados
        );

    }
    printf("%d ", b);

    printf("\n");

    return 0;
}
