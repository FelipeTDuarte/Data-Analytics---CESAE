CREATE DATABASE modelo2022
GO
USE modelo2022
GO

CREATE TABLE seccao(
	numsec int PRIMARY KEY identity(10,10),
	nome varchar(50) NOT NULL,
	cidade varchar(50) NOT NULL
)
GO 
CREATE TABLE empregado(
	numemp int PRIMARY KEY IDENTITY(1,1),
	nome varchar(50) NOT NULL,
	seccao int NOT NULL REFERENCES seccao(numsec),
	posto varchar(50) NOT NULL,
	chefe int REFERENCES empregado(numemp),
	salario money NOT NULL,
	comissao int NOT NULL
)
GO
INSERT INTO seccao (nome, cidade)
VALUES ('Fabrica','Porto'), ('Comercial', 'Porto'),
('Marketing', 'Braga'), ('Planeamento', 'Guimarães'),
('Administração','Porto'), ('Informática', 'Braga'),
('Recursos Humanos', 'Guimarães')
GO 
SELECT * FROM seccao
GO
INSERT INTO empregado (nome, seccao, posto, salario,comissao)
VALUES ('Ana', 10, 'Programador', 3000, 10),
('Nuno', 70, 'Engenheiro', 1500,40),
('Álvaro', 50, 'Administrador', 2500,0),
('António', 10, 'Engenheiro', 1450,20),
('Susana', 20, 'Administrador',2750, 30),
('Cláudio', 60, 'Vendedor', 1000, 50)
GO
SELECT * FROM empregado
GO
UPDATE empregado SET chefe = 3 WHERE numemp =1;
UPDATE empregado SET chefe = 1 WHERE numemp =2;
UPDATE empregado SET chefe = 3 WHERE numemp =4;
UPDATE empregado SET chefe = 4 WHERE numemp =6;
GO
SELECT * FROM empregado
GO

--SELECT -> campos a visualizar 
--FROM -> tabela(s) onde vem os campos
--WHERE -> filtrar o resultado.
--ORDER BY -> ordenar ASC/DESC 

SELECT nome, cidade
FROM seccao
WHERE numsec =70
GO

SELECT posto,salario,comissao
FROM empregado
--WHERE comissao>100
WHERE salario*comissao > salario
GO

SELECT nome 
FROM seccao
WHERE cidade LIKE 'Porto'
GO

SELECT DISTINCT 
posto
FROM empregado 
GO

SELECT nome, seccao, posto
FROM empregado
--WHERE seccao BETWEEN 20 AND 40
WHERE seccao IN(20,30, 40)
GO

SELECT sum(salario * 12) as salario_anual
FROM empregado
WHERE posto LIKE 'Engenheiro' OR posto LIKE 'Programador'

SELECT count(*) FROM empregado
WHERE posto LIKE 'Engenheiro'

--sum//avg//max//min//count 

SELECT 'Nº '+ cast(numemp as varchar(20)), nome, posto
FROM empregado
ORDER BY numemp ASC


SELECT * FROM empregado,seccao
WHERE seccao.numsec = empregado.seccao

SELECT * FROM empregado INNER JOIN seccao
ON seccao.numsec = empregado.seccao


SELECT seccao, posto, count(*), avg(salario)
FROM empregado
WHERE seccao IN (10,20,30)
Group by seccao, posto
