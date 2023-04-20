-- Relacion 5


use bdalmacen;


-- Ej 1
drop procedure if exists ej1;
delimiter $$

create procedure ej1(in letra char(1))
begin

select *
from  productos
where left(descripcion,1)=letra;

end $$
delimiter ;

call ej1('a');


-- Ej 2


drop procedure if exists ej2;
delimiter $$

create procedure ej2(in numeroProveedor int)
begin

select reverse(proveedores.telefono)
from proveedores
where codproveedor=numeroProveedor;

end $$
delimiter ;

call ej2(1);


-- Ej 3

drop procedure if exists ej3;
delimiter $$

create procedure ej3(in codigoCategoria int)
begin

select productos.descripcion as Nombre,  month(pedidos.fecentrega) as MesEntrega

from pedidos join productos on pedidos.codproducto= productos.codproducto
join categorias on productos.codcategoria=categorias.codcategoria

where categorias.codcategoria=codigoCategoria;


end $$
delimiter ;

call ej3(1);


-- Ej 4

drop procedure if exists ej4;
delimiter $$

create procedure ej4()
begin

select *,left(categorias.Nomcategoria,3) from  productos join categorias on productos.codcategoria=categorias.codcategoria
order by categorias.codcategoria;


end $$
delimiter ;

call ej4();


-- Ej 5

drop procedure if exists ej5;
delimiter $$

create procedure ej5()
begin

select power(productos.preciounidad,2) as PrecioCuadrado,power(productos.preciounidad,3) as PrecioCubo from productos;


end $$
delimiter ;

call ej5();

-- Ej 6

drop procedure if exists ej6;
delimiter $$

create procedure ej6()
begin

select month(curdate()) as MesActual;


end $$
delimiter ;

call ej6();

-- Ej 7

drop procedure if exists ej7;
delimiter $$

create procedure ej7()
begin

select day(curdate())-day(pedidos.fecentrega) as diasQueSeEntregaron from pedidos
where month(pedidos.fecentrega)=month(curdate());


end $$
delimiter ;

call ej7();

select * from productos;
update productos
set descripcion ='Pastel'
where descripcion='Tarta';



