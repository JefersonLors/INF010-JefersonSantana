CREATE OR REPLACE TRIGGER atualiza_idx
	AFTER UPDATE ON indice
	FOR EACH ROW
		WHEN( OLD.idh_educacao IS DISTINCT FROM NEW.idh_educacao 
			  OR OLD.idh_longevidade IS DISTINCT FROM NEW.idh_longevidade 
			  OR OLD.idh_geral IS DISTINCT FROM NEW.idh_geral )	
			EXECUTE FUNCTION insere_idx_function();