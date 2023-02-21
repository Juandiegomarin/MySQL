-- Tema 5 
-- insert update dealete

use BDMUSEO;

delete from estilos where codestilo=1;
delete from estilos where codestilo=2;

insert into estilos values(1,'A','B'),(2,'B','C');

select * from estilos;

