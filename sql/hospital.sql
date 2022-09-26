PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS Hospital;
DROP TABLE IF EXISTS Medico;
DROP TABLE IF EXISTS Especialidade;
DROP TABLE IF EXISTS MedicoEspecialidade;
DROP TABLE IF EXISTS Paciente;
DROP TABLE IF EXISTS Consulta;
DROP TABLE IF EXISTS Exame;

PRAGMA foreign_keys = ON;

CREATE TABLE Hospital (
  CNPJ VARCHAR(14) NOT NULL UNIQUE,
  nome VARCHAR(50) NOT NULL,
  endereco VARCHAR(127) NOT NULL,
  PRIMARY KEY (CNPJ)
);

CREATE TABLE Medico (
  CRM VARCHAR(6) NOT NULL UNIQUE,
  nome VARCHAR(50) NOT NULL,
  hospitalCNPJ VARCHAR(14),
  PRIMARY KEY (CRM),
  FOREIGN KEY (hospitalCNPJ) REFERENCES Hospital (CNPJ) ON DELETE CASCADE
);

CREATE TABLE Especialidade (
  ID INTEGER NOT NULL UNIQUE,
  nome VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE MedicoEspecialidade (
  medicoCRM VARCHAR(6) NOT NULL,
  especialidadeID INTEGER NOT NULL,
  PRIMARY KEY (medicoCRM, especialidadeID),
  FOREIGN KEY (medicoCRM) REFERENCES Medico (CRM) ON DELETE CASCADE,
  FOREIGN KEY (especialidadeID) REFERENCES Especialidade (ID) ON DELETE CASCADE
);

CREATE TABLE Paciente (
  CPF VARCHAR(11) NOT NULL UNIQUE,
  nome VARCHAR(50) NOT NULL,
  PRIMARY KEY (CPF)
);

CREATE TABLE Consulta (
  ID INTEGER NOT NULL UNIQUE,
  data DATE NOT NULL,
  hora TIME NOT NULL,
  diagnostico VARCHAR(255) NOT NULL,
  medicoCRM VARCHAR(6) NOT NULL,
  pacienteCPF VARCHAR(11) NOT NULL,
  PRIMARY KEY (ID),
  FOREIGN KEY (medicoCRM) REFERENCES Medico (CRM) ON DELETE CASCADE,
  FOREIGN KEY (pacienteCPF) REFERENCES Paciente (CPF) ON DELETE CASCADE
);

CREATE TABLE Exame (
  ID INTEGER NOT NULL UNIQUE,
  descricao VARCHAR(50) NOT NULL,
  data DATE NOT NULL,
  valor REAL NOT NULL,
  consultaID INTEGER,
  medicoCRM VARCHAR(6),
  PRIMARY KEY (ID),
  FOREIGN KEY (consultaID) REFERENCES Consulta (ID) ON DELETE CASCADE,
  FOREIGN KEY (medicoCRM) REFERENCES Medico (CRM) ON DELETE CASCADE
);

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

-- 2
SELECT Consulta.* FROM Consulta JOIN Paciente ON Consulta.pacienteCPF = Paciente.CPF WHERE strftime('%Y', Consulta.data) = '2013' AND Paciente.nome = 'Geraldo Otavio';

-- 3
SELECT Medico.nome FROM Medico JOIN MedicoEspecialidade ON Medico.CRM = MedicoEspecialidade.medicoCRM JOIN Especialidade ON MedicoEspecialidade.especialidadeID = Especialidade.ID WHERE Especialidade.nome = 'Pediatria';

-- 4
SELECT Medico.nome, count(Exame.ID) AS exames FROM Exame JOIN Medico ON Exame.medicoCRM = Medico.CRM WHERE strftime('%Y', Exame.data) = '2013' GROUP BY Medico.nome;

--5
SELECT Paciente.nome, sum(Exame.valor) AS totalPago FROM Exame JOIN Consulta ON Exame.consultaID = Consulta.ID JOIN Paciente ON Consulta.pacienteCPF = Paciente.CPF GROUP BY Paciente.nome;

-- 6
SELECT Paciente.nome FROM Paciente JOIN Consulta ON Paciente.CPF = Consulta.pacienteCPF JOIN Medico ON Consulta.medicoCRM = Medico.CRM WHERE Medico.nome = 'Mariana Lima' GROUP BY Paciente.nome;

-- 7
UPDATE MedicoEspecialidade SET medicoCRM = '121169' WHERE medicoCRM = '553810' AND especialidadeID = 1;
UPDATE MedicoEspecialidade SET especialidadeID = 5 WHERE medicoCRM = '223810' AND especialidadeID = 2;
SELECT Especialidade.nome, count(Paciente.CPF) AS pacientes FROM Paciente JOIN Consulta ON Paciente.CPF = Consulta.pacienteCPF JOIN Medico ON Consulta.medicoCRM = Medico.CRM JOIN MedicoEspecialidade ON Medico.CRM = MedicoEspecialidade.medicoCRM JOIN Especialidade ON MedicoEspecialidade.especialidadeID = Especialidade.ID GROUP BY Especialidade.nome;

-- 8
SELECT * FROM Medico ORDER BY Medico.nome ASC;

-- 9
SELECT count(*) AS pacientesCadastrados FROM Paciente;

-- 10
SELECT DISTINCT Medico.* FROM Medico JOIN Consulta ON Medico.CRM = Consulta.medicoCRM WHERE strftime('%d-%m-%Y', Consulta.data) = '10-08-2013';

-- 11
DELETE FROM Medico WHERE Medico.CRM = '223810';
SELECT * FROM Medico;