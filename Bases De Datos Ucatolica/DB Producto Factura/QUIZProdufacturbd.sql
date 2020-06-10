set SERVEROUT ON;

-- VER AnexoQUIZFACTURAPRODUCTO.pdf
DECLARE

cursor cur (numefac factura.numero%type)is
    select * from detalle_fac where num_factura = numefac;
    
        rCur cur%rowtype;
        nombre producto.nombre%type;
        total_valor float := 0;
        descuento float;
        val_uni float;
        total_descuento float :=0;
        numfacactual factura.numero%type := null;
        
        numefac factura.numero%type;
        total_iva float:=0;
        
            tiva float;
            todesiva float;
            
            cedulacli cliente.cedula%type;
            namecli cliente.nombre%type;
            fecha factura.fecha%type;
BEGIN
    
      numefac := &numerofactura;
      --numefac := 2;
        open cur(numefac);
            loop fetch cur into rCur;exit when cur%notfound;
            dbms_output.put_line('____________________________');
                --Si para un producto específico, la cantidad comprada es menor a 3, se realiza
                --un descuento del 25% en caso contrario un descuento del 50%.
                
                
                select nombre  into nombre  from producto where codigo =rCur.cod_producto;
                dbms_output.put_line('Name Producto: ' || nombre);
                
                select val_unitario into val_uni from producto where codigo =rCur.cod_producto;
                dbms_output.put_line('Valor Unitario : ' || val_uni);
                dbms_output.put_line('Valor Total: ' || val_uni * rCur.cantidad);
                total_valor := total_valor +  val_uni * rCur.cantidad;
        
                total_iva := total_iva + ((val_uni * (rCur.porcentaje_iva /100))*rCur.cantidad);
                dbms_output.put_line('Iva_Unitario: ' || val_uni * (rCur.porcentaje_iva /100));
                dbms_output.put_line('Iva_totalproducto: ' || (val_uni * (rCur.porcentaje_iva /100))*rCur.cantidad);
                dbms_output.put_line('Cantidad: ' || rCur.cantidad);
                if(rCur.cantidad < 3) then
                    --dbms_output.put_line('Menos de 3');
                    descuento :=  val_uni * 0.25;
                    dbms_output.put_line('Tiene un descuento del 25%: ' || descuento);

                 else
                    --dbms_output.put_line('Mas de 3');
                    descuento := val_uni * 0.5;
                    dbms_output.put_line('Tiene un descuento del 50%: ' || descuento);
                end if;
                total_descuento := total_descuento + descuento;
                
              
                --Busque todas las facturas con id X y ponga descuento
                 
               dbms_output.put_line('____________________________');
            end loop;
            dbms_output.put_line('===========================');
            dbms_output.put_line('Factura No. ' || rCur.num_factura );
            
             select fecha into fecha from factura where numero = rCur.num_factura; 
              dbms_output.put_line('Fecha. ' ||fecha );
              select ced_cliente into cedulacli from factura where numero = rCur.num_factura; 
            dbms_output.put_line('CEDULA. ' || cedulacli );
            select nombre into namecli from cliente where cedula = cedulacli;
                dbms_output.put_line('NOMBRE. ' || namecli );
            dbms_output.put_line('Total descuento ' || total_descuento);
            dbms_output.put_line('Total Valor sin iva ' || total_valor);
             dbms_output.put_line('IVA TOTAL ' || total_iva);
             tiva :=total_valor+ total_iva;
             dbms_output.put_line('VALOR TOTAL CON IVA ' || tiva);
             todesiva:= tiva -total_descuento;
             dbms_output.put_line('VALOR TOTAL CON IVA CON DESCUENTO ' || todesiva);
             dbms_output.put_line('===========================');
        close cur;
END;