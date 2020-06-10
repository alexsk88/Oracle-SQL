/* Dos numero e imprimir si uno es multiplo del otro*/
/* Tres numero y imprimir de mayor a menor*/
/* Leer el radio de circuferencia e imprimir AREA y PERIMETRO*/
/* Imprimier lo primero N numero de la serie de Fibonacci*/
/* Factorial de un numero N*/
/* Llenar un Vector  con N numeros ramdom( range 1 -  10 )  -> LA SUMA DEL VECTOR   */
/*Llenar un Vector  con N numeros ramdom( range 1 -  100)  
-> Imprimir vector de forma ordenada */


-- 1
DECLARE
    num1 INT;
    num2 INT;
BEGIN
    
    num1 := &NUmero_1;
    num2 := &NUmero_2;
    
    IF num1%num2 == 0 THEN
         DBMS_OUTPUT.put_line (num1 || ' es multilplo de ' || num2);

    ELSIF num1%num2 == 0 THEN
        
        DBMS_OUTPUT.put_line (num2|| ' es multilplo de ' || num1);
    END IF;

    DBMS_OUTPUT.put_line ( 'El mayo es: ' || mayor);
END;