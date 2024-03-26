--SELECT 
--FROM 
--WHERE
--GROUP BY
--ORDER BY
--8
SELECT seccao,
	 COUNT(*) Total_Emp,
	 SUM(salario+salario*comissao/100)
FROM empregado
GROUP BY seccao

--9
SELECT empregado.nome, numsec, 
	seccao.nome, cidade
FROM empregado, seccao
WHERE Empregado.seccao = 
	seccao.numsec
--10
SELECT seccao, posto,
	count(*) Total_emp,
	avg(salario+
		salario*comissao/100)
FROM empregado
WHERE seccao IN(10,20,30)
GROUP BY seccao, posto

--11
SELECT seccao, sum((salario+salario*comissao/100)*12) total_ano, 
count(*) total_emp
	FROM empregado
WHERE posto LIKE 'vendedor'
GROUP BY seccao

--12
SELECT seccao, count(*)/((SELECT count(*) FROM empregado)*1.0)*100
FROM empregado
GROUP BY seccao

SELECT count(*) FROM empregado

SELECT 1/(10*1.0)

--13
SELECT avg(salario) 
FROM empregado
WHERE posto NOT IN ('administrador')
--WHERE posto NOT LIKE 'administrador'

--14
SELECT TOP 1 nome, posto 
FROM empregado 
ORDER BY (salario+salario*comissao/100) DESC

SELECT nome, posto 
FROM empregado 
WHERE salario+salario*comissao/100 = (SELECT MAX(salario+salario*comissao/100)	
										FROM empregado)

--15
SELECT nome, posto, salario
FROM empregado
WHERE seccao <> 10
AND salario IN (SELECT salario FROM empregado WHERE seccao =10)
AND posto IN (SELECT posto FROM empregado WHERE seccao=10)

--16
SELECT seccao, nome,posto, salario+salario*comissao/100
FROM empregado
WHERE seccao=20 
AND (salario+salario*comissao/100) = (SELECT MAX(salario+salario*comissao/100)
										FROM empregado
										WHERE posto LIKE 'Vendedor')

--17
SELECT seccao, avg(salario+salario*comissao/100) salario_medio
FROM empregado
GROUP BY seccao
HAVING avg(salario+salario*comissao/100)>2000

--18
SELECT seccao,count(*) num_vendedores
FROM empregado
WHERE posto IN ('vendedor')
GROUP BY seccao
HAVING count(*) > 2

--19
SELECT seccao, avg(salario+salario*comissao/100) salario_medio
FROM empregado
GROUP BY seccao
HAVING avg(salario+salario*comissao/100) > (SELECT 
												AVG(salario+salario*comissao/100)
												FROM empregado)

--20
SELECT nome, posto, salario
FROM empregado
WHERE salario+salario*comissao/100 > (SELECT 
											AVG(salario+salario*comissao/100) 
											FROM empregado)
