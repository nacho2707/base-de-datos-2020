 
Select  count(matricula), idcurso 
From estudiantecurso


group by idcurso
having count(matricula)>8
