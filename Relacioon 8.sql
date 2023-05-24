 -- Relacion 8
 
 select *
from empleados
where extelem rlike concat( '^.',
								(select substring(extelem, 2,1)
								from empleados
								where numem = 120));
 
 insert into clientes
 value(5,'','','','','','hola','','','','29001');
 
 
 update clientes
 set correoelectronico='JuanDiegoMarinMorales@gmail.com'
 where codcli=4;
 
select * from clientes where codpostalcli regexp '2900[0-9]';

select * from clientes where codpostalcli rlike '^290([12]0|[01][1-9])';

select * from clientes where correoelectronico rlike '@[a-z]*\\.(com|net|es|eu|it)$';

select * from clientes where correoelectronico not rlike '@[a-z]*\\.(com|net|es|eu|it)$';



