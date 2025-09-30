#include <stdio.h>
#include <string.h>
#include <limits.h> // Biblioteca para usar INT_MAX, o maior valor inteiro possível
#include <locale.h> // Para usar acentuação em português

// Define o número de filmes que vamos analisar.
// Facilita a alteração do programa para mais ou menos filmes no futuro.
#define NUM_FILMES 5
// Define a escala para o gráfico de barras de texto.
// Cada caractere '■' representará esta quantidade de ingressos.
#define ESCALA_GRAFICO 5000

int main() {

    setlocale(LC_ALL, "pt_BR.UTF-8"); // Habilita o uso de caracteres do português (como 'ç' e acentos).
    // --- 1. DECLARAÇÃO E INICIALIZAÇÃO DOS VETORES ---
    // Vetor[m] com os nomes dos filmes.
    char* nomes_filmes[NUM_FILMES] = {
        "Aventura Intergalactica",
        "Drama no Tribunal",
        "Comedia Sem Fim",
        "Terror na Floresta",
        "Herois da Cidade"
    };

    // Vetor[m] com a quantidade de ingressos vendidos para cada filme no mês.
    int ingressos_vendidos[NUM_FILMES] = {85000, 42000, 110500, 35000, 98000};

    // Variáveis para armazenar os resultados da análise.
    int mais_vendidos = -1;          // Inicia com -1 para garantir que o primeiro valor seja maior.
    int menos_vendidos = INT_MAX;    // Inicia com o maior valor possível para garantir que o primeiro seja menor.
    char* filme_mais_assistido;
    char* filme_menos_assistido;
    long total_ingressos = 0; // 'long' para evitar estouro de memória se a soma for muito grande.
    int i, j; // Contadores para os laços.

    // --- 2. PROCESSAMENTO DOS DADOS USANDO LAÇO DE REPETIÇÃO ---
    // Este laço 'for' percorre os vetores para encontrar os filmes
    // mais e menos assistidos e calcular o total de vendas.
    for (i = 0; i < NUM_FILMES; i++) {
        // Soma o total de ingressos
        total_ingressos += ingressos_vendidos[i];

        // Verifica se o filme atual teve mais ingressos vendidos que o recorde anterior.
        if (ingressos_vendidos[i] > mais_vendidos) {
            mais_vendidos = ingressos_vendidos[i];
            filme_mais_assistido = nomes_filmes[i];
        }

        // Verifica se o filme atual teve menos ingressos vendidos que o recorde anterior.
        if (ingressos_vendidos[i] < menos_vendidos) {
            menos_vendidos = ingressos_vendidos[i];
            filme_menos_assistido = nomes_filmes[i];
        }
    }

    // --- 3. EXIBIÇÃO DOS RESULTADOS (SAÍDA FORMATADA) ---
    printf("--- RELATORIO DE VENDAS DE CINEMA DO MES ---\n\n");
    printf("Bar chart de vendas (cada ■ representa %d ingressos):\n\n", ESCALA_GRAFICO);

    // Laço 'for' para criar e exibir o gráfico de barras de texto.
    for (i = 0; i < NUM_FILMES; i++) {
        // "%-25s" alinha o texto à esquerda com um espaço de 25 caracteres, organizando a exibição.
        printf("%-25s | ", nomes_filmes[i]);

        // Calcula quantos blocos '■' devem ser impressos com base na escala.
        int num_blocos = ingressos_vendidos[i] / ESCALA_GRAFICO;

        // Imprime os blocos do gráfico.
        for (j = 0; j < num_blocos; j++) {
            printf("■");
        }

        // Imprime o número exato de ingressos ao final da barra.
        printf(" (%d)\n", ingressos_vendidos[i]);
    }

    printf("\n--------------------------------------------------\n");
    printf("                 DESTAQUES DO MES\n");
    printf("--------------------------------------------------\n");
    printf("Filme mais assistido: %s (%d ingressos)\n", filme_mais_assistido, mais_vendidos);
    printf("Filme menos assistido: %s (%d ingressos)\n", filme_menos_assistido, menos_vendidos);
    printf("Total de ingressos vendidos no mes: %ld\n", total_ingressos);

    return 0;
}