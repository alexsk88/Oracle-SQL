-- 0 Acceder a la consola SQL de Oracle
sqlplus

-- 1 Entrar al sqlplus (shell), password no tiene
sys /as sysdba

--2 Ver Contenedores
	SELECT name, con_id FROM v$pdbs;

--3 Seleccionar Contendor en este caso -> XEPDB1
    ALTER SESSION SET container = XEPDB1;

--4 Ver name y abrir databaseCONTENEDOR: 
	SELECT name, open_mode FROM v$pdbs;
    ALTER PLUGGABLE DATABASE open;

--5 Reservar Espacio para la BD- se llama SAMPLETAB
	CREATE SMALLFILE TABLESPACE DBINTEGRADORTAB DATAFILE 
    'C:\app\alexander\product\18.0.0\oradata\XE\XEPDB1\DBINTEGRADORTAB.DBF'
     SIZE 200M LOGGING EXTENT MANAGEMENT
     LOCAL SEGMENT SPACE MANAGEMENT AUTO;


--6  Crear USER
    CREATE USER INTEGRADOR_DB PROFILE DEFAULT IDENTIFIED BY oracle 
    DEFAULT TABLESPACE DBINTEGRADORTAB TEMPORARY TABLESPACE TEMP ACCOUNT 
    UNLOCK quota unlimited on DBINTEGRADORTAB;

    CREATE USER PARCIALFINAL_DB PROFILE DEFAULT IDENTIFIED BY oracle 
    DEFAULT TABLESPACE DBINTEGRADORTAB TEMPORARY TABLESPACE TEMP ACCOUNT 
    UNLOCK quota unlimited on DBPARCIALFINAL;


--7 DAR PERMISOS
    GRANT CONNECT TO INTEGRADOR_DB;
	GRANT RESOURCE TO INTEGRADOR_DB;
	GRANT INSERT ANY TABLE TO INTEGRADOR_DB;
	GRANT CREATE ANY VIEW TO INTEGRADOR_DB;

 
-- 8 CREAR TABLAS E INSERT
	
