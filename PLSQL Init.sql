/* */
SET SERVEROUTPUT ON; /* Habilitar Consola*/
DECLARE
    /* Declarar variables*/
    --mensaje VARCHAR(30) := 'Texto tipo string'; 
    nombre VARCHAR(30) := 'Manuel'; 
    edad INT;
BEGIN
    
    /*Capturar por Teclado String (OJO COMILLAS EN STRING)*/
    nombre := '&Nombre';
    /* Caputar Int*/
      edad := &Edad;
    
     --DBMS_OUTPUT.put_line ('Esto imprime por consola, Always comiilla simple');
     --DBMS_OUTPUT.put_line (mensaje || ' JUAN ' || nombre); /* Concatenar*/
    DBMS_OUTPUT.put_line ('Tu edad es: ' || edad); /* Concatenar*/
END;


/*LERR DOS NUMERO E IMPRIMIR SUMA*/

DECLARE
    num1 INT;
    num2 INT;
    res int;
BEGIN
    
      num1 := &NUmero_1;
      num2 := &NUmero_2;
    res:= num1+num2;
    DBMS_OUTPUT.put_line ( num1 ||'+'||num2||'= '|| res);
END;

/*LERR DOS NUMERO E IMPRIMIREL MAYOR*/

DECLARE
    num1 INT;
    num2 INT;
    MAYOR int;
BEGIN
    
    num1 := &NUmero_1;
    num2 := &NUmero_2;
    
    IF num1>num2 THEN
        MAYOR:= num1;
        ELSE
        MAYOR:= num2;
    END IF;

    DBMS_OUTPUT.put_line ( 'El mayo es: ' || mayor);
END;


/*MOSTRAR LOS PRIMERO 5 NUMERO NATURALES*/
DECLARE -- Declaraci�n y asignaci�n de variables
  counter NUMBER(6) := 0;
BEGIN
  LOOP
    counter := counter + 1; -- Incrementamos la variable contador
     DBMS_OUTPUT.PUT_LINE(counter || ' ');
    -- Salimos del bucle cuando la condici�n de cumpla
    EXIT WHEN counter>4;
  END LOOP;

END;
