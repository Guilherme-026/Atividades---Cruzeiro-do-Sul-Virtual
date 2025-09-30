# Painel de Previsão de Chegada de Ônibus

Este é um programa simples em C que simula um painel de ponto de ônibus. Ele solicita ao usuário o tempo estimado de chegada (em minutos) para 10 ônibus e, em seguida, exibe esses tempos em ordem crescente (do mais próximo ao mais distante) e decrescente (do mais distante ao mais próximo).

## 🚀 Funcionalidades

* Coleta de 10 tempos de chegada em minutos.
* Ordenação dos horários para mostrar a ordem de chegada, do mais rápido ao mais demorado.
* Ordenação inversa para mostrar do mais demorado ao mais rápido.
* Interface de linha de comando simples e intuitiva.

## ⚙️ Como Funciona

O código utiliza um vetor (`array`) de inteiros para armazenar os tempos de chegada. A ordenação é realizada através do algoritmo **Bubble Sort**, que compara e troca repetidamente os elementos adjacentes até que todo o vetor esteja ordenado.

O programa realiza duas passagens de ordenação:
1.  **Ordem Crescente:** Organiza os tempos do menor para o maior.
2.  **Ordem Decrescente:** Organiza os tempos do maior para o menor.

## 📋 Como Usar

### Pré-requisitos
Você precisa de um compilador C instalado no seu sistema, como o **GCC** (GNU Compiler Collection), que é padrão na maioria dos sistemas Linux e pode ser facilmente instalado no Windows (via MinGW) e macOS (via Xcode Command Line Tools).

### Compilação
1.  Salve o código em um arquivo com a extensão `.c`. Por exemplo, `painel_onibus.c`.
2.  Abra seu terminal ou prompt de comando.
3.  Navegue até a pasta onde você salvou o arquivo.
4.  Execute o seguinte comando para compilar o programa:
    ```bash
    gcc painel_onibus.c -o painel_onibus
    ```
    Isso criará um arquivo executável chamado `painel_onibus`.

### Execução
Para rodar o programa, execute o arquivo gerado no terminal:
```bash
./painel_onibus

O programa solicitará que você insira os 10 tempos de chegada e, em seguida, exibirá os resultados ordenados.

💻 Exemplo de Uso
--- Painel de Chegada de Onibus ---
Digite o tempo estimado de chegada (em minutos) para os proximos 10 onibus:
Tempo para o Onibus 1: 15
Tempo para o Onibus 2: 8
Tempo para o Onibus 3: 22
Tempo para o Onibus 4: 5
Tempo para o Onibus 5: 30
Tempo para o Onibus 6: 12
Tempo para o Onibus 7: 9
Tempo para o Onibus 8: 2
Tempo para o Onibus 9: 18
Tempo para o Onibus 10: 25

--- Previsao de Chegada (Do mais proximo ao mais distante) ---
2 min  5 min  8 min  9 min  12 min  15 min  18 min  22 min  25 min  30 min

--- Previsao de Chegada (Do mais distante ao mais proximo) ---
30 min  25 min  22 min  18 min  15 min  12 min  9 min  8 min  5 min  2 min
