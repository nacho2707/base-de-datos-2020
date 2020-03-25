-- Consulta#8
-- mostrar las materias que estan dictando los docentes
select nombreMateria,nombre
from infoCurso
inner join curso on curso.id = infoCurso.idCurso
inner join materia on materia.id = curso.idMateria
inner join docente on docente.id = infoCurso.idDocente
inner join persona on persona.ci = docente.ci;
-- Consulta #9
-- mostrar todos los temas de cada materia
select nombreMateria as Materia, titulo as Tema
from temas 
inner join materia on materia.id= temas.idMateria