
-- Mostrar a los estudiante que comentaron , cuya	 matrícula es mayor a 4000
 Select nombre as NombreEstudiante, matricula as Matrícula, contenido as Comentario
 from  comentario
 inner Join  persona on persona.ci = comentario.ci
 inner Join estudiante on estudiante.ci = persona.ci
 where matricula > 4000 and numeroTarjeta is not null;