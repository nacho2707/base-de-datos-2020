-- Mostrar a todas las personas cuyo correo electronico es .edu
select nombre, telefono,correoElectronico
from persona 
where correoElectronico like "%edu%"