/*AO EDITAR A CONEXAO É PRECISO ESPECIFICAR O BANCO UTILIZADO*/
/*FUNCOES DE AGREGAÇAO - AGREGA E SOMA, OU SEJA, RESUME*/
/*BUSINESS INTELLIGENCE - ANALISA O PASSADO*/
/*DATA SCIENCE - ANALISA O QUE PODE ACONTECER*/
/*AMBOS USAM AGREGAÇAO*/

--QUERY SIMPLES
select * from funcionarios;

--CONTANDO O NUMERO DE OCORRENCIAS -  VAI CONTANDO LINHAS E INCREMENTANDO EM UM, DEPOIS EXIBE O RESULTADO.
select count(*) from departamentos;
select count(*) from funcionarios;
select count(*) from localizacao;


--AGRUPANDO POR SEXO COM GROUP BY
select count(*) from funcionarios group by sexo;


--COLOCANDO O NOME DA COLUNA
select sexo, count(*) as "quantidade" from funcionarios group by sexo;


--MOSTRANDO O NUMERO DE FUNCIONARIOS EM CADA DEPARTAMENTO
select departamento, count(*) as "quantidade" from funcionarios group by departamento;


--EXIBINDO O MAXIMO DE SALARIOS
select max(salario) as "salario maximo" from funcionarios;


--EXIBINDO O MINIMO DE SALARIOS
select min(salario) as "salario minimo" from funcionarios;


--EXIBINDO O MAXIMO E MINIMO DE SALARIOS JUNTOS
select max(salario)as "salario maximo", min(salario) as "salario minimo" from funcionarios;


--EXIBINDO O MAXIMO E MINIMO DE SALARIOS DE CADA DEPARTAMENTO
select departamento, max(salario) as "salario maximo", min(salario) as "salario minimo"
from funcionarios group by departamento;


--EXIBINDO O MAXIMO E MINIMO DE SALARIOS POR SEXO
select sexo, max(salario) as "salario maximo", min(salario) as "salario minimo"
from funcionarios group by sexo;















