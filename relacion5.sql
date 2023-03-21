use bdalmacen;


-- Ej1
drop procedure if exists productosPorLetra;
delimiter $$
create procedure productosPorLetra(in letra char(1))
begin

select * from productos where productos.descripcion like concat(letra, '%');

 end $$
delimiter ;

call productosPorLetra('A');

-- Ej 2

drop procedure if exists obtenerContrasenia;

delimiter $$
create procedure obtenerContrasenia(in proveedor varchar (50))
begin

select reverse(proveedores.telefono) from proveedores where nomcontacto=proveedor;

 end $$
delimiter ;
select * from proveedores;
call obtenerContrasenia('Mateo Cantos');

-- Ej 3

drop procedure if exists obtenerMes;

delimiter $$
create procedure obtenerMes()
begin

select month(pedidos.fecpedido)from pedidos where fecentrega> curdate();

 end $$
delimiter ;
call obtenerMes();