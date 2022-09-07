DROP TABLE IF EXISTS salas;
DROP TABLE IF EXISTS diretores;
DROP TABLE IF EXISTS filmes;
DROP TABLE IF EXISTS salas_filmes;
DROP TABLE IF EXISTS premios;

CREATE TABLE salas (
  numero INTEGER NOT NULL,
  descricao TEXT NOT NULL,
  capacidade INTEGER NOT NULL,
  PRIMARY KEY (numero)
);

CREATE TABLE diretores (
  codigo INTEGER NOT NULL,
  nome VARCHAR(255) NOT NULL,
  PRIMARY KEY (codigo)
);

CREATE TABLE filmes (
  codigo INTEGER NOT NULL,
  nome VARCHAR(255) NOT NULL,
  ano_lancamento DATE NOT NULL,
  categoria VARCHAR(255) NOT NULL,
  cod_diretor INTEGER NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (cod_diretor) REFERENCES diretores (codigo) ON DELETE CASCADE
);

CREATE TABLE salas_filmes (
  numero_sala INTEGER NOT NULL,
  cod_filme INTEGER NOT NULL,
  data DATE NOT NULL,
  horario TIME NOT NULL,
  FOREIGN KEY (numero_sala) REFERENCES salas (numero) ON DELETE CASCADE,
  FOREIGN KEY (cod_filme) REFERENCES filmes (codigo) ON DELETE CASCADE
);

CREATE TABLE premios (
  codigo INTEGER NOT NULL,
  nome VARCHAR(255) NOT NULL,
  ano_premiacao DATE NOT NULL,
  cod_filme INTEGER NOT NULL,
  PRIMARY KEY (codigo),
  FOREIGN KEY (cod_filme) REFERENCES filmes (codigo) ON DELETE CASCADE
);
