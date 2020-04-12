USE hoteles;


CREATE TABLE cargo (
    codigo int NOT NULL,
    nombre varchar(255) NOT NULL,
    PRIMARY KEY (CODIGO)
);

CREATE TABLE empleado (
    cedula int NOT NULL,
    nombre varchar(255) NOT NULL,
    cargo int,
    PRIMARY KEY (cedula)
);

CREATE TABLE cliente (
    cedula int NOT NULL,
    nombre varchar(255) NOT NULL,
    apellido varchar(255) NOT NULL,
    PRIMARY KEY (cedula)
);

CREATE TABLE habitacion (
    numero int NOT NULL,
    precio int NOT NULL,
    PRIMARY KEY (numero)
);

CREATE TABLE caracteristica(
	codigo int,
    description varchar(250),
    PRIMARY KEY (codigo)
);

CREATE TABLE habitacion_caracteristica(
	num_habitacion int,
    codigo_caracterisca int,
    PRIMARY KEY (num_habitacion,codigo_caracterisca)
);

CREATE TABLE empleado_habitacion (
    cedula_empleado int NOT NULL,
    numero_habitacion int NOT NULL,
    PRIMARY KEY (cedula_empleado,numero_habitacion),
    FOREIGN KEY (cedula_empleado) REFERENCES empleado(cedula),
	FOREIGN KEY (numero_habitacion) REFERENCES habitacion(numero)
);
CREATE TABLE actividad (
    codigo int,
    nombre varchar(255) NOT NULL,
    cod_cargo int,
    PRIMARY KEY (codigo),
	FOREIGN KEY (cod_cargo) REFERENCES cargo(codigo)
);

CREATE TABLE reserva (
    codigo int,
    cedula_cliente int NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    fecha_entrega date,
    PRIMARY KEY (codigo),
	FOREIGN KEY (cedula_cliente) REFERENCES cliente(cedula));

CREATE TABLE habitacion_cliente(
    cedula_cliente int,
    id_reserva int,
    num_habitacion int,
    PRIMARY KEY (cedula_cliente,id_reserva,num_habitacion)
);
-- INSERT DATA

-- RESERVAS

INSERT INTO "SAMPLEUSER"."RESERVA" (CODIGO, CEDULA_CLIENTE, FECHA_INICIO, FECHA_FIN, FECHA_ENTREGA) VALUES ('1', '1', TO_DATE('2020-03-10 23:27:40', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-19 23:27:54', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-18 23:28:08', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SAMPLEUSER"."RESERVA" (CODIGO, CEDULA_CLIENTE, FECHA_INICIO, FECHA_FIN, FECHA_ENTREGA) VALUES ('2', '2', TO_DATE('2020-03-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SAMPLEUSER"."RESERVA" (CODIGO, CEDULA_CLIENTE, FECHA_INICIO, FECHA_FIN, FECHA_ENTREGA) VALUES ('3', '3', TO_DATE('2020-03-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SAMPLEUSER"."RESERVA" (CODIGO, CEDULA_CLIENTE, FECHA_INICIO, FECHA_FIN, FECHA_ENTREGA) VALUES ('4', '4', TO_DATE('2020-03-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SAMPLEUSER"."RESERVA" (CODIGO, CEDULA_CLIENTE, FECHA_INICIO, FECHA_FIN, FECHA_ENTREGA) VALUES ('5', '5', TO_DATE('2020-03-10 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-19 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-03-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SAMPLEUSER"."RESERVA" (CODIGO, CEDULA_CLIENTE, FECHA_INICIO, FECHA_FIN, FECHA_ENTREGA) VALUES ('6', '1', TO_DATE('2019-07-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-06-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2019-06-21 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SAMPLEUSER"."RESERVA" (CODIGO, CEDULA_CLIENTE, FECHA_INICIO, FECHA_FIN, FECHA_ENTREGA) VALUES ('7', '1', TO_DATE('2020-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-01-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2020-01-15 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))


-- HabitacionCliente
INSERT INTO habitacion_cliente VALUES(1, 1, 101);
INSERT INTO habitacion_cliente VALUES(1, 6, 101);
INSERT INTO habitacion_cliente VALUES(1, 6, 102);
INSERT INTO habitacion_cliente VALUES(1, 6, 202);
INSERT INTO habitacion_cliente VALUES(1, 7, 101);
INSERT INTO habitacion_cliente VALUES(2, 2, 101);
INSERT INTO habitacion_cliente VALUES(3, 3, 202);
INSERT INTO habitacion_cliente VALUES(4, 4, 301);

-- Clientes
INSERT INTO cliente VALUES(1, 'Juan', 'Nilo');
INSERT INTO cliente VALUES(2, 'Zion', 'Rofola');
INSERT INTO cliente VALUES(3, 'Barta', 'Hoyos');
INSERT INTO cliente VALUES(4, 'Kamila', 'Smatj');
INSERT INTO cliente VALUES(5, 'Pepe', 'Dokim');

# Valores para cargo

INSERT INTO cargo VALUES(1, 'Habitacion');
INSERT INTO cargo VALUES(2, 'Masajista');
INSERT INTO cargo VALUES(3, 'Mantenimiento');
INSERT INTO cargo VALUES(4, 'Contador');
INSERT INTO cargo VALUES(5, 'Protocolo');
# Valores para actividad

INSERT INTO actividad VALUES(1, 'Limpieza', 1);
INSERT INTO actividad VALUES(2, 'Cambio_Toallas', 1);
INSERT INTO actividad VALUES(3, 'Lavanderia', 1);

# Valores para Habitacion

INSERT INTO habitacion VALUES(101, 50000);
INSERT INTO habitacion VALUES(102, 75000);
INSERT INTO habitacion VALUES(201, 100000);
INSERT INTO habitacion VALUES(202, 150000);
INSERT INTO habitacion VALUES(301, 350000);

# Valores para Empleado


INSERT INTO "SAMPLEUSER"."EMPLEADO" (CEDULA, NOMBRE, CARGO, APELLIDO, FECHA_NACIMIENTO) VALUES ('1010', 'Alexander', '1', 'Arevalo', TO_DATE('2020-04-07 22:47:41', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SAMPLEUSER"."EMPLEADO" (CEDULA, NOMBRE, CARGO, APELLIDO, FECHA_NACIMIENTO) VALUES ('2010', 'Jaime', '1', 'Garzon', TO_DATE('2003-04-25 22:47:55', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SAMPLEUSER"."EMPLEADO" (CEDULA, NOMBRE, CARGO, APELLIDO, FECHA_NACIMIENTO) VALUES ('3010', 'Paco', '1', 'Amarilo', TO_DATE('2003-04-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SAMPLEUSER"."EMPLEADO" (CEDULA, NOMBRE, CARGO, APELLIDO, FECHA_NACIMIENTO) VALUES ('4010', 'Yuri', '1', 'Pachon', TO_DATE('2003-04-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SAMPLEUSER"."EMPLEADO" (CEDULA, NOMBRE, CARGO, APELLIDO, FECHA_NACIMIENTO) VALUES ('5010', 'Kiara', '2', 'Morado', TO_DATE('1999-04-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))
INSERT INTO "SAMPLEUSER"."EMPLEADO" (CEDULA, NOMBRE, CARGO, APELLIDO, FECHA_NACIMIENTO) VALUES ('6010', 'Paco', '3', 'Amarilo', TO_DATE('2003-04-27 00:00:00', 'YYYY-MM-DD HH24:MI:SS'))

# Valores para EmpleadohABITACION

INSERT INTO empleado_habitacion VALUES(1010, 101);
INSERT INTO empleado_habitacion VALUES(2010, 102);
INSERT INTO empleado_habitacion VALUES(3010, 201);
INSERT INTO empleado_habitacion VALUES(4010, 202);
INSERT INTO empleado_habitacion VALUES(4010, 301);


# Valores para CARACTERISTICA

INSERT INTO caracteristica VALUES(1, 'Baño');
INSERT INTO caracteristica VALUES(3, 'Bar');
INSERT INTO caracteristica VALUES(2, 'Salon');
INSERT INTO caracteristica VALUES(4, 'Hidromasaje');
# Modificar tabla empleado

ALTER TABLE Empleado add apellido varchar(200);
ALTER TABLE Empleado add fecha_nacimiento date;



# Valores para HabitacionCaracteristica

-- 1 baño 2 bar 3 Salon 4 Hidromasaje
INSERT INTO habitacion_caracteristica VALUES(101, 1);
INSERT INTO habitacion_caracteristica VALUES(102, 1);
INSERT INTO habitacion_caracteristica VALUES(201, 1);
INSERT INTO habitacion_caracteristica VALUES(202, 1);
INSERT INTO habitacion_caracteristica VALUES(301, 1);

INSERT INTO habitacion_caracteristica VALUES(201, 2);
INSERT INTO habitacion_caracteristica VALUES(202, 2);
INSERT INTO habitacion_caracteristica VALUES(301, 2);

INSERT INTO habitacion_caracteristica VALUES(202, 3);
INSERT INTO habitacion_caracteristica VALUES(301, 3);

INSERT INTO habitacion_caracteristica VALUES(301, 4);
# Update un campo Y mayuscula acepta el año en 4 DIgitos 

UPDATE Empleado SET fecha_nacimiento =STR_TO_DATE("01/02/2001","%m/%d/%Y") WHERE cedula = 1015;

UPDATE Empleado SET fecha_nacimiento =STR_TO_DATE("01/02/2001","%m/%d/%Y") WHERE cedula = 2015;

--DELETE
DELETE FROM cargo WHERE codigo = 5;


/*ORACLE SENTENCES*/
--Conexion a mi User HAY QUE CREAR USERS al hilo principal que es xepdb1
conn SAMPLEUSER/oracle@//DESKTOP-M966U1C:1521/xepdb1

conn SAMPLEUSER/oracle@XEPDB1;


--Ver mis tablas con ORACLE
 select table_name from user_tables;




 --consultas

 --Nombre del cargo y la cantidad de empleados para cada uno de los cargos.

select cargo.nombre, COUNT(empleado.cargo) AS cant_empleados from cargo
INNER JOIN empleado ON cargo.codigo = empleado.cargo
GROUP BY cargo.nombre; 

--Habitaciones a cargo del empleado Lalo Rodriguez
select * from empleado_habitacion where cedula_empleado = 4010;

-- Cliente que ha alquilado mayor numero de Habitaciones
SELECT cedula_cliente, COUNT( cedula_cliente ) AS total_habs
FROM  habitacion_cliente
GROUP BY cedula_cliente;


--. Valor a pagar para una determinada reserva.
SELECT * FROM reserva WHERE codigo = 6;
SELECT * FROM habitacion_cliente where id_reserva = 6;
SELECT * FROM habitacion;


-- Mirar los dias que se quedo ?

SELECT DATEDIFF(day,  fecha_incio,fecha_entrega) from reserva where codigo = 6;

-- Hacer operacion  dias * valor_habitacy sumar todas las las multiplicaiones



-- Empleados que pertenecen al cargo con código 1
	select * from Empleado where cargo = 1;

-- Empleados que pertenecen al cargo de Masajista

	select cedula_empleado,empleado.nombre, count(*) as numerodehabitaciones 
    from empleado_habitacion

;

--  El número de las habitaciones a cargo de cada uno de los empleados de Habitación 
	
	select cedula_empleado,empleado.nombre, count(*) as NumerodeHabitaciones
    from empleado_habitacion 
        inner join empleado on empleado.CEDULA = empleado_habitacion.cedula_empleado
        group by cedula_empleado;

-- Cantidad de habitaciones a cargo de Lalo Pérez.

-- NOTA: Como no tengo a Lalo Perez, lo voy a hacer con Paco (cedula: 1015)

    select cedula_empleado,empleado.nombre, count(*) as NumerodeHabitaciones 
    from empleado_habitacion 
        inner join empleado on empleado.CEDULA = empleado_habitacion.cedula_empleado 
        and empleado.CEDULA = 1015
    group by cedula_empleado;


-- Número de las habitaciones que tienen el servicio de hidromasaje.

select * from habitacion_caracteristica where codigo_caracterisca = 4;

-- Clientes que actualmente se encuentran hospedados

select * from clientes where CEDULA in
(select cedula_cliente from reservas where curdate() between fecha_inicio AND fecha_fin);

-- Habitaciones alquiladas que quedan disponibles dentro de 5 días.

select * from reservas_habitaciones where id_reserva in
(select id_reserva from reservas where (curdate() between fecha_inicio AND fecha_fin)
AND  fecha_fin > DATE_ADD(curdate(), INTERVAL 5 DAY));
