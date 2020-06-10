-- Pedir cedula, y mostrar el cliente
set SERVEROUT ON;

DECLARE
  cursor cur(ced cliente.cedula%type) is
    SELECT cedula,nombre,apellido FROM cliente where cedula = ced;
  
      rCur cur%rowtype;
    ced cliente.cedula%type;
  BEGIN
  
      ced := &cedula;
        open cur(ced);
        
         loop  fetch cur into rCur;exit when cur%notfound;        
        dbms_output.put_line('CEDULA: '||rCur.cedula);
        dbms_output.put_line('NOMBRE: '||rCur.nombre);
        dbms_output.put_line('APELLIDO: '|| rCur.apellido);
            end loop;
              
        close cur;

  END;