SELECT * FROM Equipe;
SELECT * FROM Equipe NATURAL JOIN Mecanico;
 
SELECT * FROM Cliente;
SELECT * FROM Cliente NATURAL JOIN Veiculo ORDER BY nome;
SELECT * FROM Cliente NATURAL JOIN Veiculo  NATURAL JOIN Ordem_de_Servico ORDER BY nome;
