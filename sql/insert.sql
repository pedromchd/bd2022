INSERT INTO clientes (nome, endereco, tipo, RG, CPF, CNPJ, obs) VALUES
  ('Jeferson Nogueira', 'Búzios, 176', 'F', '7848627234', '26410872022', NULL, NULL),
  ('Padaria Leonardo', 'Alcatraz, 37', 'J', NULL, NULL, '34819576248915', NULL),
  ('Daniela Almeida', 'Januário, 413', 'F', '8942375681', '04897685264', NULL, NULL),
  ('Ricardo Silva', 'Almirantes, 564', 'F', '3456872940', '15486214893', NULL, NULL),
  ('Pedro Salgados', 'Vitoriano, 259', 'J', NULL, NULL, '78431958624863', NULL)
;

INSERT INTO fonesClientes (cliente, telefone) VALUES
  ('1', '5387854239'),
  ('2', '5392421863'),
  ('2', '5314527489'),
  ('3', '5374851265'),
  ('4', '5387421863'),
  ('5', '5362485985'),
  ('5', '5364218579')
;

INSERT INTO funcionarios (nome, endereco, CPF, tipo) VALUES
  ('Miguel Freitas', 'Venésio, 490', '78442687544', '1'),
  ('Juliana Castro', 'Bragança, 97', '12347185268', '1'),
  ('Lurdes Costa', 'Marco Abreu, 320', '65148329542', '1'),
  ('Arthur Lima', 'Osório, 631', '54123678924', '1')
;

INSERT INTO ordensServicos (data, valor_total, status, funcionario, cliente) VALUES
  ('2015-12-02', 'R$1250,50', 'F', '3', '2'),
  ('2019-11-17', 'R$730,25', 'A', '3', '2'),
  ('2015-12-14', 'R$1099,90', 'A', '2', '5'),
  ('2016-06-29', 'R$450,75', 'F', '2', '5'),
  ('2016-02-09', 'R$990,00', 'F', '1', '2'),
  ('2017-12-10', 'R$8075,00', 'F', '4', '5'),
  ('2020-07-01', 'R$3000,00', 'A', '3', '2'),
  ('2015-12-28', 'R$200,00', 'F', '2', '5'),
  ('2022-08-23', 'R$825,50', 'A', '2', '2')
;

INSERT INTO vendas (valor_total, data, funcionario, cliente, ordem_servico) VALUES
  (1250.50, '2015-12-02', '3', '2', '1'),
  (730.25, '2019-11-17', '3', '2', '2'),
  (1099.90, '2015-12-14', '2', '5', '3'),
  (450.75, '2016-06-29', '2', '5', '4'),
  (990.00, '2016-02-09', '1', '2', '5'),
  (8075.00, '2017-12-10', '4', '5', '6'),
  (3000.00, '2020-07-01', '3', '2', '7'),
  (200.00, '2015-12-28', '2', '5', '8'),
  (825.50, '2022-08-23', '2', '2', '9')
;

INSERT INTO itens (valor, custo, descricao, desconto, tipo, estoque) VALUES
  (1250.50, 975.00, 'Air-fryer 6KG', NULL, 'P', 73),
  (730.25, 500.00, 'Limpeza automotiva', NULL, 'S', 8),
  (1099.90, 1590.00, 'Manutenção de Equipamentos', 30, 'S', 6),
  (450.75, 599.90, 'Galaxy Buds', 25, 'P', 128),
  (990.00, 1000.00, 'Display Galaxy-S10', 1, 'P', 4),
  (8075.00, 9950.00, 'Macbook Semi-novo', 20, 'P', 1),
  (3000.00, 2840.75, 'Instalção Elétrica e Ar-condicionado', NULL, 'S', 3),
  (200.00, 200.00, 'Cesta de Aniversário', NULL, 'P', NULL),
  (825.50, 825.50, 'Conserto Carro', NULL, 'S', 3)
;
