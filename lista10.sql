PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS Fones_clientes;

CREATE TABLE clientes (
  cod integer PRIMARY KEY,
  Nome varchar(50) NOT NULL,
  endereco varchar(50) NOT NULL,
  tipo_cliente char(1) CHECK (tipo_cliente = 'F' or tipo_cliente = 'J'),
  RG char(15),
  CPF char(11),
  CNPJ char(14),
  Obs text
);

INSERT INTO clientes (Nome, endereco, tipo_cliente, RG, CPF, Obs) VALUES (
  'Brenda',
  'Hernandes, 715',
  'F',
  '8996321455',
  '44521234788',
  'AaAaAa'
);

CREATE TABLE Fones_clientes (
  cliente integer NOT NULL,
  num_telefone char(10),
  FOREIGN KEY (cliente) REFERENCES clientes (cod)
);

INSERT INTO Fones_clientes (cliente, num_telefone) VALUES (
  1, '5899442681'
),
(
  1, '8910554939'
);
