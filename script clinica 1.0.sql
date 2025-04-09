select * from medicos;

select nome, idade  -- selecionar linhas
from medicos;

select * 
from medicos 
where codm = 3;  -- selecionar colunas

select *
from medicos
where idade > 30 and especialidade = 'pediatria';

select *
from medicos
where idade > 30 or especialidade = 'pediatria';

select count(*)
from medicos;

select min(idade) from medicos;

select max(idade) from medicos;

select avg(idade) from medicos;

select sum(idade) from medicos;

select especialidade from medicos;

select distinct especialidade from medicos;

select idade from medicos;

select idade from medicos order by idade;

select idade from medicos order by  idade asc;

select idade from medicos order by  idade desc;

select * from medicos where idade > 20 and idade <40;

select * from medicos where idade between 20 and 40; -- between considera inclusive o 20 e 40

select * from medicos where idade >= 20 and idade <= 40;

select * from medicos where cidade = 'Florianopolis' or cidade = 'Joinville';

select * from medicos where cidade in ('FLorianopolis','Joinville');

select * from medicos where cidade not in ('Florianopolis','Joinville');

select * from medicos where nome like 'j%';

select * from medicos where nome like '%a';

select * from medicos where nome like '%a%';

select * from medicos where nome like '_o%';

select * from medicos where nome like '____co%';

select * from medicos as m, consultas as c where m.codm=c.codm and especialidade in ('ortopedia', 'pediatria');

select * from medicos as m join consultas as c on m.codm=c.codm where especialidade in ('ortopedia','pediatria');

select nome,cpf from medicos union select nome,cpf from funcionarios;

-- Exercícios slide 16 aula 3
-- 1)
select nome,cpf from medicos where idade < 40 or 'especialidade' != 'traumatologia';
-- 2)
select * from consultas where data > '2006/06/19' and hora > '12:00';
-- 3)
select nome,idade from pacientes where cidade  not in ('Florianopolis');
-- 4)
select hora from consultas where  data > '2024/12/20' and data < '2024/06/14';
-- 5) 
select  nome,idade*12 from pacientes;
-- 6)
select cidade from funcionarios;
-- 7)
select MAX(salario), MIN(salario) from funcionarios where cidade in ('Florianopolis');
-- 10)
select hora from consultas where data = '2024/06/13' order by data desc;
-- 11)
select avg(idade),count(nroa)from medicos; 
-- 12)
select nome,codf,salario - (salario*0.2) from funcionarios;
-- 13) 
select nome from funcionarios where nome like '%a';
-- 14)
select nome,cpf from funcionarios where cpf != '00000';
-- 15)
select nome, especialidade from medicos where nome like '_o%' and nome like '%o';
-- 16)
select codp,nome from pacientes where idade > 25 and doenca in ('tendinite','fratura','gripe','sarampo');

-- Exercicios slide 24 aula 3
-- 1)
select nome,cpf  from medicos union select nome,cpf from pacientes where nome = nome;