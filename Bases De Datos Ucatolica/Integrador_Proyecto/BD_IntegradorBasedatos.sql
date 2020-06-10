CREATE TABLE tipo_user(
    id int NOT NULL,
    nombre varchar(255) NOT NULL,
    descripcion varchar(255) NOT NULL,
    PRIMARY KEY (id)
);
insert into tipo_user values(1,'ADMIN','superuser');
insert into tipo_user values(2,'TENDERO','TENDEROuser');

CREATE TABLE usuario (
    id int NOT NULL,
    nombre varchar(255) NOT NULL,
    apellido varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    tipo_user int NOT NULL,
    password varchar(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (tipo_user) REFERENCES tipo_user(id)
);

insert into usuario values(1,'alexander','nova','alex@alex.com',1,'alexpass');
insert into usuario values(2,'sara','salgado','sara@sara.com',2,'sarapass');
insert into usuario values(3,'mariana','arevalo','mari@mari.com',2,'maripass');



create table tipo_producto(
    id int NOT NULL,
    nombre varchar(255) NOT NULL,
    descripcion varchar(255) NOT NULL,
    PRIMARY KEY (id)
);
insert into tipo_producto values(1,'venta','articulos de venta');
insert into tipo_producto values(2,'insumo','articulos de crear productos');

create table categoria_producto(
    id int NOT NULL,
    nombre varchar(255) NOT NULL,
    descripcion varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

insert into categoria_producto values(1,'lacteos','articulos de leche');
insert into categoria_producto values(2,'gaseosa','articulos de gaseosa');
insert into categoria_producto values(3,'cafeteria','articulos de cafeteria');
insert into categoria_producto values(4,'abarrotes','articulos de abarootes');
insert into categoria_producto values(5,'drogeria','articulos de drogeria');
insert into categoria_producto values(6,'aseo','articulos de aseo');
insert into categoria_producto values (152,'Papeleria','articulos de papeleria');
insert into categoria_producto values (36,'Cosmeticos','articulos de papeleria');


create table producto(
    id int NOT NULL,
    nombre varchar(255) NOT NULL,
    descripcion varchar(255) NOT NULL,
    iva int NOT NULL,
    precio_venta int NOT NULL,
    precio_provedor int NOT NULL,
    cantidad int NOT NULL,
    id_tipo_producto int NOT NULL,
    id_categoria int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_tipo_producto) REFERENCES tipo_producto(id),
    FOREIGN KEY (id_categoria) REFERENCES categoria_producto(id)
);

insert into producto values(1,'Queso 30g','desc',0,1200,1000,5,1,1);
insert into producto values(2,'Queso 60g','desc',0,2200,1800,8,1,1);
insert into producto values(3,'Leche 900ml','desc',0,1800,2300,12,1,1);
insert into producto values(4,'Gaseosa Postobon Manzana 270ml','desc',0,1300,900,31,1,2);
insert into producto values(5,'Gaseosa Postobon Limon 270ml','desc',0,1300,900,31,1,2);
insert into producto values(6,'Gaseosa Postobon Colombiana 350ml','desc',0,2000,1400,31,1,2);
insert into producto values(7,'Cafe 7oz','desc',0,2000,1400,31,1,3);
insert into producto values(8,'Cafe 12oz','desc',0,2500,1900,31,1,3);
insert into producto values(9,'Arroz 1lb','desc',0,2000,1200,31,1,4);
insert into producto values(10,'Frijoles 1lb','desc',0,2000,1300,31,1,4);
insert into producto values(11,'Dolex Forte 4g','desc',0,1500,700,12,1,5);
insert into producto values(12,'Advil Max 4g','desc',0,1800,1400,12,1,5);
insert into producto values(13,'Papel Hijienico','desc',0,1500,700,12,1,6);
insert into producto values(14,'Shampoo Pantene Xtreme 12g','desc',0,700,400,22,1,6);


create table tipo_factura(
    id INT NOT NULL,
    nombre varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

insert into tipo_factura values (1,'venta');
insert into tipo_factura values (2,'cotizacion');
insert into tipo_factura values (3,'gasto');


create table factura(
    id int NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    id_cliente int NOT NULL,
    id_tipofactura int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id_cliente) REFERENCES usuario(id),
    FOREIGN KEY (id_tipofactura) REFERENCES tipo_factura(id)
);
-- insert into factura values(1,);

create table detalle_factura(
    num_factura int NOT NULL,
    cod_producto int NOT NULL,
    cantidad int NOT NULL,
    iva int NOT NULL,
    PRIMARY KEY (num_factura,cod_producto),
    FOREIGN KEY (num_factura) REFERENCES factura(id),
    FOREIGN KEY (cod_producto) REFERENCES producto(id)
);


--CONSULTASSSSSS SWEETS

-- Enumera de 1 a N, los id;
SELECT id,RANK () OVER ( ORDER BY id ) rank_no 
FROM
categoria_producto;

-- Vista de lo anterior
create view idcategoriasrank as
SELECT id,RANK () OVER ( ORDER BY id DESC ) rank_no 
FROM
categoria_producto;

-- ULTIMO VALOR
select * from idcategoriasrank where rank_no IN
(select max(rank_no) from idcategoriasrank); 

-- PRIMER VALOR
select * from idcategoriasrank where rank_no IN
(select min(rank_no) from idcategoriasrank); 


--------------------- PLSQL---------------------------

--PL Get All Categorias
create or replace procedure categorias(p_cursor out types.ref_cursor) as
begin
    open p_cursor for
    select * from categoria_producto;
end;
 
-- Cateforias con rank muy proo
select cp.*, cra.rank_no from categoria_producto cp
inner join idcategoriasrank cra on cp.id = cra.id;



-- Cursor para traer categoria de acuerdo al rank 
create or replace procedure categorias_by_rank(
p_cursor out types.ref_cursor,
num_rank IN int) as
begin
    open p_cursor for
    select * from categoriascon_rank where rank_no = num_rank;
end;