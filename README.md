# Sistema de Evaluación Docente y Gestión Académica

📅 Julio 2023

## Descripción
Diseño e implementación de una base de datos en MySQL para gestionar la evaluación docente y datos académicos, aplicando modelado MER/MR y normalización hasta 3FN.

## Tecnologías
- MySQL

## Contenido de este repositorio
- `JRodriguez_ProyectoBD.sql` — creación de la base de datos y tablas (Carreras, Materias, Docentes, Preguntas, etc.)
- `Datos_Importados.sql` — carga inicial de datos desde tablas de origen
- `Pruebas_Proyecto.sql` — consultas SQL de ejemplo (JOINs, filtros, ordenamientos)
- `MER, MR y Diccionario de datos.pdf` — modelo entidad-relación, modelo relacional y diccionario de datos del proyecto
- `Normalización 3ra forma.pdf` — proceso de normalización aplicado hasta la Tercera Forma Normal (3FN)

## Modelo de datos
El modelo de datos fue diseñado para almacenar y gestionar la información relacionada con la evaluación anual de los docentes de una institución educativa. Las entidades principales representan los elementos fundamentales del proceso de evaluación y se encuentran relacionadas entre sí para garantizar la integridad y consistencia de la información.

### Carreras:
Representa las diferentes carreras académicas que ofrece la institución. Cada carrera se identifica mediante un código único y puede tener asociadas varias materias. La relación entre Carreras y Materias es de uno a muchos (1:N).

### Materias:
Almacena la información de las asignaturas pertenecientes a una carrera, incluyendo su nombre, nivel y jornada en la que se imparten. Aunque dos carreras puedan tener materias con el mismo nombre, cada una se considera una materia diferente debido a su identificación propia. Una materia pertenece a una sola carrera, pero puede ser impartida por varios docentes en distintos periodos.

### Docentes:
Contiene los datos personales y laborales de los profesores, como cédula, nombres, apellidos, fecha de nacimiento, dirección, teléfonos, títulos académicos y fecha de ingreso. Un docente puede impartir varias materias y recibir múltiples evaluaciones a lo largo del tiempo.

### Evaluaciones:
Registra cada proceso de evaluación realizado a un docente por una materia específica, considerando además el período y el paralelo correspondiente. Cada evaluación almacena el resultado obtenido y permite mantener un historial anual de las evaluaciones realizadas. Una evaluación pertenece a un docente y a una materia, y está compuesta por varias respuestas a preguntas de evaluación.

### Preguntas:
Representa el conjunto de preguntas utilizadas en el formulario de evaluación docente. Cada pregunta posee un código identificador y un valor asociado. Una misma pregunta puede formar parte de muchas evaluaciones, mientras que cada evaluación contiene todas las preguntas del cuestionario, estableciendo una relación de muchos a muchos (N:M).

### Relaciones principales
- **Carrera – Materia:** una carrera puede tener muchas materias, mientras que cada materia pertenece a una única carrera (1:N).
- **Docente – Materia:** un docente puede impartir varias materias y una materia puede ser impartida por varios docentes en distintos períodos, por lo que la relación es de muchos a muchos (M:N), implementada mediante una tabla intermedia.
- **Docente/Materia – Evaluación:** por cada combinación de docente y materia se registran las evaluaciones correspondientes a cada período y paralelo.
- **Evaluación – Pregunta:** una evaluación está conformada por varias preguntas, y cada pregunta puede utilizarse en múltiples evaluaciones, formando una relación de muchos a muchos (N:M) mediante una tabla que almacena la puntuación obtenida en cada pregunta.

## Nota
Los datos de ejemplo (cédulas, nombres) han sido anonimizados por privacidad.
