# Relatório de Vendas de Cinema em C

Este é um programa de console simples, desenvolvido em linguagem C, que realiza uma análise estática sobre dados de vendas de ingressos de cinema. O programa processa uma lista predefinida de filmes e suas respectivas vendas para gerar um relatório resumido, incluindo destaques e um gráfico de barras em texto.

## 🚀 Funcionalidades

* **Análise de Dados:** Processa vetores com nomes de filmes e ingressos vendidos.
* **Destaques do Mês:**
    * Identifica automaticamente o filme **mais assistido** (maior número de ingressos).
    * Identifica o filme **menos assistido** (menor número de ingressos).
* **Relatório Consolidado:** Calcula e exibe o **total de ingressos** vendidos no período.
* **Visualização Gráfica:** Gera um gráfico de barras (`bar chart`) simples em modo texto para comparar visualmente o desempenho de cada filme.
* **Código Estruturado:** O código é comentado e utiliza constantes (`#define`) para facilitar futuras modificações, como alterar o número de filmes ou a escala do gráfico.

## 🛠️ Como Compilar e Executar

Para rodar este projeto, você precisa de um compilador C (como o GCC) instalado em seu sistema.

1.  **Salve o Código:** Certifique-se de que o código esteja salvo em um arquivo chamado `main.c`.

2.  **Abra o Terminal:** Navegue pelo terminal até a pasta onde o arquivo `main.c` está localizado.

3.  **Compile o Programa:** Execute o seguinte comando para compilar o código e gerar um arquivo executável chamado `programa`.
    ```bash
    gcc main.c -o programa
    ```

4.  **Execute o Programa:** Rode o arquivo que foi gerado no passo anterior.

    * No **Linux ou macOS**:
        ```bash
        ./programa
        ```
    * No **Windows**:
        ```bash
        .\programa.exe
        ```

## 📄 Exemplo de Saída

Ao ser executado, o programa exibirá um relatório formatado diretamente no terminal, similar a este:

-- RELATORIO DE VENDAS DE CINEMA DO MES ---

Bar chart de vendas (cada ■ representa 5000 ingressos):

Aventura Intergalactica  | ■■■■■■■■■■■■■■■■■ (85000)

Drama no Tribunal       | ■■■■■■■■ (42000)

Comedia Sem Fim         | ■■■■■■■■■■■■■■■■■■■■■■ (110500)

Terror na Floresta      | ■■■■■■■■ (35000)

Herois da Cidade        | ■■■■■■■■■■■■■■■■■■■ (98000)

                     DESTAQUES DO MES
Filme mais assistido: Comedia Sem Fim (110500 ingressos)
Filme menos assistido: Terror na Floresta (35000 ingressos)
Total de ingressos vendidos no mes: 370500
