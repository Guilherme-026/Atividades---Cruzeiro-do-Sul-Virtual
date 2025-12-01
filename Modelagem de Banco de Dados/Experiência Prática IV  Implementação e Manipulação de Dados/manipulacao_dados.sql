-- ==========================================================
-- 1. INSERTS (Povoando as tabelas principais)
-- ==========================================================

-- Inserindo Categorias
INSERT INTO Categoria (nome, descricao) VALUES 
('Pijamas Infantis', 'Pijamas para crianças de 2 a 12 anos'),
('Pijamas Adulto', 'Linha completa masculina e feminina'),
('Acessórios', 'Máscaras de dormir e pantufas');

-- Inserindo Tamanhos
INSERT INTO Tamanho (label) VALUES ('P'), ('M'), ('G'), ('GG'), ('10 Anos');

-- Inserindo Clientes
INSERT INTO Cliente (nome, cpf, email, telefone, endereco, data_cadastro) VALUES
('Ana Souza', '123.456.789-00', 'ana@email.com', '(11) 99999-1111', 'Rua das Flores, 123, São Paulo - SP', '2023-10-01'),
('Carlos Lima', '222.333.444-55', 'carlos@email.com', '(11) 98888-2222', 'Av. Paulista, 1000, São Paulo - SP', '2023-10-05'),
('Maria Oliveira', '555.666.777-88', 'maria@email.com', '(21) 97777-3333', 'Rua do Sol, 45, Rio de Janeiro - RJ', '2023-10-10');

-- Inserindo Produtos (Modelo Pai)
INSERT INTO Produto (nome, descricao, preco_base, categoria_id) VALUES
('Pijama Estrela', 'Pijama de algodão com estampa de estrelas', 89.90, 2),
('Pijama Dino', 'Pijama infantil tema dinossauro', 59.90, 1);

-- Inserindo Variações (Estoque real/SKU)
-- Note que o preço pode variar do preço base
INSERT INTO Produto_Variacao (produto_id, tamanho_id, cor, sku, preco, quantidade_estoque) VALUES
(1, 1, 'Azul Marinho', 'EST-AZ-P', 89.90, 10), -- Pijama Estrela P
(1, 2, 'Azul Marinho', 'EST-AZ-M', 89.90, 15), -- Pijama Estrela M
(1, 3, 'Azul Marinho', 'EST-AZ-G', 99.90, 8),  -- Pijama Estrela G (Mais caro)
(2, 5, 'Verde', 'DINO-VD-10', 59.90, 20);      -- Pijama Dino 10 Anos

-- Simulação de uma Venda (Venda ID 1 para Ana Souza)
-- Compra: 1 Pijama Estrela M (89.90) + 2 Pijamas Dino (59.90 cada)
INSERT INTO Venda (cliente_id, data_venda, valor_total, forma_pagamento, status) VALUES
(1, '2023-10-15 14:30:00', 209.70, 'Cartão de Crédito', 'Concluída');

INSERT INTO Item_Venda (venda_id, variacao_id, quantidade, preco_unitario, subtotal) VALUES
(1, 2, 1, 89.90, 89.90),    -- 1x Estrela M
(1, 4, 2, 59.90, 119.80);   -- 2x Dino

-- Pagamento da Venda 1
INSERT INTO Pagamento (venda_id, data_pagamento, valor_pago, tipo_pagamento, autorizacao) VALUES
(1, '2023-10-15 14:35:00', 209.70, 'Cartão de Crédito', 'AUT-998877');


-- ==========================================================
-- 2. CONSULTAS (SELECT)
-- ==========================================================

-- Consulta 1: Listar produtos com estoque baixo (menor que 10)
-- Uso de JOIN e WHERE
SELECT p.nome, pv.cor, t.label AS tamanho, pv.quantidade_estoque
FROM Produto_Variacao pv
JOIN Produto p ON pv.produto_id = p.produto_id
JOIN Tamanho t ON pv.tamanho_id = t.tamanho_id
WHERE pv.quantidade_estoque < 10
ORDER BY pv.quantidade_estoque ASC;

-- Consulta 2: Relatório de Vendas por Cliente
-- Uso de JOIN, ORDER BY e formatação
SELECT c.nome AS Cliente, v.data_venda, v.valor_total, v.status
FROM Venda v
JOIN Cliente c ON v.cliente_id = c.cliente_id
ORDER BY v.data_venda DESC;

-- Consulta 3: Listar Itens vendidos detalhados
-- Uso de múltiplos JOINs para pegar nome do produto e tamanho
SELECT v.venda_id, p.nome AS produto, t.label AS tamanho, iv.quantidade, iv.subtotal
FROM Item_Venda iv
JOIN Venda v ON iv.venda_id = v.venda_id
JOIN Produto_Variacao pv ON iv.variacao_id = pv.variacao_id
JOIN Produto p ON pv.produto_id = p.produto_id
JOIN Tamanho t ON pv.tamanho_id = t.tamanho_id;


-- ==========================================================
-- 3. ATUALIZAÇÕES (UPDATE) - 3 Comandos
-- ==========================================================

-- 1. Atualizar o endereço de um cliente que se mudou
UPDATE Cliente 
SET endereco = 'Rua Nova, 500, São Paulo - SP' 
WHERE cliente_id = 1;

-- 2. Reajustar o preço de uma variação específica (Aumento de 10%)
UPDATE Produto_Variacao 
SET preco = preco * 1.10 
WHERE sku = 'EST-AZ-G';

-- 3. Baixar estoque após uma venda (Simulação manual)
-- Retirando 2 unidades do Pijama Dino (ID variacao 4)
UPDATE Produto_Variacao 
SET quantidade_estoque = quantidade_estoque - 2 
WHERE variacao_id = 4;


-- ==========================================================
-- 4. EXCLUSÕES (DELETE) - 3 Comandos
-- ==========================================================

-- 1. Excluir um cliente que foi cadastrado errado e não tem compras
-- (Precisa criar um fake para deletar para não dar erro de chave estrangeira)
INSERT INTO Cliente (nome, cpf) VALUES ('Cliente Errado', '000.000.000-00');
DELETE FROM Cliente WHERE cpf = '000.000.000-00';

-- 2. Excluir uma categoria que não está sendo usada
INSERT INTO Categoria (nome) VALUES ('Categoria Teste');
DELETE FROM Categoria WHERE nome = 'Categoria Teste';

-- 3. Cancelar (Excluir) um item de venda específico se a venda estiver 'Pendente'
-- (Neste caso, vamos simular a exclusão do item da venda 1 por didática, 
-- embora na vida real devêssemos estornar)
DELETE FROM Item_Venda 
WHERE venda_id = 1 AND variacao_id = 2; -- Remove o pijama Estrela da venda