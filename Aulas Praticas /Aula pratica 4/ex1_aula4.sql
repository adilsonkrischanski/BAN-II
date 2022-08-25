--1
select nome,endereco from cliente
--2
select nome,funcao from mecanico where cods=2
--3
select cpf, nome from cliente natural join mecanico
--4
select distinct cidade from mecanico
--5
select marca from veiculo v join cliente c on v.codc= c.codc where c.cidade = 'Joinville'
--6
select funcao from mecanico
--7 
select * from cliente where idade >25
--8
select cpf, nome from mecanico
--9
select distinct cpf, nome from mecanico m join conserto c on c.codm=m.codm where data='2014-06-13'
--10
select c.nome,v.modelo,m.nome,m.funcao from cliente c join veiculo v on c.codc=v.codv left join conserto man on man.codv=v.codv left join mecanico m on m.codm=man.codm
--11
select m.nome as mecanico, c.nome as cliente, v.modelo, man.data from cliente c join veiculo v on c.codc=v.codv join conserto man on man.codv=v.codv join mecanico m on m.codm=man.codm where man.data ='2014-06-19'
--12
select distinct s.cods,s.nome from conserto c natural join mecanico m join setor s on m.cods= s.cods where c.data >'2014-06-12' and c.data < '2014-06-14' 

