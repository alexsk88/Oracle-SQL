CREATE TABLE cliente (
    cedula int NOT NULL,
    nombre varchar(255),
    direccion varchar(255),
    telefono varchar(255),
    correo varchar(255),
    PRIMARY KEY (cedula),
);

CREATE TABLE factura (
    numero int NOT NULL,
    ced_cliente varchar(255),
    fecha date,
    PRIMARY KEY (numero),
    FOREIGN KEY (ced_cliente) REFERENCES cliente(cedula)
);

CREATE TABLE producto (
    codigo int NOT NULL,
    nombre varchar(255),
    val_unitario int,
    PRIMARY KEY (codigo)
);

CREATE TABLE detalle_factura (
    numero_factura int NOT NULL,
    cod_producto int,
    catidad int,
    PRIMARY KEY (numero_factura, cod_producto),
    FOREIGN KEY (numero_factura) REFERENCES factura(numero),
    FOREIGN KEY (cod_producto) REFERENCES producto(codigo)
);


-- Mostrar el nombre de los alumnos a quienes se les ha prestado el libro Bases de Datos Relacionales.
    SELECT alumno.* FROM alumno WHERE codigo IN 
    (SELECT prestamo.cod_alumno FROM prestamo);


--Nombre de los proyectos que no se han sido asignados a Sandra Rojas.
    SELECT nombre FROM proyecto;
    -- Sunpongamos que Sandra Rojas tiene cedula 5.
    SELECT * FROM tareas WHERE ced_empleado != 5;

    SELECT tareas.*, proyecto.nombre FROM tareas WHERE ced_empleado != 5 
    INNER JOIN proyecto ON proyecto.codigo = tareas.cod_proyecto;


-- Total facturado el 16 de abril de 2020 por el hotel con nombre Dulces sueños.


    -- SUPONGAMOS QUE hotel DUCLES SUEÑOS tiene id = 5
    SELECT * FROM hotel WHERE id = 5

    SELECT * 
    FROM reserva 
    WHERE fecha_ingreso between '20200416 00:00:00' and '20200416 23:59:59' AND
          id_hotel = 5

    -- Reservas de Dulces sueños el 16 de abril
    CREATE VIEW reservasdulcesabril as
    SELECT * 
    FROM reserva 
    WHERE fecha_ingreso between '20200416 00:00:00' and '20200416 23:59:59' AND
          id_hotel = 5


    SELECT sum(habitacion.valor_dia) FROM habitacion, reservasdulcesabril;
    WHERE habitacion.codigo= reservasdulcesabril.cod_habitacion;


-------------------------------------------------------------------------------------------
    
select t.nombre Cliente,
    sum(f.importetotal) Importe_Total,
    count(f.codigo) Numero_Facturas
from facturas f, clientes t
where t.codigo = f.codigocliente and
    fecha between  '2008-01-01' and '2008-12-31'
group by f.codigocliente


-- Nombre del proyecto que más empleados tiene.

SELECT * FROM proyecto;



    create view CProyectoTareas as
        select tarea.cod_proyecto ,count(*) as Cantidad_Tareas 
        from tarea
            inner join empleado ON empleado.cedula =tarea.ced_empleado
        GROUP by tarea.ced_empleado;

    create view valormaximo_tareas as
    SELECT max(Cantidad_Tareas) as ValorMax FROM CProyectoTareas;    

    -- select * from LIBRO where CODIGO IN
    --     (
    --         SELECT  COD_LIBRO
    --         FROM CLibrosPrestamo,valorminimo_prestamos 
    --         where Cantidad_Prestamos = valorminimo_prestamos.VALORMINIMO
    --     );
    select * from empleado where cedula IN
        (
            SELECT  ced_empleado
            FROM CProyectoTareas,valormaximo_tareas 
            where Cantidad_Tareas = valormaximo_tareas.ValorMax
        );



        

select cargo.nombre, COUNT(empleado.cargo) AS cant_empleados from cargo
INNER JOIN empleado ON cargo.codigo = empleado.cargo
GROUP BY cargo.nombre; 
