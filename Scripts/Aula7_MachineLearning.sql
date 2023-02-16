/*VARIAVEIS DUMMY PARA MACHINE LEARN
 *SAO VARIAVEIS BINARIAS CRIADAS PARA REPRESENTAR UMA VARIAVEL
 *COM DUAS OU MAIS CATEGORIAS.
 */

--CONSULTA SIMPLES
select nome, sexo from funcionarios;

--UTILIZANDO O CASE
select nome, cargo,
case
	when cargo = 'Financial Advisor' then 'Condicao 01'
	when cargo = 'Structural Engineer' then 'Condicao 02'
	when cargo = 'Executive Secretary' then 'Condicao 03'
	when cargo = 'Sales Associate' then 'Condicao 04'
	else 'Outras condicoes'	
end as "condicoes"
from funcionarios;


select nome,
case
	when sexo = 'Masculino' then 'M'
	else 'F'	
end as "Sexo"
from funcionarios;


--UTILIZANDO VALORES BOOLEANOS
select nome, cargo, (sexo = 'Masculino') as Masculino, (sexo = 'Feminino') as Feminino
from funcionarios;


--MESCLANDO AS TECNICAS - VARIAVEL DUMMY
select nome, cargo,
case 
	when (sexo = 'Masculino') = true then 1
	else 0
end as "masculino",
case 
	when (sexo = 'Feminino') = true then 1
	else 0
end as "feminino"
from funcionarios;









