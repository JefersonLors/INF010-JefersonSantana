CREATE MATERIALIZED VIEW IF NOT EXISTS relatorio_transporte_publico_rodoviario_ssa
AS
	SELECT l.codigo_linha,
			v.data,
			count (vcp.codigo_cartao_passagem) AS qtd_passageiro,
			sum(tp.preco) AS total
			FROM viagem v
	LEFT JOIN viagem_cartao_passagem vcp ON v.codigo_viagem = vcp.codigo_viagem
		JOIN linha l ON v.codigo_linha = l.codigo_linha
		JOIN cartao_passagem cp ON cp.codigo_cartao_passagem = vcp.codigo_cartao_passagem
		JOIN tipo_passagem tp ON cp.codigo_tipo_passagem = tp.codigo_tipo_passagem
	GROUP BY l.codigo_linha, v.data
 	ORDER BY l.codigo_linha
	
	
DROP MATERIALIZED VIEW IF EXISTS relatorio_transporte_publico_rodoviario_ssa

REFRESH MATERIALIZED VIEW relatorio_transporte_publico_rodoviario_ssa

SELECT*
FROM relatorio_transporte_publico_rodoviario_ssa
