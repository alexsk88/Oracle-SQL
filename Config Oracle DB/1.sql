--BIENVENIDOS
--EN ESTE VIDEO NOS CONECTAREMOS AL EQUEMA HR DE EJEMPLO PARA VER SUS TABLAS.


--CONECTARNOS AL ESQUEMA DE EJEMPLO HR Y VER LAS TABLAS.

--1).	Tener instalado Oracle 18c Expres Edition.
--2).	cmd (Ejecutar como Administrador)
--3).	sqlplus
--4).	sys /as sysdba
--5).	Ver bases de datos en la que nos podemos conectar.
	SELECT name, con_id FROM v$pdbs;

--6).	Identificar base de datos predeterminada: XEPDB1
	SELECT name as "Service Name" FROM v$active_services WHERE con_id =3;

--7).	Ir al archivo tnsnames.ora para agregar una nueva entrada (ALIAS) que nos permita conectarnos 
--	directamente a nuestra base de datos predeterminada.
--	Este archivo lo encontramos en la siguiente ruta: 
--	C:\app\dieselemcode\product\18.0.0\dbhomeXE\network\admin

--VERIFIQUEMOS EL HOSTNAME O NOMBRE DE EQUIPO	

--En mi computador quedo asi:

--XEPDB1 =
--  (DESCRIPTION =
--    (ADDRESS = (PROTOCOL = TCP)(HOST = DESKTOP-LUCJFIV)(PORT = 1521))
--    (CONNECT_DATA =
--      (SERVER = DEDICATED)
--      (SERVICE_NAME = xepdb1
--    )
--  )
--
--8).	Salir de sqlplus y reiniciar Listener:
--	lsnrctl reload
--9).	Ver el estado del Listener:
--	lsnrctl status
--10).	Conectarnos nu�vamente a sqlplus con los pasos 3 y 4 y cambiaremos de sesi�n, 
--	nos cambiaremos a la sesi�n de nuestra base de datos predeterminada: 
	ALTER SESSION SET container = XEPDB1;
--11).	Ver si nuestra base de datos predeterminada est� en estado ABIERTA: 
	SELECT name, open_mode FROM v$pdbs;
	

--12).	Abrir base de datos (En caso de que no aparezca abierta):
	ALTER PLUGGABLE DATABASE open;

--13).	Desbloqueamos el usuario HR: 
	ALTER USER hr IDENTIFIED BY hr ACCOUNT UNLOCK;

--14).	Nos conectamos con el usuario HR:
--	conn hr/hr@//DESKTOP-LUCJFIV:1521/xepdb1
--	tambi�n podemos conectarnos usando el ALIAS agregado anteriormente al archivo tnsnames.ora
--	conn hr/hr@XEPDB1;
	

--15).	Ver las tablas del esquema HR:
	select table_name from user_tables;

--16).	Ver usuario de conexi�n actual:
	SHOW USER;

--FIN DEL VIDEO

SALUDES MIS AMIGOS!!!!!

	

