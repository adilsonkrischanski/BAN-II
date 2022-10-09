--1) Recupere o CPF e o nome dos m�dicos que atendem nos amborat�rios n�mero 1 e 2 
--(fa�a a consulta utilizado a cl�usula IN).
select m.cpf, m.nome
from medicos m 
where m.nroa in (1, 2)

--2) Recupere o CPF e o nome dos m�dicos que atendem nos ambulat�rios do 1� e 2� andares 
--(fa�a a consulta utilizando sub-consultas aninhadas).
select m.cpf, m.nome
from medicos m
where nroa in (select nroa from ambulatorios where andar in (1,2))

-- 3) Recupere o CPF e nome dos m�dicos que atenderam no dia 13/06/2008 (fa�a a consulta usando INNER JOIN).

select m.cpf, m.nome from medicos m join consultas c using (codm)
where c.data = '13/06/2008'

-- 4) Recupere o nome do m�dico, o nome do paciente e a hora da consultas para as consultas agendadas 
-- para o dia 12/06/2008 (fa�a a consulta usando INNER JOIN).

select m.nome as nome_medico, p.nome as nome_paciente, c.data, c.hora from medicos m join consultas c using (codm) 
join pacientes p using (codp)
where c.data = '12/06/2008'

--5)Recupere o nome e a especialidade de todos os m�dicos, e o n�mero e o andar do ambulat�rio para os 
-- m�dicos que tenham essa informa��o.

select m.nome, m.especialidade, a.nroa, a.andar
from medicos m left join ambulatorios a using (nroa)

--6) Recupere o nome de todos os m�dicos, e as datas de consultas para os m�dicos que t�m consultas feitas 
-- (deve aparecer apenas um registro de nome de m�dico para cada data de consulta).

select distinct m.nome, c.data
from medicos m join consultas c using (codm)

--7) Recupere a soma dos sal�rios pagos a todos os funcion�rios.
select sum(f.salario)
from funcionarios f

--8)Recupere a m�dia dos sal�rios pagos aos funcion�rios em cada cidade.
select f.cidade, avg(f.salario) as media_salario
from funcionarios f
group by f.cidade
order by media_salario

--9) Recupere a quantidade de consultas feitas por cada m�dico durante o per�odo de 12/06/2008 at� 19/06/2008

select m.codm, m.nome, count(*)
from medicos m join consultas c using (codm)
where data between '12/06/2008' and '19/06/2008'
group by m.codm, m.nome

--10) Recupere a quantidade de consultas feitas agrupada por cada especialidade m�dica.

select m.especialidade, count(*)
from medicos m join consultas c using (codm)
group by m.especialidade

--11) Recupere o nome e a idade dos pacientes que t�m idade maior que a m�dia de idade de todos os pacientes.
select p.nome, p.idade
from pacientes p
where idade > (select avg(idade) from pacientes)

--12) Recupere o n�mero dos ambulat�rios que t�m mais de uma consulta marcada para o mesmo dia.
select a.nroa, c.data, count(*)
from ambulatorios a join medicos m using(nroa) join consultas c using(codm)
group by a.nroa, c.data
having count(*) > 1

