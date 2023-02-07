/*AO EDITAR A CONEXAO É PRECISO ESPECIFICAR O BANCO UTILIZADO*/
/*ESTATISTICAS BASICA*/

--MOSTRANDO UMA QUANTIDADE LIMITADA DE LINHAS - 10 LINHAS
select * from funcionarios
limit 10;

--GASTO TOTAL DE SALARIO PAGO PELA EMPRESA
select sum(salario) as "total de salarios" from funcionarios;


--MONTANTE QUE CADA DEPARTAMENTO RECEBE DE SALARIO
select departamento, sum(salario) as "total de salarios" 
from funcionarios group by departamento;


--TOTAL E MEDIA PAGA PARA OS FUNCIONARIOS, POR DEPARTAMENTO - AVG MEDIA
select departamento, sum(salario) as "total de salarios",
avg(salario) as "media de salarios"
from funcionarios group by departamento;


--TOTAL E MEDIA PAGA PARA OS FUNCIONARIOS, POR DEPARTAMENTO - ORDENANDO PELA COLUNA 3(AVG - MEDIA)
select departamento, sum(salario) as "total de salarios",
avg(salario) as "media de salarios"
from funcionarios group by departamento
order by 3;


--TOTAL E MEDIA PAGA PARA OS FUNCIONARIOS, POR DEPARTAMENTO - ORDENANDO PELA COLUNA 3(AVG - MEDIA ASCENDENTE MENOR P/ MAIOR)
select departamento, sum(salario) as "total de salarios",
avg(salario) as "media de salarios"
from funcionarios group by departamento
order by 3 ASC;


--TOTAL E MEDIA PAGA PARA OS FUNCIONARIOS, POR DEPARTAMENTO - ORDENANDO PELA COLUNA 3(AVG - MEDIA DESCENDENTE MAIOR P/ MENOR)
select departamento, sum(salario) as "total de salarios",
avg(salario) as "media de salarios"
from funcionarios group by departamento
order by 3 DESC;







