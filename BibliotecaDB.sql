CREATE TABLE alumno (
    codigo int NOT NULL,
    nombre varchar(255) NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE libro (
    codigo int NOT NULL,
    nombre varchar(255) NOT NULL,
    PRIMARY KEY (codigo)
);

CREATE TABLE prestamo (
    cod_libro int NOT NULL,
    cod_alumno int NOT NULL,
    fehca_inicial date,
    dias_prestamo int,
    fehca_entrega date,
    PRIMARY KEY (cod_libro,cod_alumno,fehca_inicial),
    FOREIGN KEY (cod_alumno) REFERENCES alumno(codigo),
    FOREIGN KEY (cod_libro) REFERENCES libro(codigo)
);

-- INSERT ALUMNO
INSERT INTO alumno VALUES (1, 'Juan');
INSERT INTO alumno VALUES (2, 'Sasha');
INSERT INTO alumno VALUES (3, 'Kiara');
INSERT INTO alumno VALUES (4, 'Alex');
INSERT INTO alumno VALUES (5, 'Andrea');
INSERT INTO alumno VALUES (6, 'Mafe');
INSERT INTO alumno VALUES (7, 'Marlos');
INSERT INTO alumno VALUES (8, 'Patricia');
INSERT INTO alumno VALUES (9, 'Maria');
INSERT INTO alumno VALUES (10, 'Alejandro');
-- INSERT LIBRO
INSERT INTO libro VALUES (1, 'Fisica');
INSERT INTO libro VALUES (2, 'Calculo');
INSERT INTO libro VALUES (3, 'Hombre mas Rico');
INSERT INTO libro VALUES (4, 'A la luna voy');
INSERT INTO libro VALUES (5, 'Cronicas Narnia');
INSERT INTO libro VALUES (6, 'El monje que vendio su ferrari');
INSERT INTO libro VALUES (7, 'Principito');
INSERT INTO libro VALUES (8, 'Piense y Hagase Rico');

-- INSERT PRESTAMOS
INSERT INTO prestamo VALUES (
1,
1, 
TO_DATE('2020-04-11 23:27:54', 'YYYY-MM-DD HH24:MI:SS'),
5,
NULL);

INSERT INTO prestamo VALUES (
2,
2, 
TO_DATE('2020-04-02 23:27:54', 'YYYY-MM-DD HH24:MI:SS'),
5,
NULL);

INSERT INTO prestamo VALUES (
3,
3, 
TO_DATE('2020-04-07 23:27:54', 'YYYY-MM-DD HH24:MI:SS'),
1,
NULL);

INSERT INTO prestamo VALUES (
4,
4, 
TO_DATE('2020-04-08 23:27:54', 'YYYY-MM-DD HH24:MI:SS'),
6,
NULL);

INSERT INTO prestamo VALUES (
5,
5, 
TO_DATE('2020-03-08 23:27:54', 'YYYY-MM-DD HH24:MI:SS'),
6,
TO_DATE('2020-03-14 23:27:54', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO prestamo VALUES (
6,
6, 
TO_DATE('2020-03-01 23:27:54', 'YYYY-MM-DD HH24:MI:SS'),
3,
TO_DATE('2020-03-04 23:27:54', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO prestamo VALUES (
1,
6, 
TO_DATE('2020-04-01 23:27:54', 'YYYY-MM-DD HH24:MI:SS'),
3,
TO_DATE('2020-04-04 23:27:54', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO prestamo VALUES (
2,
1, 
TO_DATE('2020-02-01 23:27:54', 'YYYY-MM-DD HH24:MI:SS'),
3,
TO_DATE('2020-02-04 23:27:54', 'YYYY-MM-DD HH24:MI:SS'));


INSERT INTO prestamo VALUES (
6,
3, 
TO_DATE('2020-01-01 23:27:54', 'YYYY-MM-DD HH24:MI:SS'),
3,
TO_DATE('2020-01-04 23:27:54', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO prestamo VALUES (
3,
1, 
TO_DATE('2019-01-01 23:27:54', 'YYYY-MM-DD HH24:MI:SS'),
5,
TO_DATE('2019-01-06 23:27:54', 'YYYY-MM-DD HH24:MI:SS'));

INSERT INTO prestamo VALUES (
7,
7, 
TO_DATE('2019-01-01 23:27:54', 'YYYY-MM-DD HH24:MI:SS'),
5,
NULL);

INSERT INTO prestamo VALUES (
1,
8, 
TO_DATE('2020-01-01 23:27:54', 'YYYY-MM-DD HH24:MI:SS'),
5,
NULL);
INSERT INTO prestamo VALUES (
1,
8, 
TO_DATE('2018-01-01 23:27:54', 'YYYY-MM-DD HH24:MI:SS'),
10,
TO_DATE('2018-11-01 23:27:54', 'YYYY-MM-DD HH24:MI:SS');


-------------------------------------------------------------
--TALLER 

/*3. Nombre del alumno, el nombre del libro y la fecha inicial para los préstamos
activos (no se han entregado), de tal forma que sea ordenado por fecha.*/
SELECT alumno.nombre as NameStudent, libro.nombre as NameBook, fehca_inicial, dias_prestamo, fehca_entrega 
FROM prestamo 
    INNER JOIN alumno ON alumno.codigo = prestamo.cod_alumno
    INNER JOIN libro ON libro.codigo = prestamo.cod_alumno
WHERE fehca_entrega is NULL
ORDER BY prestamo.fehca_inicial;

-- 4. Cantidad de libros prestados que no han sido entregados.
SELECT COUNT(*) FROM
(SELECT alumno.nombre as NameStudent, libro.nombre as NameBook, fehca_inicial, dias_prestamo, fehca_entrega 
FROM prestamo 
    INNER JOIN alumno ON alumno.codigo = prestamo.cod_alumno
    INNER JOIN libro ON libro.codigo = prestamo.cod_alumno
WHERE fehca_entrega is NULL
ORDER BY prestamo.fehca_inicial);


-- 5. Alumnos que no han prestado libros.
SELECT  alumno.* FROM alumno WHERE codigo NOT IN 
(SELECT prestamo.cod_alumno FROM prestamo);

-- 6. Nombre de los alumnos que tienen prestamos atrasados.

/* Alumnos sin nombre que tiene presamos retardados
SELECT cod_alumno, fehca_inicial,(prestamo.fehca_inicial + dias_prestamo) as FechaLimite FROM prestamo,fecha_actual
WHERE (prestamo.fehca_inicial + dias_prestamo) < fecha_actual.fecha; 
*/
CREATE VIEW fecha_actual as select current_date as fecha from dual;

select nombre from alumno where codigo IN 
(
SELECT cod_alumno
FROM prestamo,fecha_actual
WHERE (prestamo.fehca_inicial + dias_prestamo) < fecha_actual.fecha
);

-- 7. Nombre de los libros que más han sido prestados.

    -- LIBROS Y CANTIDAD DE PRESTAMOS
        create view CLibrosPrestamo as
        select prestamo.cod_libro ,count(*) as Cantidad_Prestamos 
        from prestamo
            inner join libro ON libro.codigo =prestamo.cod_libro
        GROUP by prestamo.cod_libro;

        -- Ahora el  Nombre
        SELECT libro.* , CLibrosPrestamo.Cantidad_Prestamos 
        FROM libro
        inner join CLibrosPrestamo ON CLibrosPrestamo.cod_libro = libro.codigo;

    

-- 8. Nombre del libro con menos préstamos.
    create view valorminimo_prestamos as
    SELECT min(Cantidad_Prestamos) as ValorMinimo FROM clibrosprestamo;

    -- libro o libros con menos préstamos.
    SELECT * 
    FROM CLibrosPrestamo,valorminimo_prestamos 
    where Cantidad_Prestamos = valorminimo_prestamos.VALORMINIMO;

    -- Ahora el NOMBRE sin vista :D:D

    select * from LIBRO where CODIGO IN
    (
        SELECT  COD_LIBRO
        FROM CLibrosPrestamo,valorminimo_prestamos 
        where Cantidad_Prestamos = valorminimo_prestamos.VALORMINIMO
    );