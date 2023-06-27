-- MySQL Script generated by MySQL Workbench
-- Sun Nov  6 14:57:29 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema oficina
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `oficina` ;

-- -----------------------------------------------------
-- Schema oficina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oficina` DEFAULT CHARACTER SET utf8 ;
USE `oficina` ;

-- -----------------------------------------------------
-- Table `oficina`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(100) NOT NULL,
  `Telefone` VARCHAR(25) NOT NULL,
  `Email` VARCHAR(150) NULL,
  `endereco` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` CHAR(2) NULL,
  `cpf_cnpj` VARCHAR(20) NULL,
  `tipo_cliente` CHAR(1) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Status_OS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Status_OS` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Status_OS` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Identificacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Marca` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Marca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Identificacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Modelo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Modelo` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Modelo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idMarca` INT NOT NULL,
  `Identificacao` VARCHAR(45) NOT NULL,
  `Ano` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Veiculo_Marca1_idx` (`idMarca` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculo_Marca1`
    FOREIGN KEY (`idMarca`)
    REFERENCES `oficina`.`Marca` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Veiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Veiculo` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Veiculo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idModelo` INT NOT NULL,
  `Cor` INT NOT NULL,
  `Placa` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Veiculo_Modelo1_idx` (`idModelo` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculo_Modelo1`
    FOREIGN KEY (`idModelo`)
    REFERENCES `oficina`.`Modelo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`ordem_servico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`ordem_servico` ;

CREATE TABLE IF NOT EXISTS `oficina`.`ordem_servico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `idStatus` INT NOT NULL,
  `Data_Emissao` DATETIME NOT NULL,
  `Data_Conclusao` DATETIME NULL,
  `Valor` DECIMAL(18,2) NOT NULL,
  `Data_Autorizacao` DATETIME NULL,
  `Obs` TEXT NULL,
  `idVeiculo` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_OrdemServico_StatusOrdemServico_idx` (`idStatus` ASC) VISIBLE,
  INDEX `fk_OrdemServico_Cliente_idx` (`idCliente` ASC) VISIBLE,
  INDEX `fk_veiculo_idx` (`idVeiculo` ASC) VISIBLE,
  CONSTRAINT `fk_OrdemServico_StatusOrdemServico`
    FOREIGN KEY (`idStatus`)
    REFERENCES `oficina`.`Status_OS` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrdemServico_Cliente`
    FOREIGN KEY (`idCliente`)
    REFERENCES `oficina`.`Cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veiculo`
    FOREIGN KEY (`idVeiculo`)
    REFERENCES `oficina`.`Veiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Especialidade`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Especialidade` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Especialidade` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Identificacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Equipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Equipe` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Equipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Identificacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Funcionario` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Funcionario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idEspecialidade` INT NOT NULL,
  `idEquipe` INT NOT NULL,
  `Nome` VARCHAR(100) NOT NULL,
  `endereco` VARCHAR(60) NOT NULL,
  `cidade` VARCHAR(50) NOT NULL,
  `estado` CHAR(2) NULL,
  `telefone` VARCHAR(20) NULL,
  `complemento` VARCHAR(45) NULL,
  `cpf_cnpj` VARCHAR(20) NULL,
  `tipo` CHAR(1) NULL,
  PRIMARY KEY (`id`, `idEspecialidade`),
  INDEX `fk_Mecanico_Especialidade1_idx` (`idEspecialidade` ASC) VISIBLE,
  INDEX `fk_Mecanico_Equipe1_idx` (`idEquipe` ASC) VISIBLE,
  CONSTRAINT `fk_Mecanico_Especialidade1`
    FOREIGN KEY (`idEspecialidade`)
    REFERENCES `oficina`.`Especialidade` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mecanico_Equipe1`
    FOREIGN KEY (`idEquipe`)
    REFERENCES `oficina`.`Equipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`TabelaServico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`TabelaServico` ;

CREATE TABLE IF NOT EXISTS `oficina`.`TabelaServico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Identificacao` VARCHAR(100) NOT NULL,
  `ValorTabela` DECIMAL(18,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Status_Servico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Status_Servico` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Status_Servico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Identificacao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Servico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Servico` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Servico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idVeiculo` INT NOT NULL,
  `idTabela_Servico` INT NOT NULL,
  `idEquipe` INT NOT NULL,
  `idStatus_Servico` INT NOT NULL,
  `Descricao` TEXT NOT NULL,
  `Valor_Pecas` DECIMAL(18,2) NOT NULL,
  `Valor_MaoObra` DECIMAL(18,2) NOT NULL,
  `Data_Inicio` DATETIME NULL,
  `Data_Termino` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Servico_Veiculo1_idx` (`idVeiculo` ASC) VISIBLE,
  INDEX `fk_Servico_TabelaServico1_idx` (`idTabela_Servico` ASC) VISIBLE,
  INDEX `fk_Servico_Equipe1_idx` (`idEquipe` ASC) VISIBLE,
  INDEX `fk_Servico_StatusServico1_idx` (`idStatus_Servico` ASC) VISIBLE,
  CONSTRAINT `fk_Servico_Veiculo1`
    FOREIGN KEY (`idVeiculo`)
    REFERENCES `oficina`.`Veiculo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servico_TabelaServico1`
    FOREIGN KEY (`idTabela_Servico`)
    REFERENCES `oficina`.`TabelaServico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servico_Equipe1`
    FOREIGN KEY (`idEquipe`)
    REFERENCES `oficina`.`Equipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servico_StatusServico1`
    FOREIGN KEY (`idStatus_Servico`)
    REFERENCES `oficina`.`Status_Servico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`fornecedor` ;

CREATE TABLE IF NOT EXISTS `oficina`.`fornecedor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(45) NULL,
  `cnpj` VARCHAR(20) NULL,
  `endereco` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `estado` CHAR(2) NULL,
  `cep` VARCHAR(10) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Produto` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Identificacao` VARCHAR(45) NOT NULL,
  `Valor` DECIMAL(18,2) NOT NULL,
  `idfornecedor` INT NOT NULL,
  PRIMARY KEY (`id`, `idfornecedor`),
  INDEX `fk_Produto_fornecedor1_idx` (`idfornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_Produto_fornecedor`
    FOREIGN KEY (`idfornecedor`)
    REFERENCES `oficina`.`fornecedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`Produto_ou_Servico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Produto_ou_Servico` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Produto_ou_Servico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `idServico` INT NOT NULL,
  `idPeca` INT NOT NULL,
  `valor_peca` DECIMAL(18,2) NOT NULL,
  PRIMARY KEY (`id`, `idServico`, `idPeca`),
  INDEX `fk_Servico_has_Peca_Peca1_idx` (`idPeca` ASC) VISIBLE,
  INDEX `fk_Servico_has_Peca_Servico1_idx` (`idServico` ASC) VISIBLE,
  CONSTRAINT `fk_Servico_has_Peca_Servico1`
    FOREIGN KEY (`idServico`)
    REFERENCES `oficina`.`Servico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servico_has_Peca_Peca1`
    FOREIGN KEY (`idPeca`)
    REFERENCES `oficina`.`Produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`produto_estoque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`produto_estoque` ;

CREATE TABLE IF NOT EXISTS `oficina`.`produto_estoque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT NULL,
  `idProduto` INT NOT NULL,
  `Produto_idfornecedor` INT NOT NULL,
  PRIMARY KEY (`id`, `idProduto`, `Produto_idfornecedor`),
  INDEX `fk_produto_estoque_Produto1_idx` (`idProduto` ASC) VISIBLE,
  CONSTRAINT `fk_produto_estoque_Produto`
    FOREIGN KEY (`idProduto`)
    REFERENCES `oficina`.`Produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
