#include <stdio.h>

// Função para imprimir os tempos de chegada dos ônibus
void imprimirTempos(int tempos[], int quantidade) {
    for (int i = 0; i < quantidade; i++) {
        // Adiciona "min" para dar contexto à unidade de tempo
        printf("%d min  ", tempos[i]);
    }
    printf("\n");
}

int main() {
    // --- 1. Declaração de Variáveis ---
    int temposChegada[10];
    int i, j, temp;
    int numOnibus = 10;

    // --- 2. Coleta dos Tempos de Chegada ---
    printf("--- Painel de Chegada de Onibus ---\n");
    printf("Digite o tempo estimado de chegada (em minutos) para os proximos %d onibus:\n", numOnibus);

    for (i = 0; i < numOnibus; i++) {
        printf("Tempo para o Onibus %d: ", i + 1);
        scanf("%d", &temposChegada[i]);
    }

    // --- 3. Ordenando do Menor para o Maior Tempo (Mais Rápido -> Mais Demorado) ---
    for (i = 0; i < numOnibus - 1; i++) {
        for (j = 0; j < numOnibus - i - 1; j++) {
            // Se o tempo de um ônibus for maior que o do próximo, eles trocam de lugar
            if (temposChegada[j] > temposChegada[j + 1]) {
                temp = temposChegada[j];
                temposChegada[j] = temposChegada[j + 1];
                temposChegada[j + 1] = temp;
            }
        }
    }

    printf("\n--- Previsao de Chegada (Do mais proximo ao mais distante) ---\n");
    imprimirTempos(temposChegada, numOnibus);

    // --- 4. Ordenando do Maior para o Menor Tempo (Mais Demorado -> Mais Rápido) ---
    for (i = 0; i < numOnibus - 1; i++) {
        for (j = 0; j < numOnibus - i - 1; j++) {
            // Se o tempo de um ônibus for menor que o do próximo, eles trocam de lugar
            if (temposChegada[j] < temposChegada[j + 1]) {
                temp = temposChegada[j];
                temposChegada[j] = temposChegada[j + 1];
                temposChegada[j + 1] = temp;
            }
        }
    }

    printf("\n--- Previsao de Chegada (Do mais distante ao mais proximo) ---\n");
    imprimirTempos(temposChegada, numOnibus);

    return 0;
}