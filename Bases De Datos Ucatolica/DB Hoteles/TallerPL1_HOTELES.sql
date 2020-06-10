set SERVEROUT ON;
-- Crear un cursor que muestre las actividades de un
-- determinado cargo que se conoce su nombre. 
declare
    cursor c_actividad is select * from actividad;
    cursor c_cargo is select * from cargo;
    
    vActi c_actividad%rowtype;   
    vCar c_cargo%rowtype;
    
    namecar varchar(90);
begin
  
    namecar := '&Digite_nombre_del_cargo';
    open c_cargo;
        loop
            fetch c_cargo into vCar;
            exit when c_cargo%notfound;
            
            if (vCar.nombre = namecar) then
                  open c_actividad;
                    loop
                        fetch c_actividad into vActi;
                        exit when c_actividad%notfound;
                            
                        if(vCar.codigo = vActi.cod_cargo) then
                                DBMS_OUTPUT.put_line(  vActi.nombre);     
                        end if;
                            
                        end loop;
                        close c_actividad;
                        
  
            end if; 
         
        end loop;
    close c_cargo;

end;
------------------------------------------------------------------------------

set SERVEROUT ON;
-- . Crear un cursor que muestre el cargo con más empleados. 



/*create view cargoyempleados as
select  cargo.codigo as code, cargo.nombre, COUNT(empleado.cargo) AS cant_empleados from cargo
INNER JOIN empleado ON cargo.codigo = empleado.cargo
GROUP BY cargo.nombre, cargo.codigo;*/

    
    
declare
    cursor c_maxcargoempleado is 
        select * from cargoyempleados
    where cant_empleados  =  (SELECT MAX(cant_empleados) FROM cargoyempleados);
    vCarmax c_maxcargoempleado%rowtype;

begin
  
    open c_maxcargoempleado;
        loop
            fetch c_maxcargoempleado into vCarmax;
            exit when c_maxcargoempleado%notfound;
        
                 DBMS_OUTPUT.PUT_LINE('NameCargo:  '||vCarmax.nombre || '   CantEmpleados:  ' ||  vCarmax.cant_empleados);
        end loop;
   
    close c_maxcargoempleado;

end;
----------------------------------------------------------------------------------------

set SERVEROUT ON;
-- . Crear un cursor que muestre las habitaciones que no están
--alquilada

--SELECT * FROM fecha_actual;

declare
    cursor c_habitacionnoalqui is 
    select * from habitacion_cliente where id_reserva in
    (select codigo from reserva where TO_CHAR(fecha_fin, 'YYYY-MM-DD') < '2020-05-08');
   
    vHabNo c_habitacionnoalqui%rowtype;

begin
  
    open c_habitacionnoalqui;
        loop
            fetch c_habitacionnoalqui into vHabNo;
            exit when c_habitacionnoalqui%notfound;
        
                 DBMS_OUTPUT.PUT_LINE('Numero Habitacion ' || vHabNo.num_habitacion );
        end loop;
   
    close c_habitacionnoalqui;

end;
--------------------------------------------------------------------------------------------------


set SERVEROUT ON;
-- .  Crear un cursor que muestre los clientes hospedados en el
-- mes de abril del 2020. 

--SELECT * FROM fecha_actual;

   


declare
    cursor c_abrilclientes is 
     select * from reserva where fecha_entrega >= TO_DATE('2020-04-01', 'YYYY-MM-DD') 
     AND fecha_entrega <  TO_DATE('2020-04-30', 'YYYY-MM-DD'); 
   
   cursor c_clientes is select * from cliente;
   
   
    vAbrilCli c_abrilclientes%rowtype;
    vCliente c_clientes%rowtype;

begin
        DBMS_OUTPUT.PUT_LINE('Clientes del mes de abril');
    open c_abrilclientes;
        loop
            fetch c_abrilclientes into vAbrilCli;
            exit when c_abrilclientes%notfound;
        
             ------------
             open c_clientes;
                loop
                    fetch c_clientes into vCliente;
                    exit when c_clientes%notfound;
                
                     if(vAbrilCli.cedula_cliente = vCliente.cedula ) then
                         DBMS_OUTPUT.PUT_LINE('Nombre: ' ||vCliente.nombre);
                         DBMS_OUTPUT.PUT_LINE('Apellido: ' ||vCliente.apellido);
                          DBMS_OUTPUT.PUT_LINE('___________________________');
                     end if;
                     
                end loop;
            close c_clientes;
             ------------
        end loop;
    close c_abrilclientes;

end;






