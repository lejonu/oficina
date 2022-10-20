-- Equipes
INSERT INTO `oficina`.`Equipe` (`nomeEquipe`) VALUES ('Equipe01');
INSERT INTO `oficina`.`Mecanico` (`nomeMecanico`, `endereco`, `especialidade`, `idEquipe`) VALUES ('Luna Simone Lara Carvalho', 'Alameda Ivone, 432', 'Eletricista', '1');
INSERT INTO `oficina`.`Mecanico` (`nomeMecanico`, `endereco`, `especialidade`, `idEquipe`) VALUES ('Eduardo César Silveira', 'Acesso S Dois, 211', 'Mecânico de Motores', '1');
INSERT INTO `oficina`.`Mecanico` (`nomeMecanico`, `endereco`, `especialidade`, `idEquipe`) VALUES ('Kaique Danilo Juan Brito', 'Rua do Buriti, 108', 'Mecânico de Amortecedores', '1');

INSERT INTO `oficina`.`Equipe` (`nomeEquipe`) VALUES ('Equipe02');
INSERT INTO `oficina`.`Mecanico` (`nomeMecanico`, `endereco`, `especialidade`, `idEquipe`) VALUES ('Severino Julio Pires', 'Quadra Dezessete, 52', 'Eletricista', '2');
INSERT INTO `oficina`.`Mecanico` (`nomeMecanico`, `endereco`, `especialidade`, `idEquipe`) VALUES ('Isabel Ana Eduarda Duarte', 'Rua Ali Salim Ubaiz, 935', 'Mecânico de Motores', '2');
INSERT INTO `oficina`.`Mecanico` (`nomeMecanico`, `endereco`, `especialidade`, `idEquipe`) VALUES ('Manuela Nina Rita Teixeira', 'Via Local E-2-Núcleo D, 45', 'Mecânico de Amortecedores', '2');

-- Clientes
INSERT INTO `oficina`.`Cliente` (`nome`, `telefone`, `celular`, `endereco`) VALUES ('Raquel Marlene Caldeira', '(82) 3739-4993', '(82) 99302-9229', 'Travessa Mundaú, 768');
INSERT INTO `oficina`.`Cliente` (`nome`, `telefone`, `celular`, `endereco`) VALUES ('Marília Soares', '(82) 3739-4993', '(82) 9643-4327', 'Avenida Central, 54');
INSERT INTO `oficina`.`Cliente` (`nome`, `telefone`, `celular`, `endereco`) VALUES ('Antônio Moreira', '(82) 3242-3552', '(82) 98765-4564', 'Rua Cortês, 68');

-- Veículos
INSERT INTO `oficina`.`Veiculo` (`idCliente`, `renavan`, `placa`) VALUES ('1', '37576433178', 'HPJ-3086');
INSERT INTO `oficina`.`Veiculo` (`idCliente`, `renavan`, `placa`) VALUES ('1', '45119519119', 'HOS-2130');
INSERT INTO `oficina`.`Veiculo` (`idCliente`, `renavan`, `placa`) VALUES ('1', '59979174104', 'MFV-5991');
INSERT INTO `oficina`.`Veiculo` (`idCliente`, `renavan`, `placa`) VALUES ('2', '62073539295', 'LJV-8129');
INSERT INTO `oficina`.`Veiculo` (`idCliente`, `renavan`, `placa`) VALUES ('3', '15180063608', 'MMR-9753');

-- Ordens de Serviço
INSERT INTO `oficina`.`Ordem_de_Servico` (`idCliente`, `renavan`, `idEquipe`, `dataEmissao`, `dataEntrega`) VALUES ('1', '37576433178','1','2022-10-14', '2022-10-21');
INSERT INTO `oficina`.`Ordem_de_Servico` (`idCliente`, `renavan`, `idEquipe`, `dataEmissao`, `dataEntrega`) VALUES ('1', '45119519119','1','2022-10-14', '2022-10-21');
INSERT INTO `oficina`.`Ordem_de_Servico` (`idCliente`, `renavan`, `idEquipe`, `dataEmissao`, `dataEntrega`) VALUES ('1', '59979174104','1', '2022-10-14', '2022-10-21');

-- Peças
INSERT INTO `oficina`.`Peca` (`nome`, `valor`) VALUES ('Repimboca da Parafuseta', '1');
INSERT INTO `oficina`.`Ordem_de_Servico_has_Peca` (`idCliente`, `renavan`, `idEquipe`, `idPeca`) VALUES ('1', '37576433178', '1', '1');

-- Mão de Obra
INSERT INTO `oficina`.`Mao_de_Obra` (`nome`, `valor`) VALUES ('Troca da repimboca da parafuseta', '25');
INSERT INTO `oficina`.`Ordem_de_Servico_has_Mao_de_Obra` (`idCliente`, `renavan`, `idEquipe`, `idMao_de_Obra`) VALUES ('1', '37576433178', '1', '1');

UPDATE `oficina`.`Ordem_de_Servico` SET `status` = 'AVALIADO' WHERE (`idCliente` = '1') and (`renavan` = '37576433178') and (`idEquipe` = '1');
UPDATE `oficina`.`Ordem_de_Servico` SET `status` = 'APROVADO' WHERE (`idCliente` = '1') and (`renavan` = '37576433178') and (`idEquipe` = '1');
UPDATE `oficina`.`Ordem_de_Servico` SET `status` = 'CONCLUIDO' WHERE (`idCliente` = '1') and (`renavan` = '37576433178') and (`idEquipe` = '1');

