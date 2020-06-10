--BIENVENIDOS
--IMPORTANTE PERO OPCIONAL (VER VIDEO DEL CANAL DE NOMBRE: Primeros Pasos Oracle 18c Express Edition.)


--CREAREMOS UN NUEVO USUARIO CON SUS ROLES, SU TABLESPACE, CONEXION 

---1).	VER EL VIDEO (MUY IMPORTANTE)

--0).	Comprobar que los servicios windows OracleServiceXe y OracleOraDB18Home1TNSListener est�n iniciados.

--1).	Tener instalado Oracle 18c Expres Edition. (OMITAN ESTE)
--2).	cmd (Ejecutar como Administrador)
--3).	sqlplus
--4).	sys /as sysdba
--5).	Ver bases de datos en la que nos podemos conectar.
	SELECT name, con_id FROM v$pdbs;


--6).	Cambiaremos a la sesi�n de nuestra base de datos predeterminada: (PASO IMPORTANTE)
	ALTER SESSION SET container = XEPDB1;

--7).	Ver si nuestra base de datos predeterminada est� en estado ABIERTA: 
	SELECT name, open_mode FROM v$pdbs;
	

--8).	Abrir base de datos (En caso de que no aparezca abierta):
	ALTER PLUGGABLE DATABASE open;


--9).	Creamos TABLESPACE de nombre: SAMPLETAB
	CREATE SMALLFILE TABLESPACE SAMPLETAB DATAFILE 'C:\app\alexander\product\18.0.0\oradata\XE\XEPDB1\SAMPLETAB.DBF' SIZE 200M LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;
	CREATE SMALLFILE TABLESPACE SAMPLETAB2 DATAFILE 'C:\app\alexander\product\18.0.0\oradata\XE\XEPDB1\SAMPLETAB2.DBF' SIZE 200M LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;
	
	
	
	CREATE SMALLFILE TABLESPACE SPACEBIBLIOTECA DATAFILE 'C:\app\alexander\product\18.0.0\oradata\XE\XEPDB1\SPACEBIBLIOTECA.DBF' SIZE 200M LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;
	
	--ESPACIO PARA BD QUIZ tercer corte
	CREATE SMALLFILE TABLESPACE SPACEPRODUCTOSFAC DATAFILE 'C:\app\alexander\product\18.0.0\oradata\XE\XEPDB1\SPACEPRODUCTOSFAC.DBF' SIZE 200M LOGGING EXTENT MANAGEMENT LOCAL SEGMENT SPACE MANAGEMENT AUTO;


--10).	Creamos nuestro usuario de nombre: SAMPLEUSER, perfil por defecto: DEFAULT, le ponemos de contrase�a: oracle, 
--	asignamos tablespace por defecto: SAMPLETAB, tablespace temporal: TEMP, desbloqueamos el usuario y le damos una quota ilimitada a nuestro tablespace.

	CREATE USER SAMPLEUSER PROFILE DEFAULT IDENTIFIED BY oracle DEFAULT TABLESPACE SAMPLETAB TEMPORARY TABLESPACE TEMP ACCOUNT UNLOCK quota unlimited on SAMPLETAB;
	CREATE USER BIBLIOTECA PROFILE DEFAULT IDENTIFIED BY oracle DEFAULT TABLESPACE SAMPLETAB2 TEMPORARY TABLESPACE TEMP ACCOUNT UNLOCK quota unlimited on SAMPLETAB2;
	
	
	CREATE USER PRODUCTOFACTURA PROFILE DEFAULT IDENTIFIED BY oracle DEFAULT TABLESPACE SPACEPRODUCTOSFAC TEMPORARY TABLESPACE TEMP ACCOUNT UNLOCK quota unlimited on SPACEPRODUCTOSFAC;
	
	
	CREATE USER LIBRARY PROFILE DEFAULT IDENTIFIED BY oracle DEFAULT TABLESPACE SPACEBIBLIOTECA TEMPORARY TABLESPACE TEMP ACCOUNT UNLOCK quota unlimited on SPACEBIBLIOTECA;


--11).	Concedemos los roles de CONNECT y RESOURCE a nuestro usuario

	GRANT CONNECT TO BIBLIOTECA;
	GRANT RESOURCE TO BIBLIOTECA;
	GRANT INSERT ANY TABLE TO BIBLIOTECA;


	GRANT CONNECT TO LIBRARY;
	GRANT RESOURCE TO LIBRARY;
	GRANT INSERT ANY TABLE TO LIBRARY;
	GRANT CREATE ANY VIEW TO LIBRARY;

		GRANT CONNECT TO SAMPLEUSER;
	GRANT RESOURCE TO SAMPLEUSER;
	GRANT INSERT ANY TABLE TO SAMPLEUSER;
	GRANT CREATE ANY VIEW TO SAMPLEUSER;


	GRANT CONNECT TO PRODUCTOFACTURA;
	GRANT RESOURCE TO PRODUCTOFACTURA;
	GRANT INSERT ANY TABLE TO PRODUCTOFACTURA;
	GRANT CREATE ANY VIEW TO PRODUCTOFACTURA;

--12).	Nos aseguramos de estar en nuestro esquema:
	ALTER SESSION SET CURRENT_SCHEMA = PRODUCTOFACTURA;


--13).	Nos conectamos con nuestro usuario:
--	conn SAMPLEUSER/oracle@//DESKTOP-LUCJFIV:1521/xepdb1

--	tambi�n podemos conectarnos usando el ALIAS agregado anteriormente al archivo tnsnames.ora
--	conn SAMPLEUSER/oracle@XEPDB1; (Esto lo pueden ver en el video: Primeros Pasos Oracle 18c Express Edition.)
	

--14).	Ver las tablas del esquema SAMPLEUSER:
	select table_name from user_tables;


--15).	Ver usuario de conexi�n actual:
	SHOW USER;


--16).	AHORA NOS CONECTAREMOS CON PL/SQL Developer.


--17).	Crearemos las tablas utilizando el archivo de texto: CREATE_TABLES.txt que est� en nuestra carpeta descargada.


--18).	Insertaremos los datos utilizando el archivo de texto: INSERTS.txt que est� en nuestra carpeta descargada.
