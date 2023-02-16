/*REFORMATANDO STRINGS*/

--LISTANDO
SELECT departamento FROM funcionarios;


--DISTINCT
SELECT DISTINCT departamento FROM funcionarios;


--UPPER CASE
SELECT DISTINCT upper(departamento) FROM funcionarios;


--LOWER CASE
SELECT DISTINCT lower(departamento) FROM funcionarios;


--CONCATENAÇAO STRINGS USANDO "||"
SELECT cargo || '-' || departamento
FROM funcionarios;


SELECT upper (cargo || '-' || departamento) AS "cargo completo"
FROM funcionarios;


--CONTANDO CARACTERES
SELECT LENGTH('     TESTE    '); 


--REMOVER ESPAÇOS
SELECT TRIM('     TESTE    '); 


--CONTANDO CARACTERES
SELECT LENGTH(TRIM('     TESTE    ')); 


--COLUNA AO LADO DA COLUNA CARGO QUE DIGA SE A PESSOA É ASSISTENTE OU NAO
SELECT nome, (CARGO like '%Assistant%') as "assistente?"
FROM funcionarios;


SELECT nome, case when (CARGO like '%Assistant%') = true then 1
else 0
end as "assistente?"
FROM funcionarios;













