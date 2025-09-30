#include <stdio.h>
#include <string.h>
#include <locale.h> // Para usar acentuação em português

// Protótipos: declaração das funções que serão usadas no programa.
int menu();
int suporte();
int financeiro();

// Variáveis globais, acessíveis de qualquer parte do código.
char nome[50];
int s = 0, f = 0;   // Contadores de acesso para suporte e financeiro.
float saldo = 0.0f; // Saldo do usuário.

// Função principal, onde o programa começa.
int main()
{
    // Habilita o uso de caracteres do português (como 'ç' e acentos).
    setlocale(LC_ALL, "pt_BR.UTF-8");

    printf("Olá, tudo bem? Qual o seu nome?\n");
    scanf("%49s", nome); // Lê o nome do usuário de forma segura.

    // Loop principal que mantém o programa em execução.
    while (1)
    {
        // Se a função menu retornar 0, o loop é interrompido com 'break'.
        if (menu() == 0)
            break;
    }

    return 0; // Finaliza o programa.
}

// Função que exibe o menu principal e gerencia a navegação.
int menu()
{
    int escolha;
    printf("\nO que gostaria de fazer, %s?\n", nome);
    printf("1 - Suporte\n");
    printf("2 - Financeiro\n");
    printf("3 - Sair\n");
    printf("Escolha: ");
    scanf("%d", &escolha);

    // Direciona o fluxo do programa com base na escolha do usuário.
    switch (escolha)
    {
    case 1:
        s++; // Incrementa o contador do suporte.
        suporte();
        break;
    case 2:
        f++; // Incrementa o contador do financeiro.
        financeiro();
        break;
    case 3:
        printf("\nSaindo do programa...\n");
        // Exibe estatísticas de uso antes de encerrar.
        printf("O ambiente de Suporte foi acessado %d vez(es)\n", s);
        printf("O ambiente Financeiro foi acessado %d vez(es)\n", f);
        return 0; // Sinaliza para a função main que o programa deve terminar.
    default:
        printf("Erro. Opção inválida.\n");
    }
    return 1; // Sinaliza para a main que o programa deve continuar.
}

// Função da seção de suporte.
int suporte()
{
    printf("\n--- SUPORTE ---\n");
    printf("No momento está fora do ar. Tente novamente mais tarde.\n");
    return 1;
}

// Função que gerencia as operações financeiras.
int financeiro()
{
    int opcao;
    float valor;

    // Loop que mantém o usuário no menu financeiro.
    while (1)
    {
        printf("\n--- FINANCEIRO ---\n");
        printf("Saldo atual: R$ %.2f\n", saldo);
        printf("1 - Ver saldo\n");
        printf("2 - Depositar (retirar dinheiro do caixa)\n");
        printf("3 - Sacar\n");
        printf("4 - Voltar ao menu principal\n");
        printf("Escolha: ");
        scanf("%d", &opcao);

        switch (opcao)
        {
        case 1: // Ver saldo
            printf("Seu saldo é: R$ %.2f\n", saldo);
            break;
        case 2: // Depositar
            printf("Informe o valor para depositar: R$ ");
            scanf("%f", &valor);
            if (valor > 0)
            {
                saldo += valor; // Adiciona o valor ao saldo.
                printf("Depósito de R$ %.2f realizado com sucesso!\n", valor);
            }
            else
            {
                printf("Valor inválido!\n");
            }
            break;
        case 3: // Sacar
            printf("Informe o valor para sacar: R$ ");
            scanf("%f", &valor);
            // Verifica se o saque é válido.
            if (valor > 0 && valor <= saldo)
            {
                saldo -= valor; // Subtrai o valor do saldo.
                printf("Saque de R$ %.2f realizado com sucesso!\n", valor);
            }
            else
            {
                printf("Saldo insuficiente ou valor inválido.\n");
            }
            break;
        case 4:
            return 1; // Sai do loop do financeiro e volta para o menu principal.
        default:
            printf("Opção inválida!\n");
        }
    }
}