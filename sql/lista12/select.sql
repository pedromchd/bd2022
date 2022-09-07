SELECT nome FROM diretores;
SELECT nome FROM filmes WHERE categoria = 'Animação';
UPDATE salas SET capacidade = 200 WHERE numero = 202;
UPDATE salas_filmes SET numero_sala = 202 WHERE date(data) = '2014-04-14';
DELETE FROM diretores WHERE nome = 'Fulano de Tal da Silva';
SELECT filmes.nome, filmes.categoria FROM filmes JOIN diretores ON filmes.cod_diretor = diretores.codigo WHERE diretores.nome = 'Ciclana das Neves';
SELECT horario FROM salas_filmes WHERE date(data) = '2014-04-15';
SELECT premios.nome, premios.ano_premiacao FROM premios JOIN filmes ON premios.cod_filme = filmes.codigo WHERE filmes.nome = 'Shrek';
SELECT codigo, nome, categoria FROM filmes WHERE ano_lancamento > 2000;
