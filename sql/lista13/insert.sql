INSERT INTO novelas (nome, data_primeiro_capitulo, data_ultimo_capitulo, horario_exibicao) VALUES
  ('Mulheres de Areia', '1990-01-01', '1990-06-01', '21:00:00'),
  ('Mistérios da Vida', '2022-01-01', '2022-04-11', '21:00:00'),
  ('Vida da gente', '2010-01-01', '2010-04-11', '18:00:00'),
  ('Quanto mais vida melhor', '2010-01-01', '2010-04-11', '18:00:00'),
  ('Convida da gente', '2010-01-01', '2010-04-11', '18:00:00'),
  ('Vida', '2010-01-01', '2010-04-11', '18:00:00'),
  ('O clone', '2022-01-01', '2022-04-11', NULL)
;

INSERT INTO atores (nome, data_nascimento, cidade, salario, sexo) VALUES
  ('Gloria Pires', '1972-01-01', 'Rio de Janeiro', '50000', 'F'),
  ('Antonio Fagundes', '1957-10-05', 'Marau', '150000', 'M'),
  ('Marcos Frota', '1957-02-02', 'Floripa', '300', 'M'),
  ('Nívia Maria', '1972-11-07', 'Salvador', '150000', 'F')
;

INSERT INTO personagens (nome, data_nascimento, situacao_financeira, ator) VALUES
  ('Ruth', '1972-03-04', 'C', 1),
  ('Raquel', '1972-03-04', 'C', 1),
  ('Tonho da Lua', '1992-07-10', 'C', 3)
;

INSERT INTO novelasPersonagens (novela, personagem) VALUES
  (1, 1),
  (1, 2),
  (1, 3)
;

INSERT INTO capitulos (nome, data_exibicao, novela) VALUES
  ('Ultimo capítulo', '2022-04-11', 2),
  ('Vai que cola', '2022-05-03', 1),
  ('Agora já era', '2022-04-01', 2)
;
