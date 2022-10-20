-- -----------------------------------------------------
-- Schema oficina
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `oficina` ;

-- -----------------------------------------------------
-- Schema oficina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oficina` ;
USE `oficina` ;

-- -----------------------------------------------------
-- Table `oficina`.`Equipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Equipe` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Equipe` (
  `idEquipe` INT NOT NULL AUTO_INCREMENT,
  `nomeEquipe` VARCHAR(45) NULL,
  PRIMARY KEY (`idEquipe`))
;

-- -----------------------------------------------------
-- Table `oficina`.`Mecanico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Mecanico` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Mecanico` (
  `idMecanico` INT NOT NULL AUTO_INCREMENT,
  `idEquipe` INT NOT NULL,
  `nomeMecanico` VARCHAR(100) NULL,
  `endereco` VARCHAR(245) NULL,
  `especialidade` VARCHAR(45) NULL,
  PRIMARY KEY (`idMecanico`, `idEquipe`),
  CONSTRAINT `fk_Mecanico_Equipe`
    FOREIGN KEY (`idEquipe`)
    REFERENCES `oficina`.`Equipe` (`idEquipe`)
);


-- -----------------------------------------------------
-- Table `oficina`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `celular` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`)
);


-- -----------------------------------------------------
-- Table `oficina`.`Veiculo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Veiculo` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Veiculo` (
  `idCliente` INT NOT NULL,
  `renavan` VARCHAR(45) NOT NULL,
  `placa` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`, `renavan`),
  CONSTRAINT `fk_Veiculo_Cliente1`
    FOREIGN KEY (`idCliente`)
    REFERENCES `oficina`.`Cliente` (`idCliente`)
);


-- -----------------------------------------------------
-- Table `oficina`.`Ordem_de_Servico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Ordem_de_Servico` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Ordem_de_Servico` (
    `idCliente` INT NOT NULL,
    `renavan` VARCHAR(45) NOT NULL,
    `idEquipe` INT NOT NULL,
    `dataEmissao` VARCHAR(45) NULL,
    `dataEntrega` VARCHAR(45) NULL,
    `status` ENUM('NOVO', 'CANCELADO', 'AVALIADO', 'APROVADO', 'CONCLUIDO') NULL DEFAULT 'NOVO',
    PRIMARY KEY (`idCliente` , `renavan` , `idEquipe`),
    CONSTRAINT `fk_Ordem_de_Servico_Veiculo1` FOREIGN KEY (`idCliente` , `renavan`)
        REFERENCES `oficina`.`Veiculo` (`idCliente` , `renavan`)
        ON DELETE NO ACTION ON UPDATE NO ACTION,
    CONSTRAINT `fk_Ordem_de_Servico_Equipe1` FOREIGN KEY (`idEquipe`)
        REFERENCES `oficina`.`Equipe` (`idEquipe`)
);


-- -----------------------------------------------------
-- Table `oficina`.`Peca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Peca` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Peca` (
  `idPeca` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`idPeca`)
  );


-- -----------------------------------------------------
-- Table `oficina`.`Mao_de_Obra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Mao_de_Obra` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Mao_de_Obra` (
    `idMao_de_Obra` INT NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(45) NULL,
    `valor` FLOAT NULL,
    PRIMARY KEY (`idMao_de_Obra`)
);

-- -----------------------------------------------------
-- Table `oficina`.`Ordem_de_Servico_has_Mao_de_Obra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Ordem_de_Servico_has_Mao_de_Obra` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Ordem_de_Servico_has_Mao_de_Obra` (
  `idCliente` INT NOT NULL,
  `renavan` VARCHAR(45) NOT NULL,
  `idEquipe` INT NOT NULL,
  `idMao_de_Obra` INT NOT NULL,
  PRIMARY KEY (`idCliente`, `renavan`, `idEquipe`, `idMao_de_Obra`),
  CONSTRAINT `fk_Ordem_de_Servico_has_Mao_de_Obra_Ordem_de_Servico1`
    FOREIGN KEY (`idCliente` , `renavan` , `idEquipe`)
    REFERENCES `oficina`.`Ordem_de_Servico` (`idCliente` , `renavan` , `idEquipe`),
  CONSTRAINT `fk_Ordem_de_Servico_has_Mao_de_Obra_Mao_de_Obra1`
    FOREIGN KEY (`idMao_de_Obra`)
    REFERENCES `oficina`.`Mao_de_Obra` (`idMao_de_Obra`)
);

-- -----------------------------------------------------
-- Table `oficina`.`Ordem_de_Servico_has_Peca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oficina`.`Ordem_de_Servico_has_Peca` ;

CREATE TABLE IF NOT EXISTS `oficina`.`Ordem_de_Servico_has_Peca` (
  `idCliente` INT NOT NULL,
  `renavan` VARCHAR(45) NOT NULL,
  `idEquipe` INT NOT NULL,
  `idPeca` INT NOT NULL,
  PRIMARY KEY (`idCliente`, `renavan`, `idEquipe`, `idPeca`),
  INDEX `fk_Ordem_de_Servico_has_Peca_Peca1_idx` (`idPeca` ASC) VISIBLE,
  INDEX `fk_Ordem_de_Servico_has_Peca_Ordem_de_Servico1_idx` (`idCliente` ASC, `renavan` ASC, `idEquipe` ASC) VISIBLE,
  CONSTRAINT `fk_Ordem_de_Servico_has_Peca_Ordem_de_Servico1`
    FOREIGN KEY (`idCliente` , `renavan` , `idEquipe`)
    REFERENCES `oficina`.`Ordem_de_Servico` (`idCliente` , `renavan` , `idEquipe`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ordem_de_Servico_has_Peca_Peca1`
    FOREIGN KEY (`idPeca`)
    REFERENCES `oficina`.`Peca` (`idPeca`)
);
