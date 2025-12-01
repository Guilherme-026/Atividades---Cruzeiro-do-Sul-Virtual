-- Criação do Schema (Banco de Dados)
CREATE SCHEMA IF NOT EXISTS `loja_diagrama` DEFAULT CHARACTER SET utf8mb4;
USE `loja_diagrama`;

-- 1. Entidade: Cliente
CREATE TABLE IF NOT EXISTS `Cliente` (
  `cliente_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  `email` VARCHAR(150) NOT NULL,
  `telefone` VARCHAR(20) NULL,
  `endereco` VARCHAR(255) NULL,
  `data_cadastro` DATE NULL,
  PRIMARY KEY (`cliente_id`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC)
) ENGINE = InnoDB;

-- 2. Entidade: Categoria
CREATE TABLE IF NOT EXISTS `Categoria` (
  `categoria_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(255) NULL, -- Opcional
  PRIMARY KEY (`categoria_id`)
) ENGINE = InnoDB;

-- 3. Entidade: Tamanho
CREATE TABLE IF NOT EXISTS `Tamanho` (
  `tamanho_id` INT NOT NULL AUTO_INCREMENT,
  `label` VARCHAR(10) NOT NULL, -- Ex: P, M, G, 42
  PRIMARY KEY (`tamanho_id`)
) ENGINE = InnoDB;

-- 4. Entidade: Produto (Liga com Categoria)
CREATE TABLE IF NOT EXISTS `Produto` (
  `produto_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(150) NOT NULL,
  `descricao` TEXT NULL,
  `preco_base` DECIMAL(10,2) NOT NULL, -- Decimal para dinheiro
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`produto_id`),
  CONSTRAINT `fk_Produto_Categoria`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `Categoria` (`categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- 5. Entidade: Imagem_Produto (Liga com Produto)
CREATE TABLE IF NOT EXISTS `Imagem_Produto` (
  `imagem_id` INT NOT NULL AUTO_INCREMENT,
  `produto_id` INT NOT NULL,
  `caminho_arquivo` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(150) NULL,
  PRIMARY KEY (`imagem_id`),
  CONSTRAINT `fk_Imagem_Produto_Produto`
    FOREIGN KEY (`produto_id`)
    REFERENCES `Produto` (`produto_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- 6. Entidade: Produto_Variacao (Liga com Produto e Tamanho)
CREATE TABLE IF NOT EXISTS `Produto_Variacao` (
  `variacao_id` INT NOT NULL AUTO_INCREMENT,
  `produto_id` INT NOT NULL,
  `tamanho_id` INT NOT NULL,
  `cor` VARCHAR(50) NULL,
  `sku` VARCHAR(50) NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `quantidade_estoque` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`variacao_id`),
  UNIQUE INDEX `sku_UNIQUE` (`sku` ASC),
  CONSTRAINT `fk_Variacao_Produto`
    FOREIGN KEY (`produto_id`)
    REFERENCES `Produto` (`produto_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Variacao_Tamanho`
    FOREIGN KEY (`tamanho_id`)
    REFERENCES `Tamanho` (`tamanho_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- 7. Entidade: Venda (Liga com Cliente)
CREATE TABLE IF NOT EXISTS `Venda` (
  `venda_id` INT NOT NULL AUTO_INCREMENT,
  `cliente_id` INT NULL, -- Pode ser NULL conforme solicitado
  `data_venda` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_total` DECIMAL(10,2) NOT NULL,
  `forma_pagamento` VARCHAR(50) NULL,
  `status` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`venda_id`),
  CONSTRAINT `fk_Venda_Cliente`
    FOREIGN KEY (`cliente_id`)
    REFERENCES `Cliente` (`cliente_id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- 8. Entidade: Item_Venda (Liga com Venda e Variacao)
CREATE TABLE IF NOT EXISTS `Item_Venda` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `venda_id` INT NOT NULL,
  `variacao_id` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `preco_unitario` DECIMAL(10,2) NOT NULL,
  `subtotal` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`item_id`),
  CONSTRAINT `fk_ItemVenda_Venda`
    FOREIGN KEY (`venda_id`)
    REFERENCES `Venda` (`venda_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ItemVenda_Variacao`
    FOREIGN KEY (`variacao_id`)
    REFERENCES `Produto_Variacao` (`variacao_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;

-- 9. Entidade: Pagamento (Liga com Venda)
CREATE TABLE IF NOT EXISTS `Pagamento` (
  `pagamento_id` INT NOT NULL AUTO_INCREMENT,
  `venda_id` INT NOT NULL,
  `data_pagamento` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valor_pago` DECIMAL(10,2) NOT NULL,
  `tipo_pagamento` VARCHAR(50) NOT NULL,
  `autorizacao` VARCHAR(100) NULL,
  PRIMARY KEY (`pagamento_id`),
  CONSTRAINT `fk_Pagamento_Venda`
    FOREIGN KEY (`venda_id`)
    REFERENCES `Venda` (`venda_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE = InnoDB;