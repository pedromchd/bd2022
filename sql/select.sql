SELECT * FROM clientes;
SELECT * FROM clientes WHERE tipo = 'F';
SELECT fonesClientes.telefone FROM fonesClientes JOIN clientes ON fonesClientes.cliente = clientes.cod WHERE clientes.tipo = 'J';
SELECT nome, endereco FROM clientes ORDER BY nome ASC;
SELECT funcionarios.nome, count(ordensServicos.data) AS quantidade FROM funcionarios LEFT JOIN ordensServicos ON funcionarios.cod = ordensServicos.funcionario WHERE date(ordensServicos.data) >= '2016-01-01' GROUP BY funcionarios.nome;
