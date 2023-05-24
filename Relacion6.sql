-- Relacion 6


-- Ejercicio 1

select  concat(char(ascii(left(nomem,1))+10),
		concat(CHAR(ASCII(LEFT(ape1em,1))+5),CHAR(ASCII(substring(ape1em,2,1))+5),CHAR(ASCII(substring(ape1em,3,1))+5)),
		concat(CHAR(ASCII(ifnull(LEFT(ape2em,1),'L'))+5),CHAR(ASCII(ifnull(substring(ape2em,2,1),'M'))+5),CHAR(ASCII(ifnull(substring(ape2em,3,1),'N'))+5)),
		substring(ifnull(dniem,'3'),-2,1))
		from empleados; 
        

SELECT concat(char(ascii(left(nomem,1))+10),
							concat(CHAR(ASCII(LEFT(ape1em,1))+5),
								   CHAR(ASCII(substring(ape1em,2,1))+5),
								   CHAR(ASCII(substring(ape1em,3,1))+5)
								),
							concat(CHAR(ASCII(ifnull(LEFT(ape2em,1),'L'))+5),
								   CHAR(ASCII(ifnull(substring(ape2em,2,1),'M'))+5),
								   CHAR(ASCII(ifnull(substring(ape2em,3,1),'N'))+5)
								),
							substring(ifnull(dniem,'3'),-2,1)
							) as contraseña
			FROM empleados;
			
-- Ejercicio 2

set @cadena = substring('Eva Tortosa Sánchez', locate(' ', 'Eva Tortosa Sánchez',1)+1); -- @cadena ==> Tortosa Sánchez
select SUBSTRING_INDEX(@cadena, ' ',1); -- Devuelve: Tortosa


select nomcontacto, SUBSTRING_INDEX(nomcontacto, ' ',1) as nombre, 
	substring(nomcontacto, locate(' ', nomcontacto)+1) as sin_nombre,
	SUBSTRING_INDEX(substring(nomcontacto, locate(' ', nomcontacto,1)+1), ' ',1) as apellido1,
	SUBSTRING_INDEX(nomcontacto, ' ',-1) as apellido2
from proveedores;

-- Ejercicio 3

select round(salarem*1.05,2)from empleados;

-- Ejercicio 4 

drop function if exists esfecha_ejer_6_6_4;
delimiter $$
create function esfecha_ejer_6_6_4 
	(cadena char(15) )
returns char(10)
	NO SQL
    DETERMINISTIC
     COMMENT 'MÓDULO: BASES DE DATOS - UNIDAD 6 - RELACION 6- EJERCICIO 4'
begin
	declare resultado bit;
if str_to_date(cadena,'%d%m%a') is null then
		set resultado = 'false';
else
	set resultado = 'verdadero';
end if;
return resultado;
end $$
delimiter ;

select esfecha_ejer_6_6_4(null);

-- Ejercicio 5

select round(datediff(curdate(),fecnaem)/360,0)  from empleados;

-- Ejercicio 6

select day(date_add(fecinem, interval 3 month)) from empleados;

  

-- Ejercicio 7

drop function if exists numDiaSemana_ejer_6_6_7;
delimiter $$
create function numDiaSemana_ejer_6_6_7
	(fecha date)
returns int
	NO SQL
    DETERMINISTIC
    
    COMMENT 'MÓDULO: BASES DE DATOS - UNIDAD 6 - RELACION 6- EJERCICIO 7'
begin
	-- PROBAMOS ==> select numDiaSemana_ejer_6_6_7(curdate());
	-- select numDiaSemana_ejer_6_6_7('2020/3/22');
	declare resultado int;
    
    set resultado =if(dayofweek(fecha)=1, 7,dayofweek(fecha)-1);
    /* aclaración:
    dayofweek(fecha) si fecha es domingo ==> 1 , por tanto lo cambio a 7
	dayofweek(fecha) si fecha es lunes ==> 2, por tanto es  dayofweek(fecha)-1
    dayofweek(fecha) si fecha es martes ==> 3, por tanto es  dayofweek(fecha)-1
    ...
    */
    return resultado;
end $$
delimiter ;

-- Ejercicio 8

select nomem ,
 concat(if(day(fecnaem)<10,concat('0',day(fecnaem)),day(fecnaem)),'/',if(month(fecnaem)<10,concat('0',month(fecnaem)),month(fecnaem)),'/',year(fecnaem)),
 concat(day(fecnaem),'/',month(fecnaem),'/',year(fecnaem)),
 concat(day(fecnaem),'/',month(fecnaem),'/',left(year(fecnaem),2)),
  concat(day(fecnaem),'-',month(fecnaem),'-',right(year(fecnaem),2)),
  date_format(fecnaem,'%d %b %Y')
 from empleados;
 
 -- Ejercicio 9
 
 select concat(day(fecnaem),' de ',monthname(fecnaem),' de ', year(fecnaem)) from empleados;
 
  
 


