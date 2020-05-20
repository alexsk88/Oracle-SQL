set SERVEROUT ON;

DECLARE
  cursor cur(cod alquiler.codigo%type) is
        select c.nombre,h.precio, a.num_habitacion, a.codigo, 
            round(a.fecha_entrega-a.fecha_fin) as diasretraso,
            abs(round(a.fecha_inicio-a.fecha_entrega)) as dias_hospedados , 
            abs(round(a.fecha_inicio-a.fecha_entrega)*h.precio) as precio_inicial , 
            a.fecha_inicio,a.fecha_fin, a.fecha_entrega
        from alquiler a
        inner join cliente c on c.cedula= a.cedula_cliente
        inner join habitacion h on a.num_habitacion = h.numero
        where a.codigo = cod;

      -- Varaibles
    rCur cur%rowtype;
    cod alquiler.codigo%type;
    valor_final float;
    penaliza float;
    adicion float;
    canhab int;
    maxhab int;
    bono int;
    
BEGIN  

    cod := &cod_alquiler;
    valor_final :=0;
    penaliza := 0;
    adicion := 0;
    
    -- Cantidad de habitaciones
    select count(*) into canhab from alquiler where codigo=cod;
    --dbms_output.put_line('Cantidad_Habitaciones: '||canhab);
    
    -- Habitacion de mayor valor
    select max(precio) into maxhab from habitacion inner join alquiler on (numero=num_habitacion)
    where codigo = cod;
    dbms_output.put_line('Habitacion de mayor precio: '||maxhab);
    
    
open cur(cod);

        loop  fetch cur into rCur;exit when cur%notfound;        
        dbms_output.put_line('CEDULA: '||rCur.cedula);
        dbms_output.put_line('NOMBRE: '||rCur.nombre);
        dbms_output.put_line('APELLIDO: '|| rCur.apellido);
            end loop;

    loop fetch cur into rCur;exit when cur%notfound;
    dbms_output.put_line('___________________');
    /*Si el cliente entrega antes de la fecha programada (fec_fin), se le cobra el 50%
    por noche de los días faltantes, si entrega después de la fecha programada, se
    le cobra un 25% adicional por noche.*/

      dbms_output.put_line('Precio_INICIAL: '||rCur.precio_inicial);
    if (rCur.diasretraso > 0) then
        --dbms_output.put_line('Entrego '|| rCur.diasretraso ||' dias despues');
         adicion := abs(rCur.diasretraso) * rCur.precio * 0.25;
         --dbms_output.put_line('ADICION: ' || adicion);
    elsif (rCur.diasretraso < 0) then
         dbms_output.put_line('Entrego '|| rCur.diasretraso ||' dias antes');
         --aqui es negativo el valor toca valor absoluto
         penaliza := abs(rCur.diasretraso) * rCur.precio * 0.5;
         --dbms_output.put_line('PENALIZA: ' || penaliza);
    else
        dbms_output.put_line('ENTREGASTE A TIME');
    end if;




    /*IF el cliente alquiló más de una habitación se le otorga un bono por el valor de
    2 noche de la habitación de mayor valor independiente de la cantidad de
    noches que se haya hospedado
    
    IF alquiló sólo una habitación entre 3 a 5 días
    se le otorga un bono por el valor de un día y si alquiló la habitación por más de
    5 días se le otorga un bono por el valor de 2 días.
        
        
        if (canhab > 1) then
            bono:= 2 * maxhab;
            dbms_output.put_line('Tienes un bono ' || bono ||' por alquilar ' || canhab || ' Habitaciones');
        elsif (canhab = 1) then
             dbms_output.put_line('Te hospedaste ' || rCur.dias_hospedados || ' dias');
             if( rCur.dias_hospedados>=3 and  rCur.dias_hospedados<=5) then
                  dbms_output.put_line('Te hospedaste entre 3 y 5 dias' );
                  bono:= maxhab;
                 dbms_output.put_line('Tienes un bono bono de ' || bono );
              elsif ( rCur.dias_hospedados>5) then
                  dbms_output.put_line('Te hospedaste mas de 5 dias' );
                  bono:= 2* maxhab;
                  dbms_output.put_line('Tienes un bono bono de ' || bono );
             end if;
        end if;
        */

     
    dbms_output.put_line('___________________');
    end loop;
close cur;
    
END;


select * from alquiler;







