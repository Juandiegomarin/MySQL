-- drop database if exists BDCLASE; -- eliminar una base de datos si existe ya
create database if not exists BDCLASE ; -- creacion base de datos
use BDCLASE;
-- Creacion de tablas

create table if not exists deptos
(
		codDepto int unsigned not null,
        nomDepto varchar(20),                      
        
		constraint pk_deptos primary key(codDepto)

);
-- Creacion de tablas
create table if not exists profesorado
(
		codDepto int unsigned not null,
		codProf int unsigned not null,
		nomProf varchar(15) not null,
        ape1Prof varchar(15) not null,
        ape2Prof varchar(15) not null,
        fecIncorporacio date Null,
		codPostal char(5),
        telefono char(9),
        constraint pk_profesorado primary key(codDepto,codProf),
        
        constraint fk_profesorado_depto foreign key(codDepto)
        references deptos(codDepto) on delete no action on update cascade
);

create table if not exists asignaturas
(
		codAsigna int unsigned not null,
        nomAsigna varchar(30) not null,
        curso tinyint not null,
        
        constraint pk_asignaturas primary key(codAsigna)

);

create table if not exists impartir
(
		codAsigna int unsigned not null,
        codDepto int unsigned not null,
        codProf int unsigned not null,
        observa varchar(50) not null,
        
        constraint fk_impartir foreign key (codAsigna) references asignaturas (codAsigna)
        on delete no action on update cascade,
        
        constraint fk_deptos_profesorado foreign key (codDepto , codProf) references profesorado (codDepto,codProf)
        on delete no action on update cascade
);

