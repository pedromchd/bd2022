CREATE TABLE clientes (
  cod INTEGER NOT NULL,
  nome VARCHAR(50) NOT NULL,
  endereco VARCHAR(50) NOT NULL,
  tipo CHARACTER(1) CHECK (tipo = 'F' or tipo = 'J'),
  RG VARCHAR(10),
  CPF VARCHAR(11),
  CNPJ VARCHAR(14),
  obs TEXT,
  PRIMARY KEY (cod)
);

CREATE TABLE fonesClientes (
  cliente INTEGER NOT NULL,
  telefone VARCHAR(10),
  PRIMARY KEY (cliente, telefone),
  FOREIGN KEY (cliente) REFERENCES clientes (cod) ON DELETE CASCADE
);

CREATE TABLE funcionarios (
  cod INTEGER NOT NULL,
  nome VARCHAR(50) NOT NULL,
  endereco VARCHAR(50) NOT NULL,
  CPF VARCHAR(11) NOT NULL UNIQUE,
  tipo CHARACTER(1) CHECK (tipo = '1' or tipo = '2' or tipo = '3'),
  PRIMARY KEY (cod)
);

CREATE TABLE itens (
  cod INTEGER NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  custo DECIMAL(10,2) NOT NULL,
  descricao VARCHAR(100),
  desconto DECIMAL(4,2),
  tipo CHARACTER(1) CHECK (tipo = 'P' or tipo = 'S'),
  estoque INTEGER,
  PRIMARY KEY (cod)
);

CREATE TABLE ordensServicos (
  num INTEGER NOT NULL,
  data DATE NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL,
  status CHARACTER(1) CHECK (status = 'A' or status = 'F'),
  funcionario INTEGER NOT NULL,
  cliente INTEGER NOT NULL,
  PRIMARY KEY (num),
  FOREIGN KEY (funcionario) REFERENCES funcionarios (cod) ON DELETE CASCADE,
  FOREIGN KEY (cliente) REFERENCES clientes (cod) ON DELETE CASCADE
);

CREATE TABLE vendas (
  cod INTEGER NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL,
  data DATE NOT NULL,
  funcionario INTEGER,
  cliente INTEGER,
  ordem_servico INTEGER,
  PRIMARY KEY (cod),
  FOREIGN KEY (funcionario) REFERENCES funcionarios (cod) ON DELETE CASCADE,
  FOREIGN KEY (cliente) REFERENCES clientes (cod) ON DELETE CASCADE,
  FOREIGN KEY (ordem_servico) REFERENCES ordensServicos (num) ON DELETE CASCADE
);

CREATE TABLE vendasItens (
  sequencial INTEGER NOT NULL,
  venda INTEGER NOT NULL,
  item INTEGER NOT NULL,
  quant REAL NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (sequencial, venda),
  FOREIGN KEY (venda) REFERENCES vendas (cod) ON DELETE CASCADE,
  FOREIGN KEY (item) REFERENCES itens (cod) ON DELETE CASCADE
);

CREATE TABLE contasReceber (
  cod INTEGER NOT NULL,
  data_lancamento DATE NOT NULL,
  data_vencimento DATE NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  data_pagamento DATE,
  valor_pagamento DECIMAL(10,2),
  venda INTEGER NOT NULL,
  PRIMARY KEY (cod),
  FOREIGN KEY (venda) REFERENCES vendas (cod) ON DELETE CASCADE
);

CREATE TABLE ordensItens (
  sequencial INTEGER NOT NULL,
  ordem_servico INTEGER NOT NULL,
  item INTEGER NOT NULL,
  desconto DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (sequencial),
  FOREIGN KEY (ordem_servico) REFERENCES ordensServicos (num),
  FOREIGN KEY (item) REFERENCES itens (cod)
);

CREATE TABLE fornecedores (
  cod INTEGER NOT NULL,
  descricao VARCHAR(100),
  endereco VARCHAR(50),
  contato VARCHAR(50),
  CNPJ VARCHAR(14) UNIQUE,
  PRIMARY KEY (cod)
);

CREATE TABLE compras (
  cod INTEGER NOT NULL,
  fornecedor INTEGER NOT NULL,
  data DATE NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL,
  numero_nota INTEGER NOT NULL,
  PRIMARY KEY (cod),
  FOREIGN KEY (fornecedor) REFERENCES fornecedores (cod) ON DELETE CASCADE
);

CREATE TABLE comprasItens (
  sequencial INTEGER NOT NULL,
  compra INTEGER NOT NULL,
  item INTEGER NOT NULL,
  desconto DECIMAL(4,2) NOT NULL,
  quant REAL NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  valor_total DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (sequencial),
  FOREIGN KEY (compra) REFERENCES compras (cod) ON DELETE CASCADE,
  FOREIGN KEY (item) REFERENCES itens (cod) ON DELETE CASCADE
);

CREATE TABLE despesas (
  cod INTEGER NOT NULL,
  descricao VARCHAR(50) NOT NULL,
  PRIMARY KEY (cod)
);

CREATE TABLE contasPagar (
  numero INTEGER NOT NULL,
  num_boleto VARCHAR(50),
  tipo NOT NULL CHECK (tipo = 1 or tipo = 2),
  data_vencimento DATE NOT NULL,
  data_pagamento DATE,
  valor_pago DECIMAL(10,2) NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  data_lancamento DATE NOT NULL,
  desconto DECIMAL(10,2),
  compra INTEGER NOT NULL,
  despesa INTEGER NOT NULL,
  PRIMARY KEY (numero),
  FOREIGN KEY (compra) REFERENCES compras (cod) ON DELETE CASCADE,
  FOREIGN KEY (despesa) REFERENCES despesas (cod) ON DELETE CASCADE
);
