INSERT INTO Hospital (CNPJ, nome, endereco) VALUES
('39159144000120', 'Hospital IFRS', 'Alfredo Huch, 475');

INSERT INTO Medico (CRM, nome, hospitalCNPJ) VALUES
('553810', 'João da Silva', '39159144000120'),
('223810', 'Mariana Lima', '39159144000120'),
('121169', 'Pedro Pereira', '39159144000120');

INSERT INTO Especialidade (ID, nome) VALUES
(1, 'Ortopedia'),
(2, 'Pediatria'),
(3, 'Oftalmologia'),
(4, 'Geriatria'),
(5, 'Cardiologia');

INSERT INTO MedicoEspecialidade (medicoCRM, especialidadeID) VALUES
('553810', 1),
('553810', 4),
('223810', 2),
('121169', 2);

INSERT INTO Paciente (CPF, nome) VALUES
('17658586072', 'Francisco Cunha'),
('22358996072', 'Rosa da Silva'),
('09856787652', 'Geraldo Otavio');

INSERT INTO Consulta (ID, data, hora, diagnostico, medicoCRM, pacienteCPF) VALUES
(1, '2013-08-10', '09:00:00', 'Olha o coração', '223810', '09856787652'),
(2, '2013-08-10', '10:00:00', 'Repetir os exames', '553810', '22358996072'),
(3, '2013-09-16', '09:00:00', 'Precisa RX', '553810', '09856787652');

INSERT INTO Exame (ID, descricao, data, valor, consultaID, medicoCRM) VALUES
(1, 'Exame1', '2013-09-11', 100, 1, '223810'),
(2, 'Exame2', '2013-09-10', 100, 2, '553810'),
(3, 'Exame3', '2013-01-01', 100, 2, '553810'),
(4, 'Exame4', '2013-04-02', 50, 3, '553810'),
(5, 'Exame5', '2013-02-07', 200, 1, '223810');
