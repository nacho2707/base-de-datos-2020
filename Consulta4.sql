-- 4.Mostrar el CI de los docentes que pasan clases en horario B 
select distinct ci 
from docente
inner join infocurso 
on infocurso.idDocente=docente.id
where infocurso.idHorario = 'B'