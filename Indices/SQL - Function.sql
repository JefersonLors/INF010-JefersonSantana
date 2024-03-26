CREATE OR REPLACE FUNCTION insere_idx_function() RETURNS trigger
LANGUAGE plpgsql
AS $$
	BEGIN 
	UPDATE indice
		SET idx = ((idh_educacao * idh_educacao) * idh_longevidade)/idh_geral;
		RETURN NEW;
	END
$$;


SELECT insere_idx_function() as valor;

DROP FUNCTION insere_idx_function()