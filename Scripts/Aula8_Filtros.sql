/*COLUNAS NAO AGRAGADAS USA-SE WHERE
 *COLUNAS AGREGADAS USA-SE HAVING DEPOIS DO GROUP BY */


/*FILTROS DE GRUPO*/

--FILTROS BASEADOS EM VALORES NUMERICOS
select nome, departamento, salario
from funcionarios
where salario > 100000;


--FILTROS BASEADOS EM STRINGS
select nome, departamento, salario
from funcionarios
where departamento = 'Ferramentas';


--FILTROS BASEADOS EM MULTIPLOS TIPOS E COLUNAS - CONSIDERAR OR E AND
select nome, departamento, salario
from funcionarios
where departamento = 'Ferramentas'
and salario > 100000;


--FILTRO BASEADO EM UNICO TIPO E COLUNA - ATENCAO PARA A REGRA DO AND E OR
--EM RELACIONAMENTOS 1X1 O FILTRO AND EM UMA UNICA COLUNA RESULTARA EM FALSO
select nome, departamento, salario
from funcionarios
where departamento = 'Ferramentas'
and departamento = 'Books';


--FILTROS BASEADOS EM PADROES DE CARACTERES - COMEÇA COM B E TERMINAL DE QUALQUER FORMA
select departamento, sum(salario) as "total"
from funcionarios
where departamento like 'B%'
group by departamento;


--FILTROS BASEADOS EM PADRAO DE CARACTERES COM MAIS LETRAS
select departamento, sum(salario) as "total"
from funcionarios
where departamento like 'Be%'
group by departamento;


--UTILIZANDO CARACTER CURINGA NO MEIO DA PALAVRA
select departamento, sum(salario) as "total"
from funcionarios
where departamento like 'B%s'
group by departamento;



--FILTRAR O AGRUPAMENTO PELO SALARIO, MAIOR QUE 4000000
--OBS - APRESENTA ERRO POR AGREGAR SUM QUE NAO FAZ PARTE DE UMA TABELA
select departamento, sum(salario) as "total"
from funcionarios
where departamento like 'B%' and sum(salario) > 4000000
group by departamento;


select departamento, sum(salario) as "total"
from funcionarios
where departamento like 'B%'
group by departamento
having sum(salario) > 4000000;



