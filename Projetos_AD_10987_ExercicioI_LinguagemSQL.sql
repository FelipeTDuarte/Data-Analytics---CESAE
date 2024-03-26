CREATE DATABASE projetos
GO

USE projetos
GO

CREATE TABLE departamento(
depnum int PRIMARY KEY IDENTITY(1,1),
nome varchar(50) NOT NULL,
local varchar(100) NOT NULL
)
GO
CREATE TABLE projeto(
projnum int PRIMARY KEY IDENTITY(1,1),
designacao varchar(100) NOT NULL,
fundos money NOT NULL
)
GO
CREATE TABLE empregado(
empnum int PRIMARY KEY identity(1,1),
nome varchar(100) NOT NULL,
categoria varchar(50),
salario money NOT NULL,
depnum int FOREIGN KEY REFERENCES departmento(depnum) 
)
GO
CREATE TABLE atribuicao (
projnum int REFERENCES projeto(projnum),
empnum int REFERENCES empregado(empnum),
funcao varchar(50),
PRIMARY KEY (projeto, empnum)
)


INSERT INTO departamento (DepNum, Nome, Local)
VALUES (1, 'Logística', 'Francelos')--Quando não defino IDENTITY(1,1)

INSERT INTO departamento (Nome, Local)
VALUES ('Logística', 'Francelos'),--Quando defino IDENTITY(1,1)
('Mecânica', 'Gondomar'),
('Recursos Humanos', 'Porto'),
('Inovação e Tecnologias', 'Maia'), 
('Vendas',  'Porto')
GO

INSERT INTO empregado (Nome, Categoria, Salario, DepNum)
VALUES ('António Jorge Trindade', 'Engenheiro Mecânico', 2000.00, 2),
('Ana Luísa Freitas Bastos', 'Gestora', 1650.00, 3),
('Filipe Lencastre Amaral', 'Sociólogo', 1650.00,3),
('André Maia da Luz','Diretor Comercial',2000.00,5),
('Francisco Vieira dos Santos','Gestor',1250.00, 1)
GO

INSERT INTO projeto (Designacao, Fundos)
VALUES ('Controlo Baterias Elétricas',20000.00),
('ParticipaNaInovacaoMovel',75000.00),
('4 Fusao Optica rentável', 100000.00),
('CoLab Felicidade', 35000.00),
('Partilha Redes',2000.00)
GO

INSERT INTO atribuicao (ProjNum, EmpNum, Funcao)
VALUES (1,1,'Desenvolvimento'),
(1,2,'Coordenador'),
(1,3,'Motivador'),
(2,1,'Desenvolvimento'),
(4,3, 'Coordenador'),
(2,2,'Desenvolvimento'),
(2,5,'Análise de requisitos')











'

