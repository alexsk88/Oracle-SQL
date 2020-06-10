
insert into cliente values( 7, 'Mariana', 'Salgado');

-- Tabla auditoria
create table auditoria(
tabla varchar(20),
cedula int,
usuario varchar(20),
descripcion varchar(20),
fecha date);


select * from auditoria;
select * from cliente;

-- >Trigger
-- Antes de insertar un cliente, que se registre en la tabla auditoria

create or replace trigger insertar_cliente 
before insert on cliente 
for each row 
begin
    --Voy a inserta un registro en la tabla auditoria
    
    -- El :new significa coja la cedula que se inserto
    -- user me dice quien hizo la insersion
    insert into auditoria (tabla,cedula,usuario,descripcion ,fecha) values
    ('cliente´', :new.cedula, user, 'Insersion de cliente', sysdate);
end;


-- Borrar cliente
create or replace trigger insertar_cliente 
before delete on cliente 
for each row 
begin
    --Voy a inserta un registro en la tabla auditoria
    
    -- El :old significa coja la cedula anterior que borroo
    -- user me dice quien hizo la insersion
    insert into auditoria (tabla,cedula,usuario,descripcion ,fecha) values
    ('cliente´', :old.cedula, user, 'Delete de cliente', sysdate);
end;


