
use empresaclase;

-- Ejercicio 1

select * from empleados;

-- Ejercicio 2

select empleados.extelem from empleados where empleados.nomem='Juan' and empleados.ape1em='Lopez';

-- Ejercicio 3

select empleados.nomem,empleados.ape1em,empleados.ape2em from empleados where empleados.numhiem>1;

-- Ejercicio 4

select concat_ws(' ' ,empleados.nomem,empleados.ape1em,empleados.ape2em) from empleados where empleados.numhiem between 1 and 3; 

-- Ejercicio 5

select concat_ws(' ' ,empleados.nomem,empleados.ape1em,empleados.ape2em) from empleados where empleados.comisem is null;

-- Ejercicio 6


select centros.dirce from centros where centros.nomce =' SEDE CENTRAL';

-- Ejercicio 7

select departamentos.nomde from departamentos where departamentos.presude > 6000;

-- Ejercicio 8

select departamentos.nomde from departamentos where departamentos.presude >= 6000;

-- Ejercicio 9

select concat_ws(' ' ,empleados.nomem,empleados.ape1em,empleados.ape2em) from empleados where empleados.fecinem >'1910-01-01';

-- Ejercicio 10

select concat_ws(' ' ,empleados.nomem,empleados.ape1em,empleados.ape2em) from empleados where empleados.fecinem between '2010-01-01' and '2020-01-01' ;

-- Ejercicio 11

drop procedure if exists muestraEmpleados;
delimiter $$
create procedure muestra_Empleados()
begin
select * from empleados;

end $$
delimiter ;

call muestra_Empleados;

drop procedure if exists muestraSinComision;
delimiter $$

create procedure muestraSinComision()
begin

select  concat_ws(' ' ,empleados.nomem,empleados.ape1em,empleados.ape2em) from empleados where empleados.comisem is null;

end $$
delimiter ;

call muestraSinComision;

-- Ejercicio 12

drop procedure if exists ejercicio12;
delimiter $$

create procedure ejercicio12(in nombre varchar(50),in ape1 varchar(50))
begin

select empleados.extelem from empleados where nomem= nombre and ape1em= ape1 ;

end $$
delimiter ;

call ejercicio12('Juan', 'Lopez');

-- Ejercicio 13


drop procedure if exists ejercicio13;
delimiter $$

create procedure ejercicio13(in hijos int)
begin

select empleados.nomem,empleados.ape1em,empleados.ape2em from empleados where empleados.numhiem>hijos;


end $$
delimiter ;

call ejercicio13(3);

-- Ejercicio 14
drop procedure if exists ejercicio14;
delimiter $$

create procedure ejercicio14(in hijos int)
begin

select empleados.nomem,empleados.ape1em,empleados.ape2em from empleados where empleados.numhiem>=hijos;


end $$
delimiter ;

call ejercicio14(3);


-- Ejercicio 15

drop procedure if exists ejercicio15;
delimiter $$

create procedure ejercicio15(in presupuesto int)
begin

select departamentos.nomde from departamentos where departamentos.presude > presupuesto;


end $$
delimiter ;

call ejercicio15(2000);

-- Ejercicio 16 


drop procedure if exists ejercicio16;
delimiter $$

create procedure ejercicio16(in presupuesto int)
begin

select departamentos.nomde from departamentos where departamentos.presude >= presupuesto;


end $$
delimiter ;

call ejercicio16(4000);

-- Ejercicio 17
drop procedure if exists ejercicio17;
delimiter $$
create procedure ejercicio17 (fecha1 date, fecha2 date)
begin
	

select CONCAT(nomem, ' ',
			  ape1em, ' ',
			 ifnull(ape2em,'')
		) as nombre, fecinem
from empleados
-- where fecinem >= fecha1 and fecinem <= fecha2
 where fecinem between fecha1 and fecha2
order by fecinem ;
end $$
delimiter ;

 call ejercicio17 ('1965/1/1', '1986/12/31');

-- Ejercicio 19
drop procedure if exists ejercicio19;
delimiter $$
create procedure ejercicio19(fecha1 date, fecha2 date)
begin
	

select CONCAT(nomem, ' ',
			  ape1em, ' ',
			 ifnull(ape2em,'')
		) as nombre, fecinem as fecha
from empleados
-- where fecinem < fecha1 OR  fecinem > fecha2
 where fecinem not between fecha1 and fecha2
order by fecinem;
end $$
delimiter ;

 call ejercicio19('1965/1/1', '1986/12/31');