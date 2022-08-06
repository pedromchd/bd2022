DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS fones_clientes;
DROP TABLE IF EXISTS funcionarios;
DROP TABLE IF EXISTS vendas;
DROP TABLE IF EXISTS contas_receber;
DROP TABLE IF EXISTS itens;

CREATE TABLE clientes (
  cod INTEGER NOT NULL,
  nome VARCHAR(50) NOT NULL,
  endereco VARCHAR(50) NOT NULL,
  tipo_cliente CHAR(1) CHECK (tipo_cliente = "F" or tipo_cliente = "J"),
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
  CPF VARCHAR(11) NOT NULL,
  tipo CHAR(1) CHECK (tipo = "1" or tipo = "2" or tipo = "3"),
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
  FOREIGN KEY (cliente) REFERENCES clientes (cod) ON DELETE CASCADE
  -- FOREIGN KEY (ordem_servico) REFERENCES ordem_servico (cod) ON DELETE CASCADE
);

CREATE TABLE contas_receber (
  cod INTEGER NOT NULL,
  data_lancamneto DATE NOT NULL,
  data_vencimento DATE NOT NULL,
  valor NUMERIC(10,2) NOT NULL,
  data_pagamento DATE,
  valor_pagamento NUMERIC(10,2),
  venda INTEGER,
  PRIMARY KEY (cod),
  FOREIGN KEY (venda) REFERENCES vendas (cod) ON DELETE CASCADE
);

CREATE TABLE itens (
  cod INTEGER NOT NULL,
  valor NUMERIC(10,2) NOT NULL,
  custo NUMERIC(10,2) NOT NULL,
  descricao VARCHAR(100),
  desconto NUMERIC(4,2),
  tipo CHAR(1) CHECK (tipo = "P" or tipo = "S"),
  estoque INTEGER,
  PRIMARY KEY (cod)
);
