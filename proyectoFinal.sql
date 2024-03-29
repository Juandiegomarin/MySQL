
drop database proyectofinal;
create database proyectoFinal;
use proyectoFinal;

drop table if exists generacion;
create table if not exists generacion(
	
    idGeneracion int not null auto_increment,
	numeroGeneracion int,
    numeroPokemon int,
	nombreRegion varchar(20),
    
    constraint pk_generacion primary key (idGeneracion)


);



drop table if exists habilidad;
create table if not exists habilidad(
	
    idHabilidad int not null auto_increment,
    nombreHabilidad varchar(20),
    descripcion varchar (500),
     
    
    constraint pk_habilidad primary key (idHabilidad)
    
);

drop table if exists pokemon;
create table if not exists pokemon(

	idPokemon int not null auto_increment,
	numeroPokedex int,
    generacion int,
    nombre varchar(30),
    tipo1 varchar (15),
    tipo2 varchar(15) default 'none',
    habilidad int,
	
    constraint pk_numero primary key (idPokemon),
    constraint fk_generacion foreign key (generacion) references generacion(idGeneracion)
    on delete cascade,
    constraint fk_habilidad foreign key (habilidad) references habilidad(idHabilidad)
    on delete cascade

);




insert into generacion
 values
 (1,1,151,'Kanto'),
 (2,2,100,'Johto'),
 (3,3,135,'Hoenn');
 
 

 
 insert into habilidad
 values
 (1,'Mar LLamas','Aumenta los ataques de tipo fuego cuando el poseedor tiene menos de 1/3 de la vida'),
 (2,'Absorbe electricidad','Cuando el poseedor recibe un ataque de tipo electrico le aumenta el Sp.Atk por 1,5'),
 (3,'Poder Solar','Poder solar con sol o sol abrasador aumenta el ataque especial del Pokémon poseedor en un 50%, pero a cambio el Pokémon pierde 1/8 de sus PS máximos al final de cada turno.');
 
insert into pokemon
 values

 (1,6,1,'Charizard','Fuego','Volador',1),
 (2,25,1,'Pikachu','Electrico',default,2),
 (3,6,1,'Charizard','Fuego','Volador',3);

