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
  ('2015-05-02', 'R$1250,50', 'F', '3', '2'),
  ('2019-11-17', 'R$730,25', 'A', '3', '2'),
  ('2018-09-14', 'R$1099,90', 'A', '2', '5'),
  ('2016-06-29', 'R$450,75', 'F', '2', '5'),
  ('2009-04-09', 'R$990,00', 'F', '1', '2'),
  ('2017-12-10', 'R$8075,00', 'F', '1', '5'),
  ('2020-07-01', 'R$3000,00', 'A', '3', '2'),
  ('2014-02-28', 'R$200,00', 'F', '2', '5'),
  ('2022-08-23', 'R$825,50', 'A', '2', '2')
;
