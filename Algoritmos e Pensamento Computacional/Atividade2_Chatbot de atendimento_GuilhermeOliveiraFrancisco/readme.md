# Sistema Simples de Menu Interativo em C

Este é um projeto de console simples, desenvolvido em linguagem C, que simula um menu de atendimento interativo. O programa cumprimenta o usuário, pergunta seu nome e oferece acesso a diferentes módulos, como Financeiro e Suporte, enquanto monitora a quantidade de acessos a cada um.

## 🚀 Funcionalidades

* **Menu Principal Interativo:** Navegação simples e direta através de opções numéricas.
* **Módulo Financeiro:**
    * Consulta de saldo.
    * Realização de depósitos.
    * Realização de saques com validação de saldo.
* **Módulo de Suporte:** Uma seção de exemplo que pode ser expandida no futuro.
* **Contador de Acessos:** O sistema registra e exibe quantas vezes cada módulo (Financeiro e Suporte) foi acessado antes de encerrar.
* **Suporte a Caracteres Locais:** Configurado para o português do Brasil (`pt_BR.UTF-8`), permitindo o uso de acentos e 'ç'.

## 🛠️ Como Compilar e Executar

Para compilar e executar este projeto, você precisará de um compilador C, como o **GCC**.

1.  **Pré-requisito:** Tenha o GCC ou outro compilador C instalado em seu sistema.

2.  **Clone ou salve o código:** Salve o código-fonte em um arquivo chamado `main.c`.

3.  **Abra o terminal** ou prompt de comando na pasta onde você salvou o arquivo.

4.  **Compile o programa** com o seguinte comando:
    ```bash
    gcc main.c -o programa
    ```
    * Isso compilará o `main.c` e criará um arquivo executável chamado `programa`.

5.  **Execute o programa:**
    ```bash
    ./programa
    ```

## 💻 Como Usar

1.  Ao iniciar, o programa solicitará o seu nome.
2.  Após inserir seu nome, o menu principal será exibido.
3.  Digite o número da opção desejada e pressione Enter:
    * **1 - Suporte:** Exibe uma mensagem de status do setor de suporte.
    * **2 - Financeiro:** Abre um submenu onde você pode depositar, sacar ou ver seu saldo. Para voltar ao menu principal, escolha a opção "Voltar".
    * **3 - Sair:** Encerra o programa e exibe as estatísticas de uso dos módulos.
