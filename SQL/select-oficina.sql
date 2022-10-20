USE oficina;

-- Seleciona todas as equipes
SELECT * FROM Equipe;

-- Seleciona os mecanicos da equipe 01
SELECT * FROM Equipe NATURAL JOIN Mecanico
WHERE idEquipe = 1;
 
-- Seleciona os clientes com seus veículos ordenados pelo nome do cliente
SELECT * FROM Cliente NATURAL JOIN Veiculo ORDER BY nome;

-- Seleciona nome do cliente e status da ordem de serviço
SELECT nome, status FROM Cliente NATURAL JOIN Veiculo NATURAL JOIN Ordem_de_Servico ORDER BY nome;


-- Seleciona as peças de uma ordem de servico
SELECT 
    *
FROM
    Cliente
        NATURAL JOIN
    Veiculo
        NATURAL JOIN
    Ordem_de_Servico
        NATURAL JOIN
    Ordem_de_Servico_has_Peca
		INNER JOIN	
        Peca
        ON
        Ordem_de_Servico_has_Peca.idPeca = Peca.idPeca
ORDER BY Cliente.nome;

-- Seleciona clientes com mais de um veículo
SELECT DISTINCT
    nome, COUNT(nome) AS 'Número de veículos'
FROM
    Cliente
        NATURAL JOIN
    Veiculo
GROUP BY nome
HAVING COUNT(nome) > 1;


