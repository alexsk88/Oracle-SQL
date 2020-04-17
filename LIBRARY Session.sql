/* */
SET SERVEROUTPUT ON; /* Habilitar Consola*/
DECLARE
    /* Declarar variables*/
    mensaje VARCHAR(30) := 'Texto tipo string'; 
    nombre VARCHAR(30) := 'Manuel'; 
    -- edad INT(20);
BEGIN
    
    /*Capturar por Teclado*/
    
    -- edad := '&Digite Edad';
    
     --DBMS_OUTPUT.put_line ('Esto imprime por consola, Always comiilla simple');
     DBMS_OUTPUT.put_line (mensaje || ' JUAN ' || nombre); /* Concatenar*/
    -- DBMS_OUTPUT.put_line ('Tu edad es: ' || edad); /* Concatenar*/
END;

