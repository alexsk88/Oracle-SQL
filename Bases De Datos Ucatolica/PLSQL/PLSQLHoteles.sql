set SERVEROUT ON;

-- Seleccionar y nombre y el codigo de la tabla cargo
-- cursores explicitos
declare
    cursor cCargos is select codigo, nombre from cargo;
    vNombre varchar (30);
    vCodigo int;
begin
    open cCargos;
    loop
        fetch cCargos into vCodigo, vNombre;
        exit when cCargos%notfound;
    DBMS_OUTPUT.put_line (  vCodigo || ' ' || vNombre);
    end loop;
    close cCargos;
end;
---------------------------------------------------------------

set SERVEROUT ON;

-- Seleccionar y nombre y el codigo de la tabla cargo
-- sin saber si es varchar o int *******************
-- cursores explicitos
declare
    cursor cCargos is select codigo, nombre from cargo;
    --OJO AQUI
    vNombre cargo.nombre%type;
    vCodigo cargo.codigo%type;
    --OJO AQUI
begin
    open cCargos;
    loop
    -- Aqui codigo, nombre lleva ese orden
    -- Si fuera primero nombre y despues codigo
    -- Me sale error
        fetch cCargos into vCodigo, vNombre;
        exit when cCargos%notfound;
    DBMS_OUTPUT.put_line (  vCodigo || ' ' || vNombre);
    end loop;
    close cCargos;
end;

---------------------------------------------------------------
set SERVEROUT ON;
-- Seleccionar todos los campos de cargo 
declare
    cursor cCargos is select codigo, nombre from cargo;
    --OJO AQUI
    -- Guarda todo el cursor en vReg
    vReg cCargos%rowtype;
    --OJO AQUI
begin
    open cCargos;
    loop
        fetch cCargos into vReg;
        exit when cCargos%notfound;
        DBMS_OUTPUT.put_line (  vReg.codigo  || ' ' || vReg.nombre);
    end loop;
    close cCargos;
end;

-----------------------------------------------------------------

set SERVEROUT ON;
-- Selecciona numeroy precio de habitacion hacer descuento 5
-- si es menor que 100 000 y 10% si es menor o igual 200 000
declare
    cursor c_habitacion is 
    select numero, precio from habitacion;
    --Aui guargo el nuevo precio
    vNuevoPrecion habitacion.precio%type;
    -- Guarda todo el cursor en vReg
    vReg c_habitacion%rowtype;
    --OJO AQUI
begin
    open c_habitacion;
    loop
        fetch c_habitacion into vReg;
        exit when c_habitacion%notfound;
        
        if vReg.precio <= 100000 then
        
            vNuevoPrecion := vReg.precio - (vReg.precio * 0.05);
        else
            if vReg.precio <= 200000 then
                vNuevoPrecion := vReg.precio - (vReg.precio * 0.1);
            end if;
        end if;
        
        DBMS_OUTPUT.put_line (   '________________________');
        DBMS_OUTPUT.put_line (  'PRECIO: ' ||vReg.precio );
        DBMS_OUTPUT.put_line (   'NUM_HABITACION: ' || vReg.numero );
        DBMS_OUTPUT.put_line (   'NEW_PRECIO:  ' || vNuevoPrecion);
        DBMS_OUTPUT.put_line (   '________________________');
    end loop;
    close c_habitacion;
end;

-------------------------------------------------------------------------------------------------
