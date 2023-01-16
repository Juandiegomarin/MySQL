create database if not exists Actividad2;

use Actividad2;

create table if not exists asignaturas
(
		numAsigna tinyint unsigned not null,
        nomAsigna varchar(20) not null,
        curso tinyint unsigned not null,
        
        constraint pk_asignaturas primary key (numAsigna)

);



create table if not exists deptos(


		numDepto tinyint unsigned not null,
        presupuesto decimal(8,2) unsigned not null,
        nomDepto varchar (60) not null,
        ubicacion varchar(60)not null,
        
        constraint pk_deptos primary key(numDepto)
        
);

create table if not exists profesores
(
		numProf int unsigned not null,
        despacho tinyint unsigned not null,
        fecNacim date not null,
		fecIngreso date not null,
        sueldo decimal (6,2) unsigned not null,
        nomProf varchar(20) not null,
        
        constraint pk_profesores primary key (numProf),
        constraint fk_profesores_depto foreign key(despacho)references deptos(numDepto)
        on update cascade
		
);

create table if not exists imparten(


		anioAcademico tinyint unsigned not null,
        grupo varchar(10) not null,
		codAsigna tinyint unsigned not null,
        codProf int unsigned not null,
        
        constraint fk_asigna foreign key(codAsigna)references asignaturas(numAsigna)
		on update cascade,
        
        constraint fk_prof foreign key(codProf)references profesores(numProf)
		on update cascade


);