INSERT INTO Regiao (Descricao)
VALUES ('Norte'),
		('Sul'),
		('Leste'),
		('Oeste');

INSERT INTO Concessionaria (Nome, Frota_Disponivel)
VALUES ('Viação Cometa', 100),
		('Expresso Guanabara', 50),
		('Gontijo', 75),
		  ('Viação Itapemirim', 80),
		  ('Viação São Geraldo', 60),
		  ('Viação Progresso', 70),
		  ('Viação Águia Branca', 65),
		  ('Viação Catarinense', 45),
		  ('Viação Garcia', 55),
		  ('Viação Nordeste', 40),
		  ('Viação Penha', 30),
		  ('Viação Novo Horizonte', 25),
		  ('Viação Nacional Expresso', 35),
		  ('Viação São João', 20),
		  ('Viação Ouro e Prata', 50),
		  ('Viação Transbrasiliana', 45),
		  ('Viação Motta', 60),
		  ('Viação Rápido Federal', 70);

INSERT INTO Itinerario (Descricao)
VALUES ('Rio de Janeiro - São Paulo'),
       ('São Paulo - Belo Horizonte'),
       ('Belo Horizonte - Brasília'),
       ('Campinas - São Paulo'),
       ('Porto Alegre - Florianópolis'),
       ('Curitiba - São Paulo'),
       ('Salvador - Recife'),
       ('Fortaleza - Natal'),
       ('Manaus - Belém'),
       ('Goiânia - Brasília'),
       ('Belo Horizonte - Rio de Janeiro'),
       ('São Paulo - Campinas'),
       ('Brasília - Goiânia'),
       ('Recife - Salvador'),
       ('Natal - Fortaleza'),
       ('Belém - Manaus'),
       ('Florianópolis - Porto Alegre'),
       ('São Paulo - Curitiba'),
       ('Aracaju - Maceió'),
       ('Vitória - Rio de Janeiro');

INSERT INTO Tipo_Onibus (Descricao, Lotacao_Maxima, Numero_Acentos)
VALUES ('Micro-ônibus', 40, 20),
		('Comum', 50, 30),
		('Viagem', 60, 40);

INSERT INTO Tipo_Viagem (Descricao)
VALUES ('Urbano'),
		('Intermunicipal'),
		('Interestadual');

INSERT INTO Funcao (Descricao)
VALUES ('Motorista'),
		('Cobrador'),
		('Guia Turístico'),
		('Fiscal');

INSERT INTO Turno (Descricao)
VALUES ('Matutino'),
		('Vespertino'),
		('Noturno');

INSERT INTO Tipo_Cartao (Descricao)
VALUES ('Avulso'),
		('Pessoal');

INSERT INTO Tipo_Passagem (Descricao, Preco)
VALUES ('Inteira', 5.00),
		('Meia', 2.50),
		('Gratuidade', 0.0);

INSERT INTO Passageiro (Nome, Foto, Digital, CPF)
VALUES ('João Silva', 'foto.jpg', '1234567890', '123.456.789-01'),
		('Maria Oliveira', 'foto2.jpg', '9876543210', '234.567.890-12'),
		('Pedro Oliveira', 'foto3.jpg', 'digital3', '345.678.901-23'),
		('Ana Santos', 'foto4.jpg', 'digital4', '456.789.012-34'),
		('Carlos Costa', 'foto5.jpg', 'digital5', '567.890.123-45'),
		('Juliana Pereira', 'foto6.jpg', 'digital6', '678.901.234-56'),
		('Lucas Carvalho', 'foto7.jpg', 'digital7', '789.012.345-67'),
		('Fernanda Mendes', 'foto8.jpg', 'digital8', '890.123.456-78'),
		('Rafael Lima', 'foto9.jpg', 'digital9', '901.234.567-89');

INSERT INTO Consorcio (Nome)
VALUES ('Consórcio ABC'),
		('Consórcio DEF'),
		('Consórcio GHI');

INSERT INTO Linha (Codigo_Itinerario)
VALUES
  ((SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'Rio de Janeiro - São Paulo')),
  ((SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'São Paulo - Belo Horizonte')),
  ((SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'Belo Horizonte - Brasília')),
    ((SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'Campinas - São Paulo')),
  ((SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'Porto Alegre - Florianópolis')),
  ((SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'Salvador - Recife')),
    ((SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'Fortaleza - Natal')),
  ((SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'Manaus - Belém')),
  ((SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'Goiânia - Brasília')),
    ((SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'Belo Horizonte - Rio de Janeiro')),
  ((SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'São Paulo - Campinas')),
  ((SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'Brasília - Goiânia'));

INSERT INTO Onibus (Codigo_Onibus, Placa_Onibus, Codigo_Tipo_Onibus, Codigo_Concessionaria)
VALUES
  (1, 'ABC1234', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Micro-ônibus'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Viação Cometa')),
  (2, 'DEF5678', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Comum'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Expresso Guanabara')),
  (3, 'GHI9012', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Viagem'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Gontijo')),
  (4, 'JKL3456', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Micro-ônibus'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Viação Cometa')),
  (5, 'MNO7890', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Comum'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Expresso Guanabara')),
  (6, 'PQR1234', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Viagem'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Gontijo')),
  (7, 'STU5678', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Micro-ônibus'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Viação Cometa')),
  (8, 'VWX9012', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Comum'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Expresso Guanabara')),
  (9, 'YZA2345', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Viagem'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Gontijo')),
  (10, 'VWX1234', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Micro-ônibus'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Viação Cometa')),
  (11, 'XYZ5678', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Comum'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Expresso Guanabara')),
  (12, 'ABC9012', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Viagem'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Gontijo')),
  (13, 'MNO1234', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Micro-ônibus'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Viação Cometa')),
  (14, 'ABC2345', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Micro-ônibus'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Viação Cometa')),
  (15, 'DEF4567', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Comum'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Expresso Guanabara')),
  (16, 'GHI6789', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Viagem'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Gontijo')),
  (17, 'JKL8901', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Micro-ônibus'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Viação Cometa')),
  (18, 'MNO0123', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Comum'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Expresso Guanabara')),
  (19, 'PQR2345', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Viagem'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Gontijo')),
  (20, 'STU4567', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Micro-ônibus'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Viação Cometa')),
  (21, 'VWX6789', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Comum'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Expresso Guanabara')),
  (22, 'YZA8901', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Viagem'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Gontijo')),
  (23, 'VWX0123', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Micro-ônibus'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Viação Cometa')),
  (24, 'XYZ2345', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Comum'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Expresso Guanabara')),
  (25, 'ABC4567', (SELECT Codigo_Tipo_Onibus FROM Tipo_Onibus WHERE Descricao = 'Viagem'), (SELECT Codigo_Concessionaria FROM Concessionaria WHERE Nome = 'Expresso Guanabara'));

create sequence  funcionario_pk start with 1

INSERT INTO Funcionario (matricula, Nome, Codigo_Escala, Codigo_Funcao)
VALUES
  (1, 'Ricardo Oliveira', 1, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Motorista')),
  (2, 'Isabela Santos', 2, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Cobrador')),
  (3, 'Márcio Costa', 3, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Guia Turístico')),
  (4, 'Aline Pereira', 1, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Motorista')),
  (5, 'Marcela Souza', 2, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Cobrador')),
  (6, 'Thiago Oliveira', 3, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Guia Turístico')),
  (7, 'Carolina Silva', 1, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Motorista')),
  (8, 'Guilherme Costa', 2, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Cobrador')),
  (9, 'Larissa Oliveira', 3, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Guia Turístico')),
  (10, 'Rodrigo Pereira', 1, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Motorista')),
  (11, 'Patrícia Souza', 2, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Cobrador')),
  (12, 'Felipe Santos', 3, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Guia Turístico')),
  (13, 'Vanessa Costa', 1, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Motorista')),
  (14, 'Luciana Oliveira', 2, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Cobrador')),
  (15, 'Roberto Silva', 3, (SELECT Codigo_Funcao FROM Funcao WHERE Descricao = 'Guia Turístico'));

INSERT INTO Escala (Codigo_Turno, hora_Inicio_Jornada, hora_Fim_Jornada)
VALUES
  ((SELECT Codigo_Turno FROM Turno WHERE Descricao = 'Vespertino'), '08:00:00', '12:00:00'),
  ((SELECT Codigo_Turno FROM Turno WHERE Descricao = 'Matutino'), '14:00:00', '18:00:00'),
  ((SELECT Codigo_Turno FROM Turno WHERE Descricao = 'Noturno'), '20:00:00', '00:00:00');


INSERT INTO Viagem (codigo_viagem, Codigo_Onibus, Codigo_Linha, Dth_Inicio, Origem)
VALUES
  (1, 1, 1, '2024-03-08 10:00:00', 'Rio de Janeiro'),
  (2, 2, 2, '2024-03-08 14:00:00', 'São Paulo'),
  (3, 3, 3, '2024-03-08 20:00:00', 'Belo Horizonte'),
  (4,4, 4, '2024-03-09 08:00:00', 'Brasília'),
  (5,5, 5, '2024-03-09 12:00:00', 'Salvador'),
  (6,6, 6, '2024-03-09 16:00:00', 'Recife'),
  (7,7, 7, '2024-03-10 08:00:00', 'Fortaleza'),
  (8,8, 8, '2024-03-10 12:00:00', 'Manaus'),
  (9,9, 9, '2024-03-10 16:00:00', 'Belém'),
  (10,10, 10, '2024-03-11 08:00:00', 'Porto Alegre'),
  (11,11, 11, '2024-03-11 12:00:00', 'Curitiba'),
  (12,12, 12, '2024-03-11 16:00:00', 'Florianópolis'),
  (13,13, 12, '2024-03-12 08:00:00', 'Goiânia'),
  (14,14, 1, '2024-03-12 12:00:00', 'Rio de Janeiro'),
  (15,15, 2, '2024-03-12 16:00:00', 'São Paulo'),
  (16,16, 3, '2024-03-13 08:00:00', 'Belo Horizonte'),
  (17,17, 4, '2024-03-13 12:00:00', 'Brasília'),
  (18,18, 5, '2024-03-13 16:00:00', 'Salvador'),
  (19,19, 6, '2024-03-14 08:00:00', 'Recife'),
  (20,20, 7, '2024-03-14 12:00:00', 'Fortaleza'),
  (21,21, 8, '2024-03-14 16:00:00', 'Manaus'),
  (22,22, 9, '2024-03-15 08:00:00', 'Belém'),
  (23,23, 10, '2024-03-15 12:00:00', 'Porto Alegre'),
  (24,24, 11, '2024-03-15 16:00:00', 'Curitiba'),
  (25, 25, 12, '2024-03-16 08:00:00', 'Florianópolis');

INSERT INTO Viagem (codigo_viagem, Codigo_Onibus, Codigo_Linha, Dth_Inicio, Origem)
VALUES
  (26, 1, 1, '2024-03-08 10:00:00', 'Rio de Janeiro'),
  (27, 2, 1, '2024-03-08 10:00:00', 'São Paulo'),
  (28, 3, 1, '2024-03-08 10:00:00', 'Belo Horizonte'),
  (29,4, 1, '2024-03-08 10:00:00', 'Brasília'),
  (30,5, 2, '2024-03-08 20:00:00', 'Salvador'),
  (31,6, 2, '2024-03-08 20:00:00', 'Recife'),
  (32,7, 2, '2024-03-08 20:00:00', 'Fortaleza'),
  (33,8, 2, '2024-03-08 20:00:00', 'Manaus'),
  (34,9, 3, '2024-03-10 16:00:00', 'Belém'),
  (35,10, 3, '2024-03-10 16:00:00', 'Porto Alegre'),
  (36,11, 10, '2024-03-11 12:00:00', 'Curitiba'),
  (37,12, 10, '2024-03-11 12:00:00', 'Florianópolis'),
  (38,13, 10, '2024-03-11 12:00:00', 'Goiânia'),
  (39,14, 10, '2024-03-11 12:00:00', 'Rio de Janeiro'),
  (40,15, 12, '2024-03-12 16:00:00', 'São Paulo'),
  (41,16, 3, '2024-03-13 08:00:00', 'Belo Horizonte'),
  (42,17, 3, '2024-03-13 08:00:00', 'Brasília'),
  (43,18, 10, '2024-03-13 16:00:00', 'Salvador'),
  (44,19, 10, '2024-03-13 16:00:00', 'Recife'),
  (45,20, 10, '2024-03-13 16:00:00', 'Fortaleza'),
  (46,21, 8, '2024-03-14 16:00:00', 'Manaus'),
  (47,22, 8, '2024-03-14 16:00:00', 'Belém'),
  (48,23, 10, '2024-03-15 12:00:00', 'Porto Alegre'),
  (49,24, 11, '2024-03-15 16:00:00', 'Curitiba'),
  (50, 25, 12, '2024-03-16 08:00:00', 'Florianópolis');


-- Inserts para a tabela Cartao_Passagem
INSERT INTO Cartao_Passagem (Codigo_Passageiro, Codigo_Tipo_Cartao, Codigo_Tipo_Passagem, Quantidade_Passagem, Data_Validade)
VALUES
  ((SELECT Codigo_Passageiro FROM Passageiro WHERE Nome = 'João Silva'), (SELECT Codigo_Tipo_Cartao FROM Tipo_Cartao WHERE Descricao = 'Avulso'), (SELECT Codigo_Tipo_Passagem FROM Tipo_Passagem WHERE Descricao = 'Inteira'), 1, '2024-03-31'),
  ((SELECT Codigo_Passageiro FROM Passageiro WHERE Nome = 'Maria Oliveira'), (SELECT Codigo_Tipo_Cartao FROM Tipo_Cartao WHERE Descricao = 'Pessoal'), (SELECT Codigo_Tipo_Passagem FROM Tipo_Passagem WHERE Descricao = 'Meia'), 2, '2024-06-30');

ALTER SEQUENCE cartao_passagem_id_seq RESTART WITH 1;
create sequence cartao_passagem_id_seq start with 1

INSERT INTO Cartao_Passagem (Codigo_Cartao_Passagem, Codigo_Passageiro, Codigo_Tipo_Cartao, Codigo_Tipo_Passagem, Quantidade_Passagem, Data_Validade)
SELECT
  nextval('cartao_passagem_id_seq'),
  p.Codigo_Passageiro,
  (SELECT Codigo_Tipo_Cartao FROM Tipo_Cartao WHERE Descricao = 'Avulso'),
  (SELECT Codigo_Tipo_Passagem FROM Tipo_Passagem WHERE Descricao = 'Pessoal'),
  1,
  '2024-03-31'
FROM Passageiro p;

-- Inserts para a tabela Viagem_Funcionario
INSERT INTO Viagem_Funcionario (Codigo_Funcionario, Codigo_Viagem)
VALUES
  ((SELECT Matricula FROM Funcionario WHERE Nome = 'José Santos'), (SELECT Codigo_Viagem FROM Viagem WHERE Origem = 'Rio de Janeiro')),
  ((SELECT Matricula FROM Funcionario WHERE Nome = 'Ana Costa'), (SELECT Codigo_Viagem FROM Viagem WHERE Origem = 'São Paulo')),
  ((SELECT Matricula FROM Funcionario WHERE Nome = 'Pedro Souza'), (SELECT Codigo_Viagem FROM Viagem WHERE Origem = 'Belo Horizonte'));

INSERT INTO Viagem_Funcionario (Codigo_Funcionario, Codigo_Viagem)
VALUES (1, 1),
       (2, 2),
       (3, 3),
       (4, 4),
       (5, 5),
       (6, 6),
       (7, 7),
       (8, 8),
       (9, 9),
       (10, 10),
       (11, 11),
       (12, 12),
       (13, 13),  -- Repeat sequence for remaining Viagem_Funcionario
       (14, 14),
       (15, 15),
       (6, 16),
       (7, 17),
       (8, 18),
       (9, 19),
       (10, 20),
       (1, 21),
       (2, 22),
       (3, 23),
       (4, 24),
       (5, 25);

-- Inserts para a tabela Viagem_Cartao_Passagem
INSERT INTO Viagem_Cartao_Passagem (Codigo_Viagem, Codigo_Cartao_Passagem)
VALUES
  ((SELECT Codigo_Viagem FROM Viagem WHERE Origem = 'Rio de Janeiro'), (SELECT Codigo_Cartao_Passagem FROM Cartao_Passagem WHERE Quantidade_Passagem = 1)),
  ((SELECT Codigo_Viagem FROM Viagem WHERE Origem = 'São Paulo'), (SELECT Codigo_Cartao_Passagem FROM Cartao_Passagem WHERE Quantidade_Passagem = 2));

INSERT INTO Viagem_Cartao_Passagem (Codigo_Viagem, Codigo_Cartao_Passagem)
VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, 4),
  (5, 5),
  (6, 6),
  (7, 7),
  (8, 8),
  (9, 9),
  (10, 1),
  (11, 2),
  (12, 3),
  (13, 4),
  (14, 5),
  (15, 6),
  (16, 7),
  (17, 8),
  (18, 9),
  (19, 1),
  (20, 2),
  (21, 3),
  (22, 4),
  (23, 5),
  (24, 6),
  (25, 7),
INSERT INTO Viagem_Cartao_Passagem (Codigo_Viagem, Codigo_Cartao_Passagem)
VALUES
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5),
  (5, 6),
  (6, 7),
  (7, 8),
  (8, 9),
  (9, 9),
  (1, 3),
  (2, 4),
  (3, 5),
  (4, 6),
  (5, 7),
  (6, 8),
  (7, 9),
  (8, 1),
  (9, 2);

-- Inserts para a tabela Regiao_Linha
INSERT INTO Regiao_Linha (Codigo_Linha, Codigo_Regiao)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 1),
  (5, 2),
  (6, 2),
  (7, 2),
  (8, 2),
  (9, 3),
  (10, 3),
  (11, 3),
  (12, 3),
  (1, 4),
  (2, 4),
  (3, 4),
  (4, 4);

INSERT INTO Area_Operacional( Nome, COR )
VALUES	('Cidade Baixa', 'Verde'),
		('Cidade Alto', 'Amarelo'),
		('Centro', 'Rox');

-- Inserts para a tabela Regiao_Linha_Area_Operacional
INSERT INTO Regiao_Linha_Area_Operacional (Codigo_Regiao_Linha, Codigo_Area_Operacional)
VALUES
  ((SELECT Codigo_Regiao_Linha FROM Regiao_Linha WHERE Codigo_Linha = (SELECT Codigo_Linha FROM Linha WHERE Codigo_Itinerario = (SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'Rio de Janeiro - São Paulo'))) , (SELECT Codigo_Area_Operacional FROM Area_Operacional WHERE Nome = 'Norte')),
  ((SELECT Codigo_Regiao_Linha FROM Regiao_Linha WHERE Codigo_Linha = (SELECT Codigo_Linha FROM Linha WHERE Codigo_Itinerario = (SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'Rio de Janeiro - São Paulo'))) , (SELECT Codigo_Area_Operacional FROM Area_Operacional WHERE Nome = 'Sul')),
  ((SELECT Codigo_Regiao_Linha FROM Regiao_Linha WHERE Codigo_Linha = (SELECT Codigo_Linha FROM Linha WHERE Codigo_Itinerario = (SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'São Paulo - Belo Horizonte'))) , (SELECT Codigo_Area_Operacional FROM Area_Operacional WHERE Nome = 'Sul')),
  ((SELECT Codigo_Regiao_Linha FROM Regiao_Linha WHERE Codigo_Linha = (SELECT Codigo_Linha FROM Linha WHERE Codigo_Itinerario = (SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'São Paulo - Belo Horizonte'))) , (SELECT Codigo_Area_Operacional FROM Area_Operacional WHERE Nome = 'Leste')),
  ((SELECT Codigo_Regiao_Linha FROM Regiao_Linha WHERE Codigo_Linha = (SELECT Codigo_Linha FROM Linha WHERE Codigo_Itinerario = (SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'Belo Horizonte - Brasília'))) , (SELECT Codigo_Area_Operacional FROM Area_Operacional WHERE Nome = 'Leste')),
  ((SELECT Codigo_Regiao_Linha FROM Regiao_Linha WHERE Codigo_Linha = (SELECT Codigo_Linha FROM Linha WHERE Codigo_Itinerario = (SELECT Codigo_Itinerario FROM Itinerario WHERE Descricao = 'Belo Horizonte - Brasília'))) , (SELECT Codigo_Area_Operacional FROM Area_Operacional WHERE Nome = 'Oeste'));

INSERT INTO Consorcio_Concessionaria (Codigo_Concessionaria, Codigo_Consorcio)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (5, 2),
  (6, 2),
  (7, 3),
  (8, 3),
  (9, 3),
  (10, 1),
  (11, 2),
  (12, 3),
  (13, 1),
  (14, 2),
  (15, 3),
  (16, 1),
  (17, 2),
  (18, 3);

INSERT INTO Regiao_Linha_Area_Operacional (Codigo_Regiao_Linha, Codigo_Area_Operacional)
VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 1),
  (5, 1),
  (6, 2),
  (7, 3),
  (8, 3),
  (9, 3),
  (10, 2),
  (11, 2),
  (12, 2);
delete from funcionario
delete from linha
delete from viagem


