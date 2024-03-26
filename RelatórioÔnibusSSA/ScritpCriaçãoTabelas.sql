-- TABELAS
CREATE TABLE IF NOT EXISTS Turno (
    Codigo_Turno SERIAL PRIMARY KEY,
    Descricao VARCHAR UNIQUE
);

CREATE TABLE IF NOT EXISTS Escala (
    Codigo_Escala SERIAL PRIMARY KEY,
    Codigo_Turno INTEGER REFERENCES Turno(Codigo_Turno),
    Hora_Inicio_Jornada TIME,
    Hora_Fim_Jornada TIME
);

ALTER TABLE Cartao_Passagem RENAME COLUMN Dth_Validade to Data_Validade

ALTER TABLE Cartao_Passagem ADD COLUMN Data_Validade DATE
'2024-03-08 10:00:00'


ALTER TABLE VIAGEM 
	ALTER COLUMN Dth_Inicio TYPE DATE


ALTER TABLE VIAGEM RENAME COLUMN Data_Inicio to Data
ALTER TABLE VIAGEM ADD COLUMN Hora_Embarque TIME


UPDATE Viagem 
	SET hora_embarque = '16:00:00'
	WHERE codigo_viagem between 35 AND 51;

UPDATE Viagem 
	SET codigo_tipo_viagem = 2
	WHERE codigo_tipo_viagem IS NULL;

UPDATE Cartao_Passagem 
	SET quantidade_passagem = 10
	WHERE codigo_cartao_passagem in (1, 6, 9, 3);


UPDATE viagem 
	SET Codigo_Tipo_viagem = 1
	WHERE codigo_viagem in (1, 25, 18, 15);
	
UPDATE Cartao_Passagem 
	SET Codigo_Tipo_Cartao = 2
	WHERE codigo_cartao_passagem in (1, 6, 9, 3);

CREATE TABLE IF NOT EXISTS Regiao (
    Codigo_Regiao SERIAL PRIMARY KEY,
    Descricao VARCHAR UNIQUE
);

CREATE TABLE IF NOT EXISTS Concessionaria (
    Codigo_Concessionaria SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Frota_Disponivel INTEGER
);

CREATE TABLE IF NOT EXISTS Itinerario (
    Codigo_Itinerario SERIAL PRIMARY KEY,
    Descricao VARCHAR UNIQUE
);

CREATE TABLE IF NOT EXISTS Tipo_Onibus (
    Codigo_Tipo_Onibus SERIAL PRIMARY KEY,
    Descricao VARCHAR UNIQUE,
    Lotacao_Maxima INTEGER,
    Numero_Acentos INTEGER
);

CREATE TABLE IF NOT EXISTS Tipo_Viagem (
    Codigo_Tipo_Viagem SERIAL PRIMARY KEY,
    Descricao VARCHAR UNIQUE
);

CREATE TABLE IF NOT EXISTS Funcao (
    Codigo_Funcao SERIAL PRIMARY KEY,
    Descricao VARCHAR UNIQUE
);

CREATE TABLE IF NOT EXISTS Tipo_Cartao (
    Codigo_Tipo_Cartao SERIAL PRIMARY KEY,
    Descricao VARCHAR UNIQUE
);

CREATE TABLE IF NOT EXISTS Tipo_Passagem (
    Codigo_Tipo_Passagem SERIAL PRIMARY KEY,
    Descricao VARCHAR,
    Preco DECIMAL
);

CREATE TABLE IF NOT EXISTS Passageiro (
    Codigo_Passageiro SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Foto VARCHAR UNIQUE,
    Digital VARCHAR UNIQUE,
    CPF VARCHAR UNIQUE
);

CREATE TABLE IF NOT EXISTS Consorcio (
    Codigo_Consorcio SERIAL PRIMARY KEY,
    Nome VARCHAR
);

-- Tables with foreign keys referencing previously created tables:

CREATE TABLE IF NOT EXISTS Linha (
    Codigo_Linha SERIAL PRIMARY KEY,
    Codigo_Itinerario INTEGER REFERENCES Itinerario (Codigo_Itinerario),
    UNIQUE (Codigo_Linha, Codigo_Itinerario)
);

CREATE TABLE IF NOT EXISTS Onibus (
    Codigo_Onibus INTEGER PRIMARY KEY,
    Placa_Onibus VARCHAR UNIQUE,
    Codigo_Tipo_Onibus INTEGER REFERENCES Tipo_Onibus(Codigo_Tipo_Onibus),
    Codigo_Concessionaria INTEGER REFERENCES Concessionaria(Codigo_Concessionaria)
);

CREATE TABLE IF NOT EXISTS Funcionario (
    Matricula SERIAL PRIMARY KEY,
    Nome VARCHAR,
    Codigo_Escala INTEGER REFERENCES Escala(Codigo_Escala),
    Codigo_Funcao INTEGER REFERENCES Funcao(Codigo_Funcao)
);

CREATE TABLE IF NOT EXISTS Viagem (
    Codigo_Viagem SERIAL PRIMARY KEY,
    Codigo_Tipo_Viagem INTEGER REFERENCES Tipo_Viagem(Codigo_Tipo_Viagem),
    Codigo_Onibus INTEGER REFERENCES Onibus(Codigo_Onibus),
    Codigo_Linha INTEGER REFERENCES Linha(Codigo_Linha),
    Dth_Inicio TIMESTAMP,
    Origem VARCHAR
);

CREATE TABLE IF NOT EXISTS Cartao_Passagem (
    Codigo_Cartao_Passagem SERIAL PRIMARY KEY,
    Codigo_Passageiro INTEGER REFERENCES Passageiro(Codigo_Passageiro),
    Codigo_Tipo_Cartao INTEGER REFERENCES Tipo_Cartao(Codigo_Tipo_Cartao),
    Codigo_Tipo_Passagem INTEGER REFERENCES Tipo_Passagem(Codigo_Tipo_Passagem),
    Quantidade_Passagem INTEGER,
    Dth_Validade TIME
);

CREATE TABLE IF NOT EXISTS Viagem_Funcionario (
    Codigo_Viagem_Funcionario SERIAL PRIMARY KEY,
    Codigo_Funcionario INTEGER REFERENCES Funcionario(Matricula),
    Codigo_Viagem INTEGER REFERENCES Viagem(Codigo_Viagem)
);

CREATE TABLE IF NOT EXISTS Viagem_Cartao_Passagem (
    Codigo_Viagem_Cartao_Passagem SERIAL PRIMARY KEY,
    Codigo_Viagem INTEGER REFERENCES Viagem(Codigo_Viagem),
    Codigo_Cartao_Passagem INTEGER REFERENCES Cartao_Passagem(Codigo_Cartao_Passagem)
);

-- Tables with foreign keys referencing multiple previously created tables:

CREATE TABLE IF NOT EXISTS Area_Operacional (
    Codigo_Area_Operacional SERIAL PRIMARY KEY,
    Nome VARCHAR UNIQUE,
    Cor VARCHAR UNIQUE
);

		
CREATE TABLE IF NOT EXISTS Regiao_Linha (
    Codigo_Regiao_Linha SERIAL PRIMARY KEY,
    Codigo_Linha INTEGER REFERENCES Linha(Codigo_Linha),
    Codigo_Regiao INTEGER REFERENCES Regiao(Codigo_Regiao),
    UNIQUE (Codigo_Linha, Codigo_Regiao)
);

CREATE TABLE IF NOT EXISTS Regiao_Linha_Area_Operacional (
    Codigo_Regiao_Linha_Area_Operacional SERIAL PRIMARY KEY,
    Codigo_Regiao_Linha INTEGER REFERENCES Regiao_Linha(Codigo_Regiao_Linha),
    Codigo_Area_Operacional INTEGER REFERENCES Area_Operacional(Codigo_Area_Operacional),
    UNIQUE( Codigo_Regiao_Linha, Codigo_Area_Operacional)
);

CREATE TABLE IF NOT EXISTS Consorcio_Concessionaria (
    Codigo_Consorcio_Concessionaria SERIAL PRIMARY KEY,
    Codigo_Concessionaria INTEGER REFERENCES Concessionaria (Codigo_Concessionaria),
    Codigo_Consorcio INTEGER REFERENCES Consorcio (Codigo_Consorcio),
    UNIQUE( Codigo_Concessionaria, Codigo_Consorcio)
);