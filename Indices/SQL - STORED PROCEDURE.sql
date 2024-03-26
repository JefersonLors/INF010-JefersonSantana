CREATE OR REPLACE PROCEDURE insere_idx()
LANGUAGE SQL
AS $$
	UPDATE indice
		SET idx = ((idh_educacao * idh_educacao) * idh_longevidade)/idh_geral;
$$


DROP PROCEDURE insere_idx

CALL insere_idx();

