// Espera o DOM carregar completamente para rodar o script
document.addEventListener('DOMContentLoaded', () => {
    
    // ==========================================================
    // ETAPA 1: LÓGICA DO MENU HAMBÚRGUER
    // ==========================================================
    const menuToggle = document.getElementById('menu-toggle');
    const body = document.body;

    if (menuToggle) {
        menuToggle.addEventListener('click', () => {
            // Adiciona/remove a classe 'menu-open' no <body>
            body.classList.toggle('menu-open');
        });
    }
})
    
//     // ==========================================================
//     // ETAPA 2: LÓGICA DO SPA (SINGLE PAGE APPLICATION)
//     // ==========================================================
    
//     // --- 1. Função principal para carregar a página ---
//     const loadPage = async (url) => {
//         const main = document.querySelector('main');

//         // Verificação de segurança: Se a página atual não tem <main>, não faz nada.
//         if (!main) {
//             console.error('Erro Crítico: A página atual não tem uma tag <main>.');
//             return;
//         }
    
//         try {
//             // Adiciona uma classe para o efeito de fade-out
//             main.classList.add('page-loading');
            
//             // Espera a animação de fade-out terminar
//             await new Promise(resolve => setTimeout(resolve, 300));
            
//             // Busca o conteúdo da nova URL
//             const response = await fetch(url);

//             // --- DEBUG: Ver o status da resposta ---
//             console.log('Fetch URL:', url, 'Status:', response.status);
            
//             if (!response.ok) {
//                 throw new Error(`Não foi possível carregar a página (Status: ${response.status})`);
//             }
            
//             // Pega o HTML da resposta como texto
//             const text = await response.text();

//             // --- DEBUG: VER O QUE O FETCH RETORNOU ---
//             // Descomente a linha abaixo se quiser ver o HTML completo no console
//             // console.log('HTML Recebido:', text);
            
//             // Usa o DOMParser para transformar o texto em um documento HTML
//             const parser = new DOMParser();
//             const doc = parser.parseFromString(text, 'text/html');
            
//             // Pega o <main> e o <title> do novo documento
//             const newMain = doc.querySelector('main');
//             const newTitleElement = doc.querySelector('title');

            
//             // --- CÓDIGO DE DEFESA (para o <main>) ---
//             // Verifica se o newMain foi encontrado
//             if (newMain) {
//                 main.innerHTML = newMain.innerHTML;
//             } else {
//                 console.error('Erro: A página carregada não tem uma tag <main>. O fetch pode ter retornado o index.html por engano.');
//                 main.classList.remove('page-loading');
//                 return; // Para a execução para não quebrar
//             }

//             // --- CÓDIGO DE DEFESA (para o <title>) ---
//             // Se newTitleElement existir, usa o texto dele. Se não (null), mantém o título atual.
//             const newTitle = newTitleElement ? newTitleElement.innerText : document.title;
//             document.title = newTitle;
            
//             // Rola a página para o topo
//             window.scrollTo(0, 0);

//             // Remove a classe para o efeito de fade-in
//             main.classList.remove('page-loading');
            
//             // Atualiza os links ativos no menu
//             updateActiveLinks();

//         } catch (error) {
//             console.error('Erro ao carregar a página:', error);
//             main.classList.remove('page-loading');
//             // Se falhar, apenas redireciona o usuário (forma segura)
//             // window.location.href = url; 
//         }
//     };

//     // --- 2. Função para atualizar os links ativos no menu ---
//     const updateActiveLinks = () => {
//         const links = document.querySelectorAll('nav a');
//         // Normaliza o pathname (ex: "/" vira "/index.html" ou o que for)
//         let currentPath = window.location.pathname;
//         if (currentPath.endsWith('/')) {
//             currentPath += 'index.html'; // Ajuste comum
//         }
        
//         links.forEach(link => {
//             let linkPath = new URL(link.href).pathname;
            
//             // O link "Projeto" (pai) também deve ficar ativo
//             if (link.closest('.dropdown') && currentPath.includes(linkPath.replace('index.html', ''))) {
//                  link.classList.add('active');
//             }
//             // Links normais
//             else if (linkPath === currentPath) {
//                 link.classList.add('active');
//             } 
//             else {
//                 link.classList.remove('active');
//             }
//         });
//     };

//     // --- 3. Intercepta todos os cliques na página ---
//     document.addEventListener('click', (e) => {
//         const link = e.target.closest('a');

//         // --- Verificações para IGNORAR o SPA ---
//         if (!link) return; // Não foi um clique em um link
//         if (e.ctrlKey || e.metaKey) return; // Usuário quer abrir em nova aba
//         if (link.target === '_blank') return; // Link tem target="_blank"
//         if (!link.href.startsWith(window.location.origin)) return; // Link externo
//         if (link.hash && link.pathname === window.location.pathname) return; // É um link âncora (#) na mesma página
//         if (link.href === window.location.href) { // Clicou no link da página atual
//             e.preventDefault();
//             return;
//         }

//         // --- Se passou em tudo, ativamos o SPA ---
//         e.preventDefault();

//         // Se o menu mobile estiver aberto, fecha ele
//         if (body.classList.contains('menu-open')) {
//             body.classList.remove('menu-open');
//         }

//         // Adiciona a nova URL ao histórico do navegador
//         history.pushState({}, '', link.href);
        
//         // Carrega a nova página
//         loadPage(link.href);
//     });

//     // --- 4. Lida com os botões "Voltar" e "Avançar" do navegador ---
//     window.addEventListener('popstate', () => {
//         // Carrega o conteúdo da URL do histórico
//         loadPage(window.location.href);
//     });

//     // --- 5. Define o link ativo na primeira carga da página ---
//     updateActiveLinks();

// });