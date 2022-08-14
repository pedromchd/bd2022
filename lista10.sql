PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS fones_clientes;
DROP TABLE IF EXISTS funcionarios;
DROP TABLE IF EXISTS vendas;
DROP TABLE IF EXISTS contas_receber;
DROP TABLE IF EXISTS itens;
DROP TABLE IF EXISTS vendas_itens;
DROP TABLE IF EXISTS ordens_servicos;
DROP TABLE IF EXISTS ordens_itens;
DROP TABLE IF EXISTS compras;
DROP TABLE IF EXISTS compras_itens;
DROP TABLE IF EXISTS contas_pagar;
DROP TABLE IF EXISTS despesas;
DROP TABLE IF EXISTS fornecedores;

CREATE TABLE clientes (
  cod INTEGER NOT NULL,
  nome VARCHAR(50) NOT NULL,
  endereco VARCHAR(50) NOT NULL,
  tipo_cliente CHAR(1) CHECK (tipo_cliente = 'F' or tipo_cliente = 'J'),
  RG VARCHAR(14),
  CPF VARCHAR(11),
  CNPJ VARCHAR(14),
  obs TEXT,
  PRIMARY KEY (cod)
);

CREATE TABLE fones_clientes (
  cliente INTEGER NOT NULL,
  num_telefone CHAR(10),
  PRIMARY KEY (cliente, num_telefone),
  FOREIGN KEY (cliente) REFERENCES clientes (cod) ON DELETE CASCADE
);

CREATE TABLE funcionarios (
  cod INTEGER NOT NULL,
  nome VARCHAR(50) NOT NULL,
  endereco VARCHAR(50) NOT NULL,
  CPF VARCHAR(11) NOT NULL UNIQUE,
  tipo CHAR(1) CHECK (tipo = '1' or tipo = '2' or tipo = '3'),
  PRIMARY KEY (cod)
);

CREATE TABLE vendas (
  cod INTEGER NOT NULL,
  valor_total_venda NUMERIC(10,2) NOT NULL,
  dt_venda DATE NOT NULL,
  funcionario INTEGER,
  cliente INTEGER,
  ordem_servico INTEGER,
  PRIMARY KEY (cod),
  FOREIGN KEY (funcionario) REFERENCES funcionarios (cod) ON DELETE CASCADE,
  FOREIGN KEY (cliente) REFERENCES clientes (cod) ON DELETE CASCADE,
  FOREIGN KEY (ordem_servico) REFERENCES ordens_servicos (num) ON DELETE CASCADE
);

CREATE TABLE contas_receber (
  cod INTEGER NOT NULL,
  data_lancamento DATE NOT NULL,
  data_vencimento DATE NOT NULL,
  valor NUMERIC(10,2) NOT NULL,
  data_pagamento DATE,
  valor_pagamento NUMERIC(10,2),
  venda INTEGER NOT NULL,
  PRIMARY KEY (cod),
  FOREIGN KEY (venda) REFERENCES vendas (cod) ON DELETE CASCADE
);

CREATE TABLE itens (
  cod INTEGER NOT NULL,
  valor NUMERIC(10,2) NOT NULL,
  custo NUMERIC(10,2) NOT NULL,
  descricao VARCHAR(100),
  desconto NUMERIC(4,2),
  tipo CHAR(1) CHECK (tipo = 'P' or tipo = 'S'),
  estoque INTEGER,
  PRIMARY KEY (cod)
);

CREATE TABLE vendas_itens (
  sequencial INTEGER NOT NULL,
  venda INTEGER NOT NULL,
  item INTEGER NOT NULL,
  quant REAL NOT NULL,
  valor NUMERIC(10,2) NOT NULL,
  PRIMARY KEY (sequencial, venda),
  FOREIGN KEY (venda) REFERENCES vendas (cod) ON DELETE CASCADE,
  FOREIGN KEY (item) REFERENCES itens (cod) ON DELETE CASCADE
);

CREATE TABLE ordens_servicos (
  num INTEGER NOT NULL,
  data DATE NOT NULL,
  valor_total NUMERIC(10,2) NOT NULL,
  status CHAR(1) CHECK (status = 'A' or status = 'F'),
  funcionario INTEGER NOT NULL,
  cliente INTEGER NOT NULL,
  PRIMARY KEY (num),
  FOREIGN KEY (funcionario) REFERENCES funcionarios (cod) ON DELETE CASCADE,
  FOREIGN KEY (cliente) REFERENCES clientes (cod) ON DELETE CASCADE
);

CREATE TABLE ordens_itens (
  sequencial INTEGER NOT NULL,
  ordem_servico INTEGER NOT NULL,
  item INTEGER NOT NULL,
  desconto NUMERIC(4,2) NOT NULL,
  PRIMARY KEY (sequencial),
  FOREIGN KEY (ordem_servico) REFERENCES ordens_servicos (num),
  FOREIGN KEY (item) REFERENCES itens (cod)
);

CREATE TABLE compras (
  cod INTEGER NOT NULL,
  fornecedor INTEGER NOT NULL,
  data DATE NOT NULL,
  valor_total NUMERIC(10,2) NOT NULL,
  numero_nota INTEGER NOT NULL,
  PRIMARY KEY (cod),
  FOREIGN KEY (fornecedor) REFERENCES fornecedores (cod) ON DELETE CASCADE
);

CREATE TABLE compras_itens (
  sequencial INTEGER NOT NULL,
  compra INTEGER NOT NULL,
  item INTEGER NOT NULL,
  desconto NUMERIC(4,2) NOT NULL,
  quant REAL NOT NULL,
  valor NUMERIC(10,2) NOT NULL,
  valor_total NUMERIC(10,2) NOT NULL,
  PRIMARY KEY (sequencial),
  FOREIGN KEY (compra) REFERENCES compras (cod) ON DELETE CASCADE,
  FOREIGN KEY (item) REFERENCES itens (cod) ON DELETE CASCADE
);

CREATE TABLE contas_pagar (
  numero INTEGER NOT NULL,
  num_boleto VARCHAR(50),
  tipo NOT NULL CHECK (tipo = 1 or tipo = 2),
  data_venc DATE NOT NULL,
  dt_pgmto DATE,
  valor_pago NUMERIC(10,2) NOT NULL,
  valor NUMERIC(10,2) NOT NULL,
  data_lancamento DATE NOT NULL,
  descontro NUMERIC(10,2),
  compra INTEGER NOT NULL,
  despesa INTEGER NOT NULL,
  PRIMARY KEY (numero),
  FOREIGN KEY (compra) REFERENCES compras (cod) ON DELETE CASCADE,
  FOREIGN KEY (despesa) REFERENCES despesas (cod) ON DELETE CASCADE
);

CREATE TABLE despesas (
  cod INTEGER NOT NULL,
  descricao VARCHAR(50) NOT NULL,
  PRIMARY KEY (cod)
);

CREATE TABLE fornecedores (
  cod INTEGER NOT NULL,
  descricao VARCHAR(100),
  endereco VARCHAR(50),
  contato VARCHAR(50),
  CNPJ VARCHAR(14) UNIQUE,
  PRIMARY KEY (cod)
);
