-- Para a base de dados IDH:

-- 1 - Municípios que não pertencem a região norte
    -- inicial
    SELECT m.nomemunicipio
    FROM municipio m
        JOIN estado e
            ON m.codestado = e.codestado
        JOIN regiao r
            ON e.codregiao = r.codregiao
    WHERE UPPER(r.nomeregiao) NOT LIKE UPPER('Norte');

    --v final
	SELECT m.nomemunicipio
        FROM municipio m
            JOIN estado e
                ON m.codestado = e.codestado
            JOIN regiao r
                ON e.codregiao = r.codregiao
        WHERE r.nomeregiao <> 'Norte';

-- 2 - Municípios que possuem o mesmo nome
    -- v final
	SELECT m.nomemunicipio
    FROM estado e
        JOIN municipio m
            ON m.codestado = e.codestado
    GROUP BY m.nomemunicipio
    HAVING COUNT(nomemunicipio) > 1;
	
-- 3 - Média de municípios por Região
	-- v final
	SELECT r.nomeregiao,
	       COUNT(DISTINCT(e.codestado)) AS qtd_estados,
	       COUNT(m.codmunicipio) AS qtd_municipios,
	       (COUNT(m.codmunicipio)/COUNT(DISTINCT(e.siglaestado))) AS media_municipios
        FROM regiao r
            JOIN estado e
                ON e.codregiao = r.codregiao
            JOIN municipio m
                ON m.codestado = e.codestado
	GROUP BY r.nomeregiao;

-- 4 - Sigla dos estados com as respectivas quantidades de municípios
    -- v final
    SELECT e.siglaestado AS estado,
            COUNT(m.nomemunicipio) AS qtd_municipios
    FROM estado e
        JOIN municipio m
            ON m.codestado = e.codestado
    GROUP BY e.siglaestado
    ORDER BY qtd_municipios DESC;

-- 5 - Município com as pessoas mais idosas
    -- v inicial
    SELECT m.codmunicipio, m.nomemunicipio
    FROM indice i
        JOIN municipio m
            ON m.codmunicipio = i.codmunicipio
    ORDER BY i.idh_longevidade DESC
    LIMIT 1;

    -- v final
    SELECT i.codmunicipio, m.nomemunicipio
    FROM (SELECT codmunicipio
            FROM indice
            ORDER BY idh_longevidade DESC
            LIMIT 1) i
        JOIN municipio m
            ON m.codmunicipio = i.codmunicipio;

-- 6 - Ano em que Salvador obteve o melhor índice de Instrução
    -- v inicial
    SELECT i.ano
    FROM indice i
        JOIN municipio m
            ON m.codmunicipio = i.codmunicipio
    WHERE UPPER(m.nomemunicipio) NOT LIKE UPPER('Salvador')
    ORDER BY i.idh_educacao DESC
    LIMIT 1;

    -- v final
    SELECT i.ano
    FROM indice i
        JOIN (SELECT codmunicipio
                FROM municipio
                WHERE nomemunicipio = 'Salvador') m
            ON m.codmunicipio = i.codmunicipio
    ORDER BY i.idh_educacao DESC
    LIMIT 1;

-- 7 - Qual o município com a melhor distribuição de renda
	-- v inicial
	SELECT m.nomemunicipio AS Município
	FROM indice i
		JOIN municipio m
			ON m.codmunicipio = i.codmunicipio
	ORDER BY i.idh_renda DESC
	LIMIT 1;

	-- v final
	SELECT m.nomemunicipio AS Município
	FROM (SELECT codmunicipio
		  FROM indice
		  ORDER BY idh_renda DESC
		  LIMIT 1) i
		JOIN municipio m
			ON m.codmunicipio = i.codmunicipio;
-- 8 - Quais estados possuem municípios com IDH geral maior que 0,8

    --v inicial
    SELECT DISTINCT e.siglaestado AS estado
    FROM indice i
        JOIN municipio m
            ON m.codmunicipio = i.codmunicipio
        JOIN estado e
            ON e.codestado = m.codestado
    WHERE i.idh_geral > 0.8
    ORDER BY estado;

    -- v final
    SELECT e.siglaestado AS estado
    FROM (SELECT codmunicipio
            FROM indice
            WHERE idh_geral > 0.8) i
        JOIN municipio m
            ON m.codmunicipio = i.codmunicipio
        JOIN estado e
            ON e.codestado = m.codestado
    GROUP BY estado
    ORDER BY estado;

-- 9 - Qual o maior IDH de educação por estado
	-- v final
	SELECT e.siglaestado AS estado,
		   MAX(i.idh_educacao) as max_idh_educacao
	FROM indice i
		JOIN municipio m
			ON m.codmunicipio = i.codmunicipio
		JOIN estado e
			ON e.codestado = m.codestado
	GROUP BY e.siglaestado
	ORDER BY max_idh_educacao DESC;

-- 10 - Relatório de Todos IDHs da Bahia de 91 e 2000, inclusive com a diferença entre os mesmos
    -- v final
    CREATE OR REPLACE view Relatorio_IDH_Bahia_1991_2000 AS
        SELECT e.siglaestado AS estado,
               i.ano,
               m.nomemunicipio AS município,
               i.idh_educacao,
               i.idh_renda,
               i.idh_geral,
               i.idh_longevidade
        FROM (SELECT*
              FROM indice
              WHERE ano = 1991 OR ano = 2000) i
            JOIN municipio m
                ON m.codmunicipio = i.codmunicipio
            JOIN (SELECT*
                  FROM estado
                  WHERE siglaestado = 'BA') e
                ON e.codestado = m.codestado
        ORDER BY e.siglaestado,
                 i.ano,
                 m.nomemunicipio;

    -- Diferença
    CREATE materialized view RELATORIO_IDH_BAHIA_1991_2000_COM_DIFERENCA AS
        SELECT R_1991.estado,
               R_1991.município,
               R_2000.idh_educacao AS idh_educacao_2000,
               R_1991.idh_educacao AS idh_educacao_1991,
               R_2000.idh_educacao - R_1991.idh_educacao AS dif_idh_educacao,
               R_2000.idh_renda AS idh_renda_2000,
               R_1991.idh_renda AS idh_renda_1991,
               R_2000.idh_renda - R_1991.idh_renda AS dif_idh_renda,
               R_2000.idh_geral AS idh_geral_2000,
               R_1991.idh_geral AS idh_geral_1991,
               R_2000.idh_geral - R_1991.idh_geral AS dif_idh_geral,
               R_2000.idh_longevidade AS idh_longevidade_2000,
               R_1991.idh_longevidade AS idh_longevidade_1991,
               R_2000.idh_longevidade - R_1991.idh_longevidade AS dif_idh_longevidade
        FROM Relatorio_IDH_Bahia_1991_2000 R_1991
            JOIN (SELECT*
                  FROM Relatorio_IDH_Bahia_1991_2000
                  WHERE ano = 2000) R_2000
            ON R_2000.município = R_1991.município
        WHERE R_1991.ano = 1991
        ORDER BY R_1991.estado,
                 R_1991.ano,
                 R_1991.município;

    DROP MATERIALIZED VIEW RELATORIO_IDH_BAHIA_1991_2000_COM_DIFERENCA;

    SELECT*
        FROM RELATORIO_IDH_BAHIA_1991_2000_COM_DIFERENCA;

-- 11 - Relatório comparativo entre as médias dos IDHs de SC e AL, de 2000 e 91
        -- v final
        DROP VIEW VW_MEDIAS_IDHS_SC_AL;

        CREATE OR REPLACE VIEW VW_MEDIAS_IDHS_SC_AL AS
            SELECT e.siglaestado,
                   i.ano,
                   AVG(i.idh_educacao) AS avg_idh_educacao,
                   AVG(i.idh_renda) AS avg_idh_renda,
                   AVG(i.idh_geral) AS avg_idh_geral,
                   AVG(i.idh_longevidade) AS avg_idh_longevidade
            FROM (SELECT*
                  FROM indice
                  WHERE ano = 2000 OR ano = 1991) i
                JOIN municipio m
                    ON m.codmunicipio = i.codmunicipio
                JOIN (SELECT*
                      FROM estado
                      WHERE siglaestado = 'SC'
                            OR siglaestado = 'AL') e
                    ON e.codestado = m.codestado
            GROUP BY e.siglaestado, i.ano;

        DROP MATERIALIZED VIEW VW_MAT_RELATORIO_COMPARATIVO_MEDIA_IDHS_SC_AL;

        CREATE MATERIALIZED VIEW VW_MAT_RELATORIO_COMPARATIVO_MEDIA_IDHS_SC_AL AS
            SELECT MAL.ano,
                    ROUND(mal.avg_idh_educacao, 4) AS avg_idh_edu_al,
                    ROUND(msc.avg_idh_educacao, 4) AS avg_idh_edu_sc,
                    ROUND(mal.avg_idh_renda, 4) AS avg_idh_renda_al,
                    ROUND(msc.avg_idh_renda, 4) AS avg_idh_renda_sc,
                    ROUND(mal.avg_idh_geral, 4) AS avg_idh_geral_al,
                    ROUND(msc.avg_idh_geral, 4) AS avg_idh_geral_sc,
                    ROUND(mal.avg_idh_longevidade, 4) AS avg_idh_long_al,
                    ROUND(msc.avg_idh_longevidade, 4) AS avg_idh_long_sc
                FROM (SELECT*
                      FROM VW_MEDIAS_IDHS_SC_AL
                      WHERE siglaestado = 'AL') mal
                    JOIN (SELECT*
                          FROM VW_MEDIAS_IDHS_SC_AL
                          WHERE siglaestado = 'SC') msc
                        ON MAL.ano = MSC.ano;
        SELECT*
            FROM VW_MAT_RELATORIO_COMPARATIVO_MEDIA_IDHS_SC_AL;


-- ################################################
-- Parte 2

-- 1- Gerar um relatório com todos os departamentos, professores, turmas e média das notas dos alunos em cada turma entre 2006 a 2010.
    ALTER TABLE takes
        ADD COLUMN equivalent_grade numeric(4,2);

    UPDATE takes SET equivalent_grade = 10 WHERE grade = 'A+';
    UPDATE takes SET equivalent_grade = 9 WHERE grade = 'A ';
    UPDATE takes SET equivalent_grade = 8 WHERE grade = 'A-';
    UPDATE takes SET equivalent_grade = 7 WHERE grade = 'B+';
    UPDATE takes SET equivalent_grade = 6 WHERE grade = 'B ';
    UPDATE takes SET equivalent_grade = 5 WHERE grade = 'B-';
    UPDATE takes SET equivalent_grade = 4 WHERE grade = 'C+';
    UPDATE takes SET equivalent_grade = 3 WHERE grade = 'C ';
    UPDATE takes SET equivalent_grade = 2 WHERE grade = 'C-';

    -- A+ = 10
    -- A  = 9
    -- A- = 8

    -- B+ = 7
    -- B  = 6
    -- B- = 5

    -- C+ = 4
    -- C  = 3
    -- C- = 2

  
    -- departamentos, professores, turmas e notas
    SELECT c.dept_name as curso_depart,
           c.title as curso,
           c.course_id as cod_curso,
           i.name as professor,
           te.id as cod_professor,
           s.year as ano,
           s.semester as semestre,
           s.sec_id as secao,
           AVG(ta.equivalent_grade) as media_turma
    FROM (SELECT*
          FROM section
          WHERE year BETWEEN 2006 AND 2010) s
        JOIN course c
            ON c.course_id = s.course_id
        JOIN takes ta
            ON ta.course_id = s.course_id
                AND ta.sec_id = s.sec_id
                AND ta.semester = s.semester
                AND ta.year = s.year
        JOIN teaches te
            ON te.course_id = s.course_id
                AND te.sec_id = s.sec_id
                AND te.semester = s.semester
                AND te.year = s.year
        JOIN instructor i
            ON i.id = te.id
    GROUP BY (c.dept_name,
              c.course_id,
              i.name,
              te.id,
              c.title,
              s.course_id,
              s.sec_id,
              s.semester,
              s.year)
    ORDER BY (s.year,
              s.semester,
              s.sec_id,
              s.course_id);

-- 2- Gerar relatório com nome do aluno, disciplinas cursadas com respectivos professores das turmas e notas e respectivo departamento dos professores
    SELECT s.name as aluno,
           c.title as disciplina,
           i.name as professor,
           i.dept_name as professor_depart,
           ta.year as ano,
           ta.semester as semestre,
           ta.sec_id as secao,
           ta.grade as nota,
           ta.equivalent_grade as nota_equivalente
    FROM takes ta
        JOIN student s
            ON s.id = ta.id
        JOIN course c
            ON c.course_id = ta.course_id
        JOIN teaches te
            ON te.course_id = ta.course_id
                AND te.sec_id = ta.sec_id
                AND te.semester = ta.semester
                AND te.year = ta.year
        JOIN instructor i
            ON i.id = te.id
    ORDER BY (s.name,
              ta.year,
              ta.semester,
              ta.sec_id,
               c.title);



