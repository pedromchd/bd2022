SELECT * FROM clientes;
SELECT * FROM clientes WHERE tipo = 'F';
SELECT fonesClientes.telefone FROM fonesClientes JOIN clientes ON fonesClientes.cliente = clientes.cod WHERE clientes.tipo = 'J';
SELECT nome, endereco FROM clientes ORDER BY nome ASC;
SELECT funcionarios.nome, count(ordensServicos.data) AS quantidade_ordens FROM funcionarios LEFT JOIN ordensServicos ON funcionarios.cod = ordensServicos.funcionario WHERE date(ordensServicos.data) >= '2016-01-01' GROUP BY funcionarios.nome;
SELECT funcionarios.nome FROM funcionarios JOIN vendas ON funcionarios.cod = vendas.funcionario WHERE vendas.valor_total > 1000 GROUP BY funcionarios.nome;
SELECT descricao FROM itens WHERE tipo = 'S';
SELECT nome FROM funcionarios WHERE nome LIKE 'A%';
SELECT funcionarios.nome, sum(vendas.valor_total) AS total_vendas FROM funcionarios JOIN vendas ON funcionarios.cod = vendas.funcionario WHERE strftime('%Y-%m', vendas.data) = '2015-12' GROUP BY funcionarios.nome;
SELECT descricao FROM itens WHERE tipo = 'P' AND descricao LIKE '%s';
