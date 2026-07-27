create database JR_KG_NMProyecto;
use JR_KG_NMProyecto;

create table Carreras(
	CodCarrera tinyint auto_increment primary key,
    NombreCarrera varchar(150)
);

create table Materias(
	Cod smallint unsigned auto_increment primary key,
    NombreMat varchar(250),
	nivel varchar(40),
    CodCarrera tinyint,
    constraint FK_Materias_CodCarrera foreign key (CodCarrera) references Carreras(CodCarrera)
);

CREATE TABLE Docentes(
    CI varchar(15) PRIMARY KEY,
    Nombres varchar(100),
    Apellidos varchar(100),
    FechaNac date,
    LugarNac varchar(100),
    EstCivil varchar(10),
    Direccion varchar(250),
    FechaIngreso date,
    Puntaje varchar(20)
);

create table preguntas(
	CodPregunta varchar(20) primary key,
    pregunta varchar(60)
);

create table rel_imparten(
	Cod smallint unsigned,
    CI varchar(15),
    Periodo year,
	Jornada varchar(15),
    Paralelo varchar(10),
    CantidadAlum tinyint,
    RegistroMat varchar(150),
    constraint PK_rel_imparten primary key (Cod, Ci),
    constraint FK_rel_imparten_Cod foreign key (Cod) references Materias(Cod),
    constraint FK_rel_imparten_CI foreign key (CI) references Docentes(CI)
);

create table Tele_Doc(
	CI varchar(15),
    Telefonos tinyint,
    constraint PK_Tlfns_DCNTS primary key (CI, Telefonos),
    constraint FK_Tlfns_DCNTS_CI foreign key (CI) references Docentes(CI)
);

create table Titu_Doc(
	CI varchar(15),
    Titulos varchar(100),
    constraint PK_Ttls_DCNTS primary key (CI, Titulos),
    constraint FK_Ttls_DCNTS_CI foreign key (CI) references Docentes(CI)
);

create table evaluaciones(
	Cod smallint unsigned,
    CI varchar(15),
    ValorPregunta varchar(15),
    constraint PK_Ttls_DCNTS primary key (Cod, CI),
	constraint FK_Ttls_DCNTS_CI_Cod foreign key (Cod, CI) references rel_imparten(Cod, CI)
);

create table Rel_tiene(
	Cod smallint unsigned,
    CI varchar(15),
    CodPregunta varchar(20),
	constraint PK_rel_tiene primary key (Cod, CI, CodPregunta),
	constraint FK_rel_tiene_Cod_CI foreign key (Cod, CI) references evaluaciones(Cod, CI),
    constraint FK_rel_tiene_CodPregunta foreign key (Codpregunta) references Preguntas(CodPregunta)
);
