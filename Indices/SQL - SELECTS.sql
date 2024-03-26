-- Select para a tabela Regiao
SELECT * FROM Regiao;

-- Select para a tabela Estado
SELECT * FROM Estado;

-- Select para a tabela Municipio
SELECT * FROM Municipio;

-- Select para a tabela Indice
SELECT * FROM Indice;

SELECT codmunicipio, 
		ano, 
		idh_geral, 
		idh_renda, 
		idh_longevidade, 
		idh_educacao, 
		CAST( idx as decimal(10,2)) AS idx 
FROM indice
ORDER BY codmunicipio


UPDATE indice
	SET idh_educacao = 5
	WHERE codmunicipio = 110001
