select count(idcurso), matricula
from estudiantecurso
group by matricula
having count(idcurso)>4
-- ya que la condicion esq que estudiantes no pasen mas de 4 mterias, esta tabla siempre deberia estar vacia
