CREATE TABLE cliente (
    cedula int NOT NULL,
    nombre varchar(255) NOT NULL,
    direccion varchar(255) NOT NULL,
    telefono varchar(255) NOT NULL,
    correo varchar(255) NOT NULL,
    PRIMARY KEY (cedula)
);

insert into cliente values(1,'Juan', 'CRA 10','312011','juan@juan.com');
insert into cliente values(2,'Maria', 'CRA 20','31222','maria@maria.com');
insert into cliente values(3,'Paco', 'CRA 30','312452','paco@paco.com');
insert into cliente values(4,'Karen', 'CRA 40','312302','karen@karen.com');
insert into cliente values(5,'Alex', 'CRA 120','312702','alex@alex.com');
insert into cliente values(6,'Sasha', 'CRA 110','312532','sasha@sasha.com');
insert into cliente values(7,'Pedro', 'CRA 105','313562','pedro@pedro.com');
insert into cliente values(8,'Alendra', 'CRA 203','312972','alejandra@alejandra.com');

CREATE TABLE factura (
    numero int NOT NULL,
    ced_cliente int NOT NULL,
    fecha date,
    PRIMARY KEY (numero),
    FOREIGN KEY (ced_cliente) REFERENCES cliente(cedula)
);

insert into factura values(1,1,TO_DATE('2020-05-31 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(2,2,TO_DATE('2020-02-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(3,6,TO_DATE('2020-01-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(4,6,TO_DATE('2020-01-02 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(5,8,TO_DATE('2020-02-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(6,8,TO_DATE('2020-04-25 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(7,4,TO_DATE('2020-04-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(8,6,TO_DATE('2020-05-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(9,5,TO_DATE('2020-04-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(10,5,TO_DATE('2020-04-26 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(11,4,TO_DATE('2020-05-11 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(12,3,TO_DATE('2020-05-12 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(13,2,TO_DATE('2020-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(14,1,TO_DATE('2020-05-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(15,6,TO_DATE('2020-05-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
insert into factura values(16,2,TO_DATE('2020-05-03 00:00:00', 'YYYY-MM-DD HH24:MI:SS'));
CREATE TABLE producto (
    codigo int NOT NULL,
    nombre  varchar(255) ,
    val_unitario int,
    PRIMARY KEY (codigo)
);

insert into producto values(1,'Arroz',2000);
insert into producto values(2,'Chocolate',5000);
insert into producto values(3,'Pasta',2500);
insert into producto values(4,'Frijoles',1000);
insert into producto values(5,'Papas',1200);
insert into producto values(6,'Galletas',900);
insert into producto values(7,'Yogurt',2000);
insert into producto values(8,'Leche',2500);
insert into producto values(9,'Gelatina',1000);
insert into producto values(10,'Salchicha',3000);
insert into producto values(11,'Huevo',500);
insert into producto values(12,'Postre',2700);
insert into producto values(13,'Jamon',4000);
insert into producto values(14,'Queso',3000);
insert into producto values(15,'Pan',3000);
insert into producto values(16,'Gaseosa',4500);
insert into producto values(17,'Labial',5000);
insert into producto values(18,'Pollo',10000);
insert into producto values(19,'Carne',4000);
insert into producto values(20,'Camisa',10000);
insert into producto values(21,'Pantalon',20000);
insert into producto values(22,'Manzana',1000);
insert into producto values(23,'Agua',3000);
insert into producto values(24,'Hamburguesa',6000);

CREATE TABLE detalle_fac (
    num_factura int NOT NULL,
    cod_producto int NOT NULL,
    cantidad int,
    porcentaje_iva int,
    PRIMARY KEY (num_factura,cod_producto),
    FOREIGN KEY (num_factura) REFERENCES factura(numero),
    FOREIGN KEY (cod_producto) REFERENCES producto(codigo)
);

insert into detalle_fac values(1,1,10,19);
insert into detalle_fac values(1,2,8,19);
insert into detalle_fac values(2,3,3,19);
insert into detalle_fac values(2,4,4,19);
insert into detalle_fac values(3,5,5,19);
insert into detalle_fac values(3,7,6,19);
insert into detalle_fac values(4,8,2,19);
insert into detalle_fac values(4,9,1,19);
insert into detalle_fac values(5,10,4,19);
insert into detalle_fac values(5,11,6,19);
insert into detalle_fac values(6,12,3,19);
insert into detalle_fac values(6,13,3,19);
insert into detalle_fac values(7,14,3,19);
insert into detalle_fac values(8,15,1,19);
insert into detalle_fac values(9,16,1,19);
insert into detalle_fac values(9,17,4,19);
insert into detalle_fac values(10,18,6,19);
insert into detalle_fac values(10,19,4,19);
insert into detalle_fac values(11,20,4,19);
insert into detalle_fac values(11,21,4,19);
insert into detalle_fac values(12,22,2,19);
insert into detalle_fac values(13,23,2,19);
insert into detalle_fac values(13,24,2,19);
insert into detalle_fac values(14,12,9,19);
insert into detalle_fac values(14,10,4,19);
insert into detalle_fac values(15,5,10,19);
insert into detalle_fac values(16,5,2,19);

--CONSULTAS

-- Facuturas entre 1 Enero 2020 y 31 Marzo 2020 
select * from factura where fecha between 
to_date( '2020-01-01','yyyy-mm-dd') and to_date('2020-03-31','yyyy-mm-dd');


--Nombre de los productos facturados entre enero y marzo
create view facentreeneromarzo as
select * from detalle_fac 
inner join producto ON cod_producto = codigo
where num_factura IN 
(select numero from factura where fecha between 
to_date( '2020-01-01','yyyy-mm-dd') and to_date('2020-03-31','yyyy-mm-dd'));

-- Suma de la vista de arriba
select sum(val_unitario) from facentreeneromarzo;



--Detalle de facturas entre 1 a 15 de abril
select * from detalle_fac where num_factura IN 
(select numero from factura where fecha between 
to_date( '2020-04-01','yyyy-mm-dd') and to_date('2020-04-15','yyyy-mm-dd'));

-- Cuanto se ha vendido de cada producto del 1 a 15 de abril
select df.*,p.*,(p.val_unitario * df.cantidad) as TOTALE from detalle_fac df
inner join producto p ON df.cod_producto = p.codigo
where df.num_factura IN 
(select numero from factura where fecha between 
to_date( '2020-04-01','yyyy-mm-dd') and to_date('2020-04-15','yyyy-mm-dd'));


-- Cliente que ha comprado X producto

select * from factura 
inner join cliente ON ced_cliente = cedula
where numero IN
(select num_factura from  detalle_fac where cod_producto = 5);

-- Facturas que han comprado mas de 6 productos

select * from detalle_fac where cantidad > 6;

-- Facturas que han comprado mas de 6 productos descuento de 15% sobre el total facturado
-- si es menor a 6 descuento del 3% sobre el total facturado
set SERVEROUT ON;
DECLARE

cursor cur is
    select * from detalle_fac;
    
        rCur cur%rowtype;
        nombre producto.nombre%type;
        total float;
        descuento float;
    
BEGIN

        open cur;
            loop fetch cur into rCur;exit when cur%notfound;
            dbms_output.put_line('____________________________');
            
            select nombre  into nombre from producto where codigo =rCur.cod_producto;
            dbms_output.put_line('Name Producto: ' || nombre);
            
            
            select (val_unitario *rCur.cantidad ) into total from producto  where codigo =rCur.cod_producto;
            dbms_output.put_line('Total Factura: ' || total);
            
            dbms_output.put_line('Cantidad: ' || rCur.cantidad);
                if(rCur.cantidad > 6) then
                    dbms_output.put_line('Num_fac: '|| rCur.num_factura);
                    dbms_output.put_line('Ha comprado mas de 6');
                    descuento := total * 0.15;
                    dbms_output.put_line('Tiene un descuento del 15%: ' || descuento);
                    
                    
                 elsif(rCur.cantidad < 6) then
                    dbms_output.put_line('Num_fac: '|| rCur.num_factura);
                    dbms_output.put_line('Ha comprado MENOS de 6');
                    descuento := total * 0.03;
                    dbms_output.put_line('Tiene un descuento del 3%: ' || descuento);
                end if;
               dbms_output.put_line('____________________________');
            end loop;
        close cur;
END;


-- Veces repetidas de cada producto
select cod_producto, count(*) as cantidad from detalle_fac group by cod_producto;


-- Veces repetidas de cada producto
create view cantidadrepetidaporproducto as 
select cod_producto, count(*) as cantidad from detalle_fac group by cod_producto;

-- Mostrar el producto que mas veces se vendio 
select * from producto where codigo IN
(select max(cantidad) from cantidadrepetidaporproducto);