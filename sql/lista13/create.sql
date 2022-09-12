DROP TABLE IF EXISTS novelas;
DROP TABLE IF EXISTS atores;
DROP TABLE IF EXISTS personagens;
DROP TABLE IF EXISTS novelas_personagens;
DROP TABLE IF EXISTS capitulos;

CREATE TABLE novelas (
  codigo INTEGER NOT NULL,
  nome VARCHAR(255) NOT NULL,
  data_primeiro_capitulo DATE NOT NULL,
  data_ultimo_capitulo DATE NOT NULL,
  horario_exibicao TIME,
  PRIMARY KEY (codigo)
);

CREATE TABLE atores (
  codigo INTEGER NOT NULL,
  nome VARCHAR(255) NOT NULL,
  data_nascimento DATE NOT NULL,
  cidade VARCHAR(255) NOT NULL,
  salario NUMERIC(10,2) NOT NULL,
  sexo CHAR(1) NOT NULL CHECK (sexo = 'M' OR sexo = 'F'),
  PRIMARY KEY (codigo)
);

CREATE TABLE personagens (
  codigo INTEGER NOT NULL,
  nome VARCHAR(255) NOT NULL,
  data_nascimento DATE NOT NULL,
  situacao_financeira CHAR(1) NOT NULL,
  ator INTEGER NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (ator) REFERENCES atores (codigo) ON DELETE CASCADE
);

CREATE TABLE novelasPersonagens (
  novela INTEGER NOT NULL,
  personagem INTENGER NOT NULL,
  PRIMARY KEY (novela, personagem),
  FOREIGN KEY (novela) REFERENCES novelas (codigo) ON DELETE CASCADE,
  FOREIGN KEY (personagem) REFERENCES personagens (codigo) ON DELETE CASCADE
);

CREATE TABLE capitulos (
  codigo INTEGER NOT NULL,
  nome VARCHAR(255) NOT NULL,
  data_exibicao DATE NOT NULL,
  novela INTEGER NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (novela) REFERENCES novelas (codigo) ON DELETE CASCADE
);
