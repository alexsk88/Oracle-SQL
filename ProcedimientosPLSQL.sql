-- Pedir cedula, y mostrar el cliente
set SERVEROUT ON;

--IN significa que el parametro es de entrada
CREATE OR REPLACE PROCEDURE GetClientebyCedula(
ced IN cliente.cedula%type,
nombre OUT cliente.nombre%type,
apellido OUT cliente.apellido%type) as 

-- NO VA EL DECLARE
--DECLARE

  cursor cur is
    SELECT cedula,nombre,apellido FROM cliente where cedula = ced;
    
    rCur cur%rowtype;

  BEGIN

        open cur;
        
         loop  fetch cur into rCur;exit when cur%notfound;        
            nombre:= rCur.nombre;
            apellido:= rCur.apellido;
         end loop;
              
        close cur;

  END;
  
  --COMO LLAMO el procedimiento ??
  -- pues simplemente el nombre
  
  
  
  DECLARE
    ced cliente.cedula%type;
    nom cliente.nombre%type;
    ape cliente.apellido%type;
  BEGIN
  ced:= 3;
    GetClientebyCedula(ced, nom, ape);
        dbms_output.put_line('CEDULA: '||ced);
        dbms_output.put_line('NOMBRE: '||nom);
        dbms_output.put_line('APELLIDO: '|| ape);
  END;
  
  
  
  
  
  
  