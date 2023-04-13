-- Simulacion 1

use GBDturRural2015;

delimiter $$

create procedure muestraCasas()

begin

select * from casas;
 


end &&
delimiter ;

call muestraCasas();

 