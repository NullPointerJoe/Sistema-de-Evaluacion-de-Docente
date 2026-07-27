insert into carreras(NombreCarrera)
select distinct carrera
from datospro2023.temp_evaluaciones;

insert into materias(NombreMat, codcarrera)
select distinct asignatura, CodCarrera
from jr_kg_nm.carreras, datospro2023.temp_evaluaciones
where temp_evaluaciones.carrera like '% carrera' and nombreCarrera=Carrera;

insert into docentes(CI, Nombres, Apellidos)
select ci, SUBSTRING_INDEX(nombres_docentes, ' ', -2), SUBSTRING_INDEX(nombres_docentes, ' ', 2)
from datospro2023.temp_docente;

insert into Preguntas(CodPregunta, pregunta)
select distinct Cod_pre, nombre_pregunta
from datospro2023.temp_evaluaciones;

insert ignore into rel_imparten(Cod, CI, Jornada, Paralelo)
select distinct Cod, ceduladocente, temp_evaluaciones.jornada, temp_evaluaciones.paralelo
from jr_kg_nm.materias, datospro2023.temp_evaluaciones
where NombreMat=asignatura;

insert ignore into evaluaciones(Cod, CI, valorpregunta)
select Cod, ci, respuesta from jr_kg_nm.materias, jr_kg_nm.docentes, datospro2023.temp_evaluaciones
where carrera like '% carrera' and ci=ceduladocente and NombreMat=asignatura;

insert ignore into rel_tiene(cod, ci, codpregunta)
select Cod, ci, CodPregunta from jr_kg_nm.evaluaciones, jr_kg_nm.preguntas, datospro2023.temp_evaluaciones
where codpregunta=cod_pre;
