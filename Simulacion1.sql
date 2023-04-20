-- Simulacion 1

-- Ej1
select * from casas where (minpersonas>=4 and maxpersonas<=6) and provincia='Sevilla';

-- Ej2

select reservas.codreserva as reserva, concat_ws(" ",clientes.nomcli,clientes.ape1cli,clientes.ape2cli) as nombre, ifnull(devoluciones.importedevol, 0) as devolucion
from reservas join clientes on reservas.codcliente=clientes.codcli join devoluciones on reservas.codreserva= devoluciones.codreserva
where reservas.fecanulacion between '2001-01-01' and '2023-12-31';


select * from reservas;
select * from devoluciones;

-- Ej 3

drop procedure if exists ejercicio3;

delimiter $$

create procedure ejercicio3(in carasteristica int)
begin

select casas.codcasa as CodigoCasa, casas.nomcasa as Nombre, casas.poblacion as Poblacion ,tiposcasa.nomtipo as TipoCasa
from casas join tiposcasa on casas.codtipocasa = tiposcasa.numtipo join caracteristicasdecasas on casas.codcasa= caracteristicasdecasas.codcasa
 
 where caracteristicasdecasas.codcaracter= carasteristica
 order by casas.poblacion, casas.preciobase desc;




end $$
delimiter ;

call ejercicio3(1);

select * from casas;

-- Ej 4

drop procedure if exists ejercicio4;

delimiter $$

create procedure ejercicio4(in zona int)
begin 

select casas.nomcasa as Nombre, casas.poblacion as Poblacion from casas 
where casas.codzona = zona;


end $$
delimiter ;
call ejercicio4(1);

drop procedure if exists ejercicio5;

delimiter $$
 create procedure ejercicio5(in numeroZona int)
 begin
 
 select * from zonas where numzona= numeroZona;
 
 end $$
 delimiter ;

call ejercicio5(1);




