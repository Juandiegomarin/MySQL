
-- Relacion 5

-- Ejercicio 1
select descripcion from productos where left(descripcion ,1)='a';

-- Ejercicio 2

select reverse(telefono)from proveedores where codproveedor=1;

-- Ejercicio 3

select month(fecpedido) , codpedido
from pedidos 
join productos on pedidos.codproducto = productos.codproducto
join categorias on productos.codcategoria= categorias.codcategoria
 where categorias.codcategoria =4 and fecentrega is null;

-- Ejercicio 4

select left(categorias.Nomcategoria,3) , productos.descripcion, productos.codcategoria from productos
join categorias on productos.codcategoria = categorias.codcategoria
order by categorias.codcategoria;

-- Ejercicio 5

select preciounidad,pow(preciounidad,2),pow(preciounidad,3) from productos;

-- Ejercicio 6
select month(curdate()), monthname(curdate());

-- Ejercicio 7

select datediff(fecentrega, curdate()) from pedidos
where month(fecentrega)=month(curdate()) and year(fecentrega) = year(curdate());

-- Ejercicio 8

update productos
set descripcion='tarta'
where codproducto=(select codproducto from productos where descripcion ='Pan fino');

-- Ejercicico 9
select right(codpostal,3) from proveedores;

-- Ejercicio 10
select upper(Nomcategoria), count(codproducto) from categorias
join productos where categorias.codcategoria= productos.codcategoria
group by categorias.codcategoria;

-- Ejercicio 11
select descripcion , codcategoria from productos
order by codcategoria, length(descripcion);

-- Ejercicio 12


update productos
set descripcion= trim(descripcion);

-- Ejercicio 13
select concat(reverse(right(telefono,3)),right(nomempresa,2),reverse(left(telefono,4))), reverse(telefono) as tlfninvertido, telefono as tlf from proveedores;

select telefono, reverse(telefono),
	   substring(reverse(telefono), 4,2),
		right(nomempresa,2),
		replace(reverse(telefono),
				substring(reverse(telefono), 4,2),
				right(nomempresa,2))
from proveedores;

-- Ejercicio 14
select round(preciounidad,2)*0.1 from productos;

-- Ejercicio 15
select descripcion, convert(repeat(concat(codproducto, codcategoria),2), char(12)) as resultado,
	repeat(concat(codproducto, codcategoria),2) as SinFormato
from productos;
