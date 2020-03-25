-- 1. Obtener los nombres de los alumnos que ya cuentan con sus 3 notas parciales llenadas
select distinct matricula 
from notas
where notas.parcial3 is not null
