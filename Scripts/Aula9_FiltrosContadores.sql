/*QUANDO SE REFERE A CONTADORES QUER DIZER USO DO COUNT*/
/*O WHERE FOI UTILIZADA POR TER SIDO USADA UMA COLUNA NAO AGREGADA*/

--CONTAR A LINHA DE FUNCIONARIOS
select count(*) from funcionarios;


--CONTAR O TOTAL DE FUNCIONARIOS E SEPARAR A QUANTIDADE MASCULINA
--OBS - NESSE CASO NAO VAI SER RETORNADO UM VALOR REAL
select count(*) as "quntidade total",
count('Masculino') as "masculino"
from funcionarios;


select sexo, count(*)
from funcionarios
where sexo = 'Masculino'
group by sexo;


--CONTAR O TOTAL DE FUNCIONARIOS E SEPARAR A QUANTIDADE MASCULINA
--OBS - UTILIZANDO UM SELECT NO COUNT, APRESENTA ERRO
select count(*) as "quntidade total",
count(select sexo, count(*)
from funcionarios
where sexo = 'Masculino'
group by sexo) as "masculino"
from funcionarios;


--CONTAR O TOTAL DE FUNCIONARIOS E SEPARAR A QUANTIDADE MASCULINA
--OBS - UTILIZANDO UM SELECT, APRESENTA ERRO
select count(*) as "quntidade total",
(select sexo, count(*)
from funcionarios
where sexo = 'Masculino'
group by sexo) as "masculino"
from funcionarios;


--CONTAR O TOTAL DE FUNCIONARIOS E SEPARAR A QUANTIDADE MASCULINA
--OBS - UTILIZANDO UM SELECT E COUNT APOS, FUNCIONA
select count(*) as "quntidade total",
(select count(*)
from funcionarios
where sexo = 'Masculino'
group by sexo) as "masculino"
from funcionarios;



--FAZENDO UM FILTRO DE FORMA MAIS SIMPLES USANDO FILTER
select count(*) as idfuncionario,
count(*) filter(where sexo = 'Masculino') as "masculino"
from funcionarios;

select count(*) as idfuncionario,
count(*) filter(where sexo = 'Masculino') as "masculino",
count(*) filter(where departamento = 'Books') as "departamento livros"
from funcionarios;

select count(*) as idfuncionario,
count(*) filter(where sexo = 'Masculino') as "masculino",
count(*) filter(where departamento = 'Books') as "departamento livros",
count(*) filter(where salario > 140000) as "salario > 140000"
from funcionarios;































