Select  count(idCurso), idDocente
From infocurso


group by idDocente
having count(idCurso)<4

