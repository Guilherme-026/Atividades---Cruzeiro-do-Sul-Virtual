# Projeto +ANIMALS (ONG de Adoção)

Este é um projeto de front-end para o site da `+ANIMALS`, uma ONG (fictícia) dedicada ao resgate, cuidado e adoção responsável de animais. O site foi desenvolvido como parte das atividades da disciplina "Desenvolvimento Front-End Para Web".

O projeto começou como um site estático de várias páginas e evoluiu para uma **Single Page Application (SPA)**, onde a navegação entre as páginas (`Início`, `Projeto`, `Cadastro`) é feita dinamicamente com JavaScript, sem recarregar a página.

---

## ✨ Funcionalidades Implementadas

Este projeto foi construído para atender a uma lista de especificações técnicas, resultando nas seguintes funcionalidades:

### 🎨 Design System
* **CSS Variáveis:** Um sistema de design consistente foi estabelecido usando variáveis CSS (`:root`) para cores, facilitando a manutenção.
* **Tipografia Hierárquica:** Múltiplos tamanhos de fonte foram usados para criar uma hierarquia visual clara (títulos, subtítulos, parágrafos).

### 📱 Layout Responsivo (Mobile-First)
* **5 Breakpoints:** O layout se adapta perfeitamente a 5 tamanhos de tela (Desktop Grande, Desktop, Laptop, Tablet e Mobile).
* **Flexbox e CSS Grid:** Os layouts dos componentes são construídos com Flexbox, e o CSS Grid é usado para componentes de layout mais complexos (como o rodapé e os cards de "passo-a-passo").

### 🧭 Navegação Sofisticada
* **Menu Dropdown:** O item "Projeto" no menu principal é um dropdown funcional, implementado 100% com CSS (hover).
* **Menu Hambúrguer:** Em telas menores, o menu se transforma em um "menu hambúrguer" funcional, controlado por JavaScript, que trava a rolagem da página quando aberto.

### 🧩 Componentes de UI Avançados
* **Formulário Condicional:** A página de cadastro possui um formulário com lógica condicional **implementada 100% com CSS**. O formulário mostra campos adicionais (valor da doação) apenas se o usuário selecionar a opção "Quero ser Doador".
* **Botões com Múltiplos Estados:** Todos os botões e links interativos possuem estilos para os estados `:hover`, `:focus` (para acessibilidade) e `:active`.
* **Modal de Feedback:** Um componente de modal (pop-up) foi criado com CSS puro para feedback ao usuário (ativado pelo botão "Adote Agora").
* **Cards e Badges:** Componentes reutilizáveis de "Card" e "Badge" foram criados para exibir informações de forma organizada.

### ⚡ Interatividade (JavaScript & DOM)
* **Single Page Application (SPA):** Esta é a principal funcionalidade do projeto. A navegação entre as páginas é interceptada pelo JavaScript.
    * O conteúdo da nova página é buscado usando a **`Fetch API`**.
    * A URL é atualizada sem recarregar usando a **`History API`**.
    * Apenas o conteúdo da tag `<main>` é substituído dinamicamente, mantendo o `header` e `footer` intactos, o que resulta em uma experiência de usuário instantânea.
* **Manipulação do DOM:** O JavaScript manipula o DOM para controlar o estado (aberto/fechado) do menu hambúrguer.

---

## 🛠️ Tecnologias Utilizadas

* **HTML5 Semântico:** Estrutura clara e acessível.
* **CSS3 Moderno:**
    * Flexbox
    * CSS Grid
    * Variáveis CSS
    * Animações e Transições
    * Seletores Avançados (para lógica condicional e SPA)
    * `@import` para unificação de folhas de estilo.
* **JavaScript (ES6+):**
    * Manipulação do DOM
    * `addEventListener`
    * `fetch()` API
    * `History API` (pushState, popstate)
    * `async/await`

---

## 🚀 Como Executar o Projeto

**⚠️ IMPORTANTE:** Este projeto é uma Single Page Application (SPA) e **precisa ser executado a partir de um servidor web** para que a funcionalidade `fetch()` funcione corretamente (devido à política de CORS do navegador).

Não vai funcionar corretamente se você apenas abrir o `index.html` clicando duas vezes no arquivo.

### Opção 1: VS Code (Recomendado)
1.  Clone este repositório.
2.  Abra a pasta `ANIMALS` no Visual Studio Code.
3.  Instale a extensão **"Live Server"** (de Ritwick Dey).
4.  Clique com o botão direito no arquivo `index.html` e selecione **"Open with Live Server"**.

### Opção 2: Acessar a versão Online
O site está publicado no GitHub Pages e pode ser acessado diretamente:

**https://guilherme-026.github.io/Atividades---Cruzeiro-do-Sul-Virtual/Desenvolvimento%20Front-End%20Para%20Web/ANIMALS/index.html**

---

*Projeto desenvolvido com a ajuda do Gemini, uma IA do Google.*
