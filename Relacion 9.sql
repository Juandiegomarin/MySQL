-- Relacion 9

-- Ejercicio 1

select nomde, count(*) from departamentos
left join empleados on departamentos.numde= empleados.numde
group by departamentos.numde;


-- Ejercio 2

select departamentos.numde, departamentos.nomde, empleados.nomem -- , dirigir.fecfindir
from departamentos
left join dirigir on departamentos.numde = dirigir.numdepto
left join empleados on dirigir.numempdirec = empleados.numem
where ifnull(dirigir.fecfindir,curdate()) >= curdate()

union

select distinct departamentos.numde, departamentos.nomde,null-- , dirigir.fecfindir
from departamentos
left join dirigir on departamentos.numde = dirigir.numdepto
left join empleados on dirigir.numempdirec = empleados.numem
where ifnull(dirigir.fecfindir,curdate()) < curdate() 
	and departamentos.numde not in (select numde
									from departamentos join dirigir on departamentos.numde = dirigir.numdepto
									where ifnull(dirigir.fecfindir,curdate()) >= curdate()
									);


-- Ejercicio 3

select codreserva , codcasa, feciniestancia, numdiasestancia,null from reservas
where fecanulacion is not null

union

select reservas.codreserva , codcasa, feciniestancia, numdiasestancia, devoluciones.importedevol from reservas
join devoluciones on reservas.codreserva=devoluciones.codreserva
where year(fecanulacion) between year(curdate()) and year(curdate()+1);


select reservas.codreserva, reservas.codcasa, reservas.feciniestancia, 
	date_add(reservas.feciniestancia, interval reservas.numdiasestancia day),
	reservas.numdiasestancia, 
	ifnull(devoluciones.importedevol, 0)
from reservas left  join devoluciones on reservas.codreserva = devoluciones.codreserva 
where year(reservas.fecreserva) = year(curdate()) and
	reservas.fecanulacion is not null;
    
    -- Ejercicio 4
    
    select nomcasa,ifnull(count(reservas.codreserva),0) from casas
     join reservas on casas.codcasa= reservas.codcasa
     join zonas on casas.codzona= zonas.numzona
    where zonas.numzona=1
    group by casas.codcasa;


