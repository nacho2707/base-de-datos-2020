select count(idcurso), matricula
from estudiantecurso
group by matricula
