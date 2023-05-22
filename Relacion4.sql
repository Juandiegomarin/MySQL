
-- Relacion 4 tema 7
use empresaclase;
-- Ejercicio 1

select nomem, salarem from empleados
where numhiem>3
order by nomem;

-- Ejercicio 2
select comisem, numde, nomem from empleados
where salarem>190.000
order by numde asc,comisem desc;

-- Ejercicio 3

select nomde 
from departamentos join  dirigir on departamentos.numde= dirigir.numdepto
where dirigir.tipodir='f'
order by nomde;

-- Ejercicio 4

select nomem,numem,extelem 
from empleados
 where numde=121 
 order by nomem;
 
 -- Ejercicio 5
 select comisem, nomem, salarem from empleados
 where numhiem>3
 order by comisem,nomem;
 
 -- Ejercicio 6
 select nomem, salarem+ifnull(comisem,0) from empleados
 where salarem>300.000
 order by numem;

-- Ejercicio 7
select numde from empleados
where empleados.comisem > salarem*0.2;

-- Ejercicio 8

select nomem from empleados
where numhiem*100 < salarem *0.1
order by nomem;

-- Ejercicio 9

create event ejercicio9Relacion4
on schedule
every 1 year

starts '01-01-12 00:00'
ends '01-01-12 00:00'

do update departamentos
set presude = presude*0.1
where presude>500.00;

-- Ejercicio 15
select nomem from empleados
where ifnull(comisem,0)=0
order by length(nomem) asc;

-- Ejercicio 16

select numde , presude from departamentos;

-- Ejercicio 17
select avg(salarem) from empleados 
where salarem*0.2< (select min(salarem)from empleados where numhiem>0 and salarem/numhiem>100.00);

select avg(salarem)
	from empleados
    where salarem <= all (select 1.20*min(salarem)
							from empleados
                            where numhiem>0
                            group by numhiem
                            having avg(salarem) > 100);


-- Ejercicio 18
select max(salarem)-min(salarem) from empleados;

-- Ejercicio 19

select avg(numhiem) from empleados where numhiem<3;


	select round(avg(numhiem)/count(*), 2)
    from empleados
	where numhiem <= 2;

-- Ejercicicio 20

select avg(salarem),comisem,count(*) from empleados
group by ifnull(comisem,0);

select ifnull(comisem, 'sin comisión'), 
		   avg(salarem) as salario_medio, count(*)
	from empleados
	group by ifnull(comisem, 'sin comisión')
	having count(*) > 1;


-- Ejercicio 21

select count(numem),avg(salarem),extelem
from empleados
group by extelem;

-- Ejercicio 22

select count(distinct extelem), departamentos.numde from empleados
join departamentos on empleados.numde= departamentos.numde
-- where avg(departamentos-presude)>1000
group by departamentos.numde
having avg(departamentos.presude)>(select avg(salarem) from empleados);

-- Ejercicio 23

select avg(salarem) from empleados
join departamentos on empleados.numde= departamentos.numde
group by departamentos.numde
having avg(empleados.salarem)>= all (select avg(salarem) from empleados group by numde);



-- Ejercicio 24

select empleados.nomem from empleados
join dirigir on empleados.numem=dirigir.numempdirec
where dirigir.tipodir='f'
order by nomem;

-- Ejercicio 25

select nomem, comisem*1.05 from empleados
join dirigir on empleados.numem=dirigir.numempdirec
where tipodir="f";

-- Ejercicio 26

-- delete from empleados
select numem from empleados where empleados.salarem > (select avg(salarem) from empleados as e where e.numde=empleados.numde);

-- Ejercicio 27

select nomem , salarem*0.95 from empleados 
where salarem>(select max(salarem) from empleados as e where e.numde=empleados.numde)/2;

-- Ejercicio 29

select nomde from departamentos 
where ifnull(depende,0)=0;

-- Ejercicio 30

select nomem from empleados
where salarem>(select salarem from empleados where nomem='Fabiola' and ape1em='Ruiz')*1.5
order by nomem;

SELECT concat(ape1em, ' ', 
	ifnull(ape2em,''),', ', nomem) as nombre
FROM empleados
WHERE salarem >= (SELECT salarem *1.5
				  FROM empleados
				  WHERE concat(nomem, ' ', ape1em, 
							   ifnull(concat(' ', ape2em),'')
							   ) = 'Fabiola Ruiz'
				)
ORDER BY nomem;

-- Ejercicio 31

select * from centros where dirce rlike '(C.|C/|Calle)*atocha'; 

-- Ejercicio 32

select nomem from empleados where
salarem>any(select salarem from empleados where numde=121);

-- Ejercicio 33

select nomem, salarem, comisem  from empleados
where empleados.salarem = empleados.comisem or empleados.salarem=any (select salarem from empleados as e where empleados.salarem=e.comisem);	

SELECT nomem, ape1em, ape2em, salarem, comisem
FROM empleados
-- wHERE salarem in (SELECT comisem FROM empleados);
-- WHERE salarem = any(SELECT comisem FROM empleados);
-- WHERE salarem = some(SELECT comisem FROM empleados);
WHERE not salarem <> all (SELECT ifnull(comisem,0) FROM empleados);

-- Ejercicio 34

select nomem, numde 
from empleados
 where numde in
				(select numde 
				from empleados 
				where (nomem='Pilar' and ape1em='Gálvez') or (nomem='Dorotea' and ape1em='Flor'))
                order by nomem;

-- Ejercicio 35

select nomem from empleados where salarem >3.5*(select min(salarem)from empleados where numde=120);

-- Ejercicio 36

select min(salarem),max(salarem) , numhiem from empleados
group by numhiem
having numhiem>1 and count(*) > 1;

-- EJercicio 37

select nomce,dirce, empleados.nomem 
from centros join departamentos on centros.numce=departamentos.numce
join empleados on departamentos.numde=empleados.numde
where ifnull(empleados.comisem,0)=0;

-- Ejercicio 38


select count(*) from empleados 
join departamentos on empleados.numde = departamentos.numde
join centros on departamentos.numce = centros.numce
where centros.numce =10;

-- Ejercicio 39

select count(*) from empleados 
join departamentos on empleados.numde = departamentos.numde
join centros on departamentos.numce = centros.numce
group by centros.numce;

-- Ejercicio 40



