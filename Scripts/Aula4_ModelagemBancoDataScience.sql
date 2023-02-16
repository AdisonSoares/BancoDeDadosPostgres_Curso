/*AO EDITAR A CONEXAO É PRECISO ESPECIFICAR O BANCO UTILIZADO*/
/*MODELAGEM DE BANCO DE DADOS x DATA SCIENCE*/

/*BANCO DE DADOS - 1, 2 e 3 FORMAS NORMAIS, EVITAM REDUNDANCIA, CONSEQUENTEMENTE
 *POUPAM ESPAÇO EM DISCO, CONSOMEM MUITO PROCESSAMENTO EM FUNÇAO DE JOINS. QUERIES LENTAS.*/

/*DATA SCIENCE E B.I - FOCADO EM AGREGAÇOES E PERFOMANCE, NAO SE PREOCUPAM COM ESPAÇO EM
 *DISCO, EM B.I, MODELAGEM MINIMA(DW) EM DATA SCIENCE, PREFERENCIALMENTE MODELAGEM COLUNAR.*/

/*O SERVIDOR E MAQUINAS GEROU UM ARQUIVO DE LOG CSV, É PRECISO IMPORTA-LO E ANALISA-LO
 *DENTRO DO BANCO.*/

/*OBS - COMO O BANCO ESTA NO CONTEINER DOCK FOI PRECISO COPIAR O ARQUIVO CSV PARA
 *O ARQUIVO TMP DO CONTEINER POR MEIO DO TERMINAL.*/


--IMPORTANDO CSV, ANTES É PRECISO CRIAR A TABELA QUE RECEBE O ARQUIVO
create table maquinas(
	maquina varchar(20),
	dia int,
	qtd numeric(10,2)
);



--IMPORTANDO CSV
 copy maquinas
 from '/tmp/LogMaquinas.csv'
 delimiter ','
 csv header;



--MEDIA DE CADA MAQUINA
select maquina, avg(qtd) as media_qtd
from maquinas
group by maquina
order by 2 desc;



--ARREDONDANDO
select maquina, round(avg(qtd),2) as media_qtd
from maquinas
group by maquina
order by 2 desc;



--MODA DAS QUANTIDADE
select maquina, qtd, count(*) as "moda"
from maquinas
group by maquina, qtd
order by 3 desc;



--MODA DAS QUANTIDADES DE CADA MAQUINA
select maquina, qtd, count(*) as "moda"
from maquinas
where maquina = 'Maquina 01'
group by maquina, qtd 
order by 3 desc
limit 1;

select maquina, qtd, count(*) as "moda"
from maquinas
where maquina = 'Maquina 02'
group by maquina, qtd 
order by 3 desc
limit 1;

select maquina, qtd, count(*) as "moda"
from maquinas
where maquina = 'Maquina 03'
group by maquina, qtd 
order by 3 desc
limit 1;



--MODA DO DATASET INTEIRO
select qtd, count(*) as "moda"
from maquinas
group by qtd 
order by 2 desc;


--MAXIMO E MINIMO E AMPLITUDE DE CADA MAQUINA
select maquina,
	max(qtd) as "maximo",
	min(qtd) as "minimo",
	max(qtd) - min(qtd) as "amplitude"
from maquinas
group by maquina
order by 4 desc;


--MEDIA NO RELATORIO
select maquina,
	avg(qtd) as "media", 
	max(qtd) as "maximo",
	min(qtd) as "minimo",
	max(qtd) - min(qtd) as "amplitude"
from maquinas
group by maquina
order by 4 desc;


--DESVIO PADRAO E VARIANCIA
select maquina,
	avg(qtd) as "media", 
	max(qtd) as "maximo",
	min(qtd) as "minimo",
	max(qtd) - min(qtd) as "amplitude",
	round(stddev_pop(qtd),2) as "desvio_padrão",
	round(var_pop(qtd),2) as "variancia"
from maquinas 
group by maquina
order by 4 desc;


--CALCULO DA VARIANCIA
create or replace function _final_median(numeric[])
	returns numeric as 
$$
	select avg(val) 
	from(
		select val
		from unnest($1) val
		order by 1
		limit 2 - mod(array_upper($1, 1),2)
		offset ceil (array_upper($1, 1) / 2.0) -1
	)sub;
$$
language 'sql' immutable;

create aggregate media(numeric)(
	sfunc = array_append,
	stype = numeric[],
	finalfunc = _final_median,
	initcond = '{}'
);

--CALCULO DA MEDIANA - TODAS AS MAQUINAS
select media(qtd) as mediana
from maquinas;

--CALCULO DA MEDIANA - MAQUINAS ESPECIFICAS
select media(qtd) as mediana
from maquinas
where maquina = 'Maquina 01';

select media(qtd) as mediana
from maquinas
where maquina = 'Maquina 02';

select media(qtd) as mediana
from maquinas
where maquina = 'Maquina 03';



/* FUNCAO E ANALISE DA MEDIANA.
 * QUANTIDADE - TOTAL - MEDIA - MAXIMO - MINIMO - AMPLITUDE - VARIANCIA
 * DESVIO PADRAO - MEDIANA - COEF. VAR.*/
select maquina,
	count(qtd) as "Quantidade",
	sum(qtd) as "Total",
	avg(qtd) as "Media",
 	max(qtd) as "Maximo",
	min(qtd) as "Minimo",
	max(qtd) - min(qtd) as "Amplitude total",
	round(var_pop(qtd),2) as "Variancia",
	round(stddev_pop(qtd),2) as "Desvio padrão",
	media(qtd) as "Mediana",
	round((stddev_pop(qtd) / avg(qtd)) *100,2) as "Coef. Variação"
	from maquinas
	group by maquina
	order by 1 desc;

	
/*OBS - Os valores nao batem com o do curso pois foram acrescentados dois dias*/
/*Para mostrar os mesmos dados é preciso deletar dois dias*/
delete from maquinas where dia = 11 or dia = 12;	



/*CALCULO DA MODA - MODE() WITHIN GROUP(ORDER BY COLUNA)*/
/*COMO NAO TEM AGRUPAMENTO VAI TRAZER A MODA DAS TRES MAQUINAS*/
select mode() within group(order by qtd) as "Moda" from maquinas;
	
	


/*CALCULO DA MODA - MODE() WITHIN GROUP(ORDER BY COLUNA)*/
/*AGRUPANDO PARA TRAZER A MODA DE CADA COLUNA DE MAQUINA*/
select maquina, 
mode() within group(order by qtd) as "Moda" 
from maquinas
group by maquina;
	
	
	
	
/* FUNCAO E ANALISE DA MEDIANA.
 * QUANTIDADE - TOTAL - MEDIA - MAXIMO - MINIMO - AMPLITUDE - VARIANCIA
 * DESVIO PADRAO - MEDIANA - COEF. VAR - MODA.*/	
select maquina,
	count(qtd) as "Quantidade",
	sum(qtd) as "Total",
	avg(qtd) as "Media",
 	max(qtd) as "Maximo",
	min(qtd) as "Minimo",
	max(qtd) - min(qtd) as "Amplitude total",
	round(var_pop(qtd),2) as "Variancia",
	round(stddev_pop(qtd),2) as "Desvio padrão",
	media(qtd) as "Mediana",
	round((stddev_pop(qtd) / avg(qtd)) *100,2) as "Coef. Variação",
	mode() within group(order by qtd) as "Moda"
	from maquinas
	group by maquina
	order by 1 desc;
	
	
	
	
	
	
	
	
	
	
	
	
	



