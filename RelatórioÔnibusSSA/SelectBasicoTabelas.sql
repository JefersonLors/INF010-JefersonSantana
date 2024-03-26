-- Tabelas
SELECT * FROM Turno;
SELECT * FROM Escala;
SELECT * FROM Regiao;
SELECT * FROM Concessionaria;
SELECT * FROM Itinerario;
SELECT * FROM Tipo_Onibus;
SELECT * FROM Tipo_Viagem;
SELECT * FROM Funcao;
SELECT * FROM Tipo_Cartao;
SELECT * FROM Tipo_Passagem;
SELECT * FROM Passageiro;
SELECT * FROM Consorcio;

-- Tables with foreign keys referencing previously created tables
SELECT * FROM Linha;
SELECT * FROM Onibus;
SELECT * FROM Funcionario;
SELECT * FROM Viagem order by codigo_viagem;
SELECT * FROM Cartao_Passagem order by codigo_cartao_passagem;
SELECT * FROM Viagem_Funcionario;
SELECT * FROM Viagem_Cartao_Passagem;

-- Tables with foreign keys referencing multiple previously created tables
SELECT * FROM Area_Operacional;
SELECT * FROM Regiao_Linha;
SELECT * FROM Regiao_Linha_Area_Operacional;
SELECT * FROM Consorcio_Concessionaria;
