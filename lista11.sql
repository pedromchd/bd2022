PRAGMA foreign_keys = ON;

INSERT INTO clientes (nome, endereco, tipo_cliente, RG, CPF, CNPJ, obs) VALUES (
  'Claudomiro Santos',
  'Jibões, 817',
  'F',
  '8967533814',
  '34967854321',
  '78924833185985',
  'Não possui dependentedes'
);

INSERT INTO fones_clientes (cliente, num_telefone) VALUES (
  '1',
  '8964581898'
);

INSERT INTO funcionarios (nome, endereco, CPF, tipo) VALUES (
  'Reginaldo Santos',
  'Venésios, 298',
  '4266972544',
  '2'
);

INSERT INTO itens (valor, custo, descricao, desconto, tipo, estoque) VALUES (
  899.90,
  785.40,
  'Mais novo produto',
  5.8,
  'P',
  48
);

INSERT INTO ordens_servicos (data, valor_total, status, funcionario, cliente) VALUES (
  '15/08/2021',
  1070.65,
  'A',
  1,
  1
);

INSERT INTO vendas (valor_total_venda, dt_venda, funcionario, cliente, ordem_servico) VALUES (
  899.90,
  '25/07/2019',
  1,
  1,
  1
);

INSERT INTO vendas_itens (sequencial, venda, item, quant, valor) VALUES (
  1,
  1,
  1,
  14,
  942.25
);

INSERT INTO contas_receber (data_lancamento, data_vencimento, valor, data_pagamento, valor_pagamento, venda) VALUES (
  '12/05/2020',
  '18/06/2020',
  785.40,
  '17/05/2020',
  650.00,
  1
);

INSERT INTO ordens_itens (ordem_servico, item, desconto) VALUES (
  1,
  1,
  5.8
);

INSERT INTO fornecedores (descricao, endereco, contato, CNPJ) VALUES (
  'aaaaaaaaa',
  'Janeiro, 900',
  'ameiro@yahoo.br',
  '48954548755215'
);


INSERT INTO compras (fornecedor, data, valor_total, numero_nota) VALUES (
  1,
  '15/08/2021',
  788.96,
  1
);

INSERT INTO compras_itens (compra, item, desconto, quant, valor, valor_total) VALUES (
  1,
  1,
  5.8,
  14,
  600.00,
  550.00
);

INSERT INTO despesas (descricao) VALUES (
  'despesa.'
);


INSERT INTO contas_pagar (num_boleto, tipo, data_venc, dt_pgmto, valor_pago, valor, data_lancamento, descontro, compra, despesa) VALUES (
  1,
  1,
  '12/07/2020',
  '01/07/2020',
  400.50,
  899.90,
  '06/06/2020',
  5.8,
  1,
  1
);
