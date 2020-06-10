-- 1. Hay que crear un tipo, para el cursor
CREATE OR REPLACE PACKAGE TYPES AS
type ref_cursor is ref cursor;
END;

-- 2. Crear la funcion con un cursor como parametro
create or replace procedure testproc(p_cursor out types.ref_cursor) as
begin
    open p_cursor for
    select * from caracteristica;
end;


--TRUCASO PArA VER DATA COMO ESTILO TABLA
VARIABLE resultSet REFCURSOR;
EXEC testproc(:resultSet);
PRINT :resultSet;
--- IMPRIME EL CURSOrr OMggggg