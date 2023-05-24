
-- Ejercicio 1

select avg(salarem), comisem, count(*) from empleados
group by empleados.comisem
having count(*)>1;

-- Ejercicio 2


select extelem , count(*) from empleados
group by extelem
having count(*) between 1 and 3;

-- Ejercicio 3

select nomcat from categorias
join articulos on categorias.codcat=articulos.codcat
join catalogospromos on articulos.refart=catalogospromos.refart
where catalogospromos.codpromo=1
group by categorias.nomcat
having count(catalogospromos.refart)>1;

-- Ejercicio 4

select nomcat from categorias
join articulos on categorias.codcat=articulos.codcat
group by categorias.nomcat
having avg(articulos.precioventa)>(select precioventa from articulos where refart='C1_01');