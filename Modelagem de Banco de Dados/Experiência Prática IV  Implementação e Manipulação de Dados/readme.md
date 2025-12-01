# Projeto DreamWear - Banco de Dados SQL

Este repositório contém a modelagem e os scripts SQL para o sistema de gestão da loja de pijamas **DreamWear**.

## 📁 Estrutura do Projeto

- **1_estrutura_tabelas.sql**: Script DDL para criação do banco de dados e tabelas com chaves primárias e estrangeiras.
- **2_manipulacao_dados.sql**: Script DML contendo inserção de dados fictícios, consultas de relatórios, atualizações de estoque e exemplos de exclusão.

## 🛠 Tecnologias Utilizadas

- MySQL Workbench 8.0.45
- Linguagem SQL (DDL e DML)

## 📋 Como Executar

1.  Abra seu gerenciador de banco de dados (MySQL Workbench ou similar).
2.  Execute o script `1_estrutura_tabelas.sql` para criar o schema `dreamwear_db`.
3.  Execute o script `2_manipulacao_dados.sql` sequencialmente para povoar o banco e testar as operações.

## 📊 Principais Consultas Implementadas

- Relatório de produtos com estoque baixo.
- Histórico de vendas por cliente.
- Detalhamento de itens vendidos por SKU.
