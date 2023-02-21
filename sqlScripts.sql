/*
ciudadanos[(codCiudadano), datosCiudadano]
deptos[(codDepto), datosDepto]
profesores[(codProf,codDepto*),codCiudadano*]
grupos[(codGrupo)datosGrupo]
alumnos[(codAlumno),codCiudadano*]
asignatura[(codAsign),datosAsign]
imparten[(codGrupo*,(codProf,codDepto)*,codAsign*,fechIni)]



*/

create database if not exists repaso;

use repaso;

create table if not exists ciudadanos(

		codCiudadano int,
        nomCiudadano varchar(20),
        
        constraint pk_ciudadanos primary key(codCiudadano)

);

create table if not exists deptos(

		codDepto int,
        nomDepto varchar(20),
        
        constraint pk_deptos primary key(codDepto)

);

create table if not exists profesorado(

		codProf int,
        codDepto int,
        codCiudadano int,
        
        constraint fk_profesorado_deptos foreign key(codDepto)references deptos(codDepto)
        on delete no action on update cascade,
        
        constraint pk_profesorado primary key(codProf,codDepto),
        
        constraint fk_profesorado_ciudadanos foreign key(codCiudadano)references ciudadanos(codCiudadano)
         on delete no action on update cascade

);

create table if not exists grupo(

	codGrupo int,
    nomGrupo varchar(20),


	constraint pk_grupo primary key(codGrupo)


);

create table if not exists alumnado(


	codAlum int,
    codCiudadano int,
    numExp int,
    codGrupo int,
    
    constraint pk_alumnado primary key (codAlum),
    
    constraint fk_alumnado_ciudadanos foreign key (codCiudadano)references ciudadanos(codCiudadano)
    on delete no action on update cascade,
    
    constraint fk_alumnado_grupos foreign key (codGrupo)references grupo(codGrupo)
    on delete no action on update cascade
    

);

create table if not exists asignatura(

	codAsig int,
    nomAsig varchar(20),
    
    constraint pk_asig primary key(codAsig)


);

create table if not exists imparten(

	codProf int,
    codDepto int,
    codAsig int,
    codGrupo int,
    
    constraint pk_imparten primary key(codProf,codDepto,codAsig,codGrupo),
    
    constraint fk_imparten_profesor foreign key(codProf,codDepto)references profesorado(codProf,codDepto)
    on delete no action on update cascade,
    
    constraint fk_imparten_grupo foreign key(codGrupo)references grupo(codGrupo)
    on delete no action on update cascade,
    
    constraint fk_imparten_asig foreign key(codAsig)references asignatura(codAsig)
    on delete no action on update cascade


);