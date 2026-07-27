select count(ci) from evaluaciones;

select apellidos, nombres, valorpregunta
from docentes as d, evaluaciones as e
where d.ci=e.ci order by ValorPregunta;

select nombres, apellidos, valorpregunta, nombremat
from docentes as d, evaluaciones as e, materias as m
where d.ci='0000000001' and nombremat='Estadistica I';

select nombrecarrera, nombremat
from carreras as c, materias as m
where c.CodCarrera=m.codcarrera and NombreCarrera='primera carrera';

select e.ci, nombres, apellidos
from docentes as d, evaluaciones as e
where d.ci=e.ci order by evaluaciones ASC;

select nombres, apellidos, NombreMat
from docentes as d, rel_imparten as i, materias as m
where i.ci='0000000002' and d.ci=i.ci and m.cod=i.cod;
