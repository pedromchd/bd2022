INSERT INTO salas (numero, descricao, capacidade) VALUES
  (101, 'Sala 3D 1', 100),
  (102, 'Sala 3D 2', 100),
  (103, 'Sala Convencional 1', 150),
  (201, 'Sala Convencional 2', 100),
  (202, 'Sala 3D 3', 80)
;

INSERT INTO diretores (codigo, nome) VALUES
  (1, 'Fulano de Tal da Silva'),
  (2, 'Ciclana das Neves'),
  (3, 'Josicreidson Seilayevski')
;

INSERT INTO FILMES (codigo, nome, ano_lancamento, categoria, cod_diretor) VALUES
  (1, 'Titanic', '1997', 'Drama', 1),
  (2, 'Matrix', '2001', 'Ficção', 1),
  (3, 'À Prova de Fogo', '2009', 'Romance', 2),
  (4, 'Toy Story', '1998', 'Animação', 3),
  (5, 'Shrek', '2000', 'Animação', 2)
;

INSERT INTO salas_filmes (numero_sala, cod_filme, data, horario) VALUES
  (101, 1, '2014-04-14', '20:00'),
  (101, 2, '2014-04-15', '22:00'),
  (102, 1, '2014-04-10', '19:00'),
  (103, 3, '2014-04-22', '16:00'),
  (201, 4, '2014-04-14', '22:00'),
  (201, 5, '2014-04-15', '20:00'),
  (202, 3, '2014-04-21', '20:00')
;

INSERT INTO premios (codigo, nome, ano_premiacao, cod_filme) VALUES
  (1, 'Oscar - Melhor Filme', '1997', 1),
  (2, 'Oscar - Melhor Diretor', '1997', 1),
  (3, 'Globo de Ouro - Melhor Filme', '1997', 1),
  (4, 'Oscar - Efeitos Especiais', '2002', 2),
  (5, 'Globo de Ouro - Melhor Animação', '1999', 4),
  (6, 'Globo de Ouro - Melhor Animação', '2001', 5),
  (7, 'Oscar - Melhor Atriz Coadjuvante', '1997', 1)
;
