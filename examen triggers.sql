

 delimiter $$
drop trigger if exists compruebaedad $$
create trigger compruebaedad
	before insert on empleados
for each row
begin
	-- if date_sub(curdate(), interval 16 year) < new.fecnaem then
    if date_add(new.fecnaem, interval 16 year) > curdate() then
    
		signal sqlstate '45000' set message_text = 'no se cumple la edad';
	end if;
end $$
delimiter ;




delimiter $$
drop trigger if exists compruebadeptodir $$
create trigger compruebadeptodir
	before insert on dirigir
for each row
begin
	declare mensaje varchar(100);
	if (select numde from departamentos where numem = new.numempdirec) <> new.numdepto then
	begin
		set mensaje = concat('El empleado no pertenece al departamento ', new.numdepto); -- en algunas versiones de mysql de error usar concat directamente en la sentencia signal
		signal sqlstate '45000' set message_text = mensaje;
	end;
    end if;
end $$
delimiter ; 


Carácter comodín
Descripción
USO
%
Cualquier cadena de cero o más caracteres.
LIKE
_ (subrayado)
Cualquier carácter individual
LIKE
[ ]
Cualquier carácter individual de intervalo ([a-f]) o del conjunto ([abcdef]) especificado.
RLIKE, REGEXP
[^]
Cualquier carácter individual que no se encuentre en el intervalo ([^a-f]) o el conjunto ([^abcdef]) especificado.
RLIKE, REGEXP
.
Cualquier carácter individual
RLIKE, REGEXP
*
Cualquier cadena de cero o más caracteres.
RLIKE, REGEXP
{n}
Varias repeticiones
RLIKE, REGEXP
^
La cadena comienza por lo que sigue al símbolo ^
RLIKE, REGEXP
$
La cadena termina por lo que antecede al símbolo $
RLIKE, REGEXP



create event ejer_g2_3

on schedule

-- every 1 quarter
every 3 month
	-- starts curdate() + interval 3 day
    -- starts '2021-05-25' + interval '3 17' day_hour
    starts '2021-05-25 17:00' + interval '3' day
    -- starts '2021-05-28 17:00'
    -- ends '2021-05-25' + interval '3 17' day_hour + interval 5 year
    ends '2021-05-25 17:00' + interval '3' day + interval 5 year
do call OptimizaDuracionProy();
-- ---------------------------------------------------------------------

alter table departamentos
	add column numempleados int not null default 0
-- EJER 5
delimiter $$
drop procedure if exists calculaNumEmple $$
create procedure calculaNumEmple ()
begin
	update departamentos
    set numempleados = (select count(*)
						from empleados
						where empleados.numde = departamentos.numde);
end $$
delimiter ;
-- EJER 6
delimiter $$
create event actualizaNumeroEmpleados
on schedule
	every 1 quarter
    starts '2022/6/1'
do
	begin
		call calculaNumEmple();
    end $$
    
delimiter ;
-- ----------------------------------------------
delimiter $$
drop trigger if exists compruebaedadEditar $$
create trigger compruebaedadEditar
	before update on empleados
for each row
begin
	if old.fecnaem <> new.fecnaem -- siempre se comprueba en los triggers de update si el campo modificado es el que nos afecta
		and date_add(new.fecnaem, interval 16 year) > curdate() then
    
		signal sqlstate '45000' set message_text = 'el empleado no cumple la edad';
	end if;
end $$
delimiter ;
-- ------------------------------------------------
-- EJER 7
delimiter $$
drop trigger if exists calculaNumEmpleborrado $$
create trigger calculaNumEmpleborrado 
	after delete on empleados
for each row
begin
	update departamentos
    -- set numempleados = (select count(*) from empleados where numde = old.numde)
    set numempleados =  numempleados -1
    where numde = old.numde;
end $$
delimiter ;