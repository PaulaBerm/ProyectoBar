-------------CREACIÓN BASE DE DATOS---------------
CREATE DATABASE PRU_bar;
USE PRU_bar;

-------------CREACIÓN TABLAS---------------
CREATE TABLE GERENTE (
ID_GERENTE INTEGER AUTO_INCREMENT,
NOMBRE VARCHAR(50) NOT NULL,
APELLIDO VARCHAR(50) NOT NULL, 
CORREO VARCHAR(50) NOT NULL,
PASSWORD VARCHAR(12) NOT NULL,
PRIMARY KEY(ID_GERENTE)
);

CREATE TABLE ESTADOS (
ID_ESTADOS INTEGER AUTO_INCREMENT,
NOMBRE VARCHAR(50) NOT NULL,
PRIMARY KEY(ID_ESTADOS)
);

CREATE TABLE MESA (
ID_MESA INTEGER AUTO_INCREMENT,
NUMERO_MESA INTEGER NOT NULL,	
ID_ESTADOS INTEGER,
PRIMARY KEY(ID_MESA),
FOREIGN KEY(ID_ESTADOS) REFERENCES ESTADOS(ID_ESTADOS)
); 

CREATE TABLE EMPLEADO (
ID_EMPLEADO INTEGER AUTO_INCREMENT,
NOMBRE VARCHAR(50) NOT NULL,
APELLIDO VARCHAR(50) NOT NULL,
CORREO VARCHAR(50) NOT NULL,
PASSWORD VARCHAR(12) NOT NULL,
FECHA_INGRESO TIMESTAMP NOT NULL,
ID_GERENTE INTEGER,
PRIMARY KEY(ID_EMPLEADO),
FOREIGN KEY(ID_GERENTE) REFERENCES GERENTE(ID_GERENTE)
);

CREATE TABLE CLIENTE (
ID_CLIENTE INTEGER AUTO_INCREMENT,
USUARIO VARCHAR(12) NOT NULL,
NOMBRE VARCHAR(50) NOT NULL,
APELLIDO VARCHAR(50) NOT NULL,
CORREO VARCHAR(50) NOT NULL,
PASSWORD VARCHAR(12) NOT NULL,
FECHA_INGRESO TIMESTAMP NOT NULL,
ID_EMPLEADO INTEGER,
ID_GERENTE INTEGER,
ID_MESA INTEGER,
PRIMARY KEY(ID_CLIENTE),
FOREIGN KEY(ID_EMPLEADO) REFERENCES EMPLEADO(ID_EMPLEADO),
FOREIGN KEY(ID_GERENTE) REFERENCES GERENTE(ID_GERENTE),
FOREIGN KEY(ID_MESA) REFERENCES MESA(ID_MESA)
);

CREATE TABLE PEDIDO (
ID_PEDIDO INTEGER AUTO_INCREMENT,
NUMERO_PEDIDO INTEGER NOT NULL,
COSTO_TOTAL INTEGER NOT NULL,
FECHA_INGRESO date, 
FECHA_FIN date,
ID_MESA INTEGER,
ID_CLIENTE INTEGER,
ID_ESTADOS INTEGER,
PRIMARY KEY(ID_PEDIDO),
FOREIGN KEY(ID_MESA) REFERENCES MESA(ID_MESA),
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE),
FOREIGN KEY(ID_ESTADOS) REFERENCES ESTADOS(ID_ESTADOS)
);

CREATE TABLE PRODUCTO (
ID_PRODUCTO INTEGER AUTO_INCREMENT,
NOMBRE VARCHAR(50) NOT NULL,
MARCA VARCHAR(50) NOT NULL,
PRECIO INTEGER NOT NULL,
CANTIDAD INTEGER NOT NULL,
DESCRIPCION VARCHAR(100),
FECHA_INGRESO date NOT NULL,
FECHA_ACTUALIZACION date NOT NULL,
ID_ESTADOS INTEGER,
PRIMARY KEY(ID_PRODUCTO),
FOREIGN KEY(ID_ESTADOS) REFERENCES ESTADOS(ID_ESTADOS)
);

CREATE TABLE PEDIDO_PRODUCTO (
ID_PEDIDO_PRODUCTO INTEGER AUTO_INCREMENT,
ID_PEDIDO INTEGER,
ID_PRODUCTO INTEGER,
PRIMARY KEY(ID_PEDIDO_PRODUCTO),
FOREIGN KEY(ID_PEDIDO) REFERENCES PEDIDO(ID_PEDIDO),
FOREIGN KEY(ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO)
);

CREATE TABLE VENTA (
ID_VENTA INTEGER AUTO_INCREMENT,
DESCRIPCION VARCHAR(100),
FECHA_INGRESO TIMESTAMP,
ID_PEDIDO_PRODUCTO INTEGER,
PRIMARY KEY(ID_VENTA),
FOREIGN KEY(ID_PEDIDO_PRODUCTO) REFERENCES PEDIDO_PRODUCTO(ID_PEDIDO_PRODUCTO)
);

CREATE TABLE FACTURA (
ID_FACTURA INTEGER AUTO_INCREMENT,
IVA_FACTURA DECIMAL,
ID_VENTA INTEGER,
PRIMARY KEY(ID_FACTURA),
FOREIGN KEY(ID_VENTA) REFERENCES VENTA(ID_VENTA)
);

-------------CREACIÓN TRIGGER(FECHAS)---------------
---FECHA_INGRESO---
DELIMITER $
CREATE OR REPLACE TRIGGER TG_FECHAIN_EMPLEADO
BEFORE INSERT ON EMPLEADO
FOR EACH ROW
BEGIN
SET NEW.FECHA_INGRESO := NOW();
END;
$
DELIMITER ;

DELIMITER $
CREATE OR REPLACE TRIGGER TG__FECHAIN_CLIENTE
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
SET NEW.FECHA_INGRESO := NOW();
END;
$
DELIMITER ;

DELIMITER $
CREATE OR REPLACE TRIGGER TG_FECHAIN_PEDIDO
BEFORE INSERT ON PEDIDO
FOR EACH ROW
BEGIN
SET NEW.FECHA_INGRESO := NOW();
END;
$
DELIMITER ;

DELIMITER $
CREATE OR REPLACE TRIGGER TG_FECHAIN_PRODUCTO
BEFORE INSERT ON PRODUCTO
FOR EACH ROW
BEGIN
SET NEW.FECHA_INGRESO := NOW();
END;
$
DELIMITER ;

DELIMITER $
CREATE OR REPLACE TRIGGER TG_FECHAIN_VENTA
BEFORE INSERT ON VENTA
FOR EACH ROW
BEGIN
SET NEW.FECHA_INGRESO := NOW();
END;
$
DELIMITER ;

---FECHA_FIN---
DELIMITER $
CREATE OR REPLACE TRIGGER TG_FECHAFIN_PEDIDO
BEFORE UPDATE ON PEDIDO
FOR EACH ROW
BEGIN
SET NEW.FECHA_FIN := NOW();
END;
$
DELIMITER ;

---FECHA_ACTUALIZACION---
DELIMITER $
CREATE OR REPLACE TRIGGER TG_FECHAACT_PRODUCTO
BEFORE UPDATE ON PRODUCTO
FOR EACH ROW
BEGIN
SET NEW.FECHA_ACTUALIZACION := NOW();
END;
$
DELIMITER ;

---AGREGAR ID_GERENTE A TABLAS CLIENTE Y EMPLEADO---
DELIMITER $
CREATE OR REPLACE TRIGGER TG_IDG_CLIENTE
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
IF NEW.ID_GERENTE = '' THEN 
SET NEW.ID_GERENTE = 1;
END IF;
END;
$
DELIMITER ;

DELIMITER $
CREATE OR REPLACE TRIGGER TG_IDG_EMPLEADO
BEFORE INSERT ON EMPLEADO
FOR EACH ROW
BEGIN
IF NEW.ID_GERENTE = '' THEN 
SET NEW.ID_GERENTE = 1;
END IF;
END;
$
DELIMITER ;

---PONER EN MINUSCULA EL CAMPO USUARIO---
DELIMITER $
CREATE OR REPLACE TRIGGER TG_MIN_USUARIO
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
SET NEW.USUARIO := LOWER(NEW.USUARIO);
END;
$
DELIMITER ;

---REGISTRO DE DATOS---
INSERT INTO ESTADOS VALUES ('','DISPONIBLE'),('','OCUPADO'),('','RESERVADO'),('','ACTIVO'),('','INACTIVO'),('','EN PROCESO'),('','AGOTADO'),('','COMPLETO');


---PONER LA PRIMERA LETRA EN MAYUSCULA (NOMBRE-APELLIDO)---
---SE CREA UNA FUNCION PARA CUMPLIR CON LO ANTERIOR---
DELIMITER $
CREATE FUNCTION initcap(cadena varchar(50)) returns varchar(50)
    BEGIN
    DECLARE len INT;
    DECLARE i INT;
    DECLARE input varchar(45);

    SET len   = CHAR_LENGTH(cadena);
    SET input = LOWER(cadena);
    SET i = 0;

    WHILE (i < len) DO
        IF (MID(input,i,1) = ' ' OR i = 0) THEN
           IF (i < len) THEN
                SET input = CONCAT(LEFT(input,i),UPPER(MID(input,i + 1,1)),RIGHT(input,len - i - 1));
            END IF;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN input;
    END $
	
DELIMITER ;

---GERENTE---
DELIMITER $
CREATE OR REPLACE TRIGGER TG_MAYUS_GERENTE
BEFORE INSERT ON GERENTE
FOR EACH ROW
BEGIN
SET NEW.NOMBRE := INITCAP(NEW.NOMBRE);
SET NEW.APELLIDO := INITCAP(NEW.APELLIDO);
END;
$
DELIMITER ;

INSERT INTO GERENTE VALUES ('','felipe andres','barrero contreras','contrerasF@gmail.com','felipe123');

---EMPLEADO---
DELIMITER $
CREATE OR REPLACE TRIGGER TG_MAYUS_EMPLEADO
BEFORE INSERT ON EMPLEADO
FOR EACH ROW
BEGIN
SET NEW.NOMBRE := INITCAP(NEW.NOMBRE);
SET NEW.APELLIDO := INITCAP(NEW.APELLIDO);
END;
$
DELIMITER ;

---CLIENTE---
DELIMITER $
CREATE OR REPLACE TRIGGER TG_MAYUS_CLIENTE
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
SET NEW.NOMBRE := INITCAP(NEW.NOMBRE);
SET NEW.APELLIDO := INITCAP(NEW.APELLIDO);
END;
$
DELIMITER ;



















select upper(nombre) from gerente;

SELECT  CONCAT(UCASE(SUBSTRING(nombre, 1, 1)), LCASE(SUBSTRING(nombre, 2)))  FROM gerente;
SELECT CONCAT (UCASE (LEFT (nombre, 1)), LCASE (SUBSTRING (nombre, 2))) FROM gerente; 
SELECT CONCAT(UCASE(MID(nombre,1,1)),||' '||,LCASE(MID(nombre,2))) FROM gerente; 
SELECT CONCAT(UCASE(MID(nombre,1,1)),((MID(nombre,2)) AS name FROM gerente; 





---VALIDACION CONTRASEÑA---
DELIMITER $
CREATE OR REPLACE TRIGGER TG_PASSWORD
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN 
IF NEW.PASSWORD > 8 THEN
raise_application_error = (20000,'El password supera su capacidad');
END IF;
END;
$
DELIMITER ;


select count(password) conteo from cliente where id_cliente =

-------------INSERSION EN TABLA ESTADO---------------


INSERT INTO MESA VALUES ('',1,'2');
INSERT INTO CLIENTE VALUES ('','Luis Ernesto','Garzon Garzon','luisgarzon1@hotmail.com','1234567899','',6,'',1);
INSERT INTO EMPLEADO VALUES ('','alexander','vargas','alexander@gmail.com','123456789','','');
INSERT INTO EMPLEADO VALUES ('','carlos andres','solano diaz','gimena@gmail.com','123456789','','');

update empleado set nombre = concat(ucase(left(nombre,1)), lcase(substring(nombre,2)));
--INTENTO DE TRIGGER--
DELIMITER $
CREATE OR REPLACE TRIGGER intento
AFTER INSERT ON mesa
FOR EACH ROW
BEGIN
IF OLD.ID_estados = 1 THEN 
SET NEW.ID_estados = ('DISPONIBLE');
END IF;
END;
$
DELIMITER ;
-------------PRUEBAAAAAAAAAAAAAAAAAA)---------------
INSERT INTO MESA VALUES ('',1,1);,(3,3,1,3),(4,1,1,1);

CREATE TABLE PRUEBA (

SELECT E.NOMBRE ID_ESTADO, M.ID_MESA FROM MESA M JOIN ESTADOS E ON M.ID_MESA= E.ID_ESTADOS WHERE E.ID_ESTADOS=1
);
INSERT INTO PRUEBA (SELECT E.NOMBRE ID_ESTADO, M.ID_MESA FROM MESA M JOIN ESTADOS E ON M.ID_MESA= E.ID_ESTADOS WHERE E.ID_ESTADOS=2);
INSERT INTO MESA VALUES (5,1,1,SELECT E.NOMBRE ID_ESTADO, M.ID_MESA FROM MESA M JOIN ESTADOS E ON M.ID_MESA= E.ID_ESTADOS WHERE E.ID_ESTADOS=3);
-------------CREACIÓN TRIGGER(MOSTRAR DATO)---------------
DELIMITER $
CREATE OR REPLACE TRIGGER TG_DATO_MESA
BEFORE INSERT ON MESA
FOR EACH ROW
WHEN (NEW.ID_ESTADOS = ID_ESTADOS);
BEGIN
SET NEW.ID_ESTADOS := SELECT E.NOMBRE ID_ESTADO, M.ID_MESA FROM MESA M JOIN ESTADOS E ON M.ID_MESA= E.ID_ESTADOS WHERE E.ID_ESTADOS=M.ID_ESTADOS;
END;
$
DELIMITER ;






------------------------------INICIO NUEVA BD------------------------------
---------CREACIÓN DE TABLAS---------

CREATE TABLE MARCA(
ID_MARCA INTEGER AUTO_INCREMENT,
NOMBRE_MARCA VARCHAR(50) NOT NULL,
PRIMARY KEY(ID_MARCA)
);

/*CREATE TABLE EMPLEADO (
ID_EMPLEADO INTEGER AUTO_INCREMENT,
NOMBRE_EMPLEADO VARCHAR(50) NOT NULL,
APELLIDO_EMPLEADO VARCHAR(50) NOT NULL,
CORREO_EMPLEADO VARCHAR(50) NOT NULL,
PASSWORD_EMPLEADO VARCHAR(12) NOT NULL,
PRIMARY KEY(ID_EMPLEADO),
UNIQUE(CORREO_EMPLEADO)
);

CREATE TABLE CLIENTE (
ID_CLIENTE INTEGER AUTO_INCREMENT,
USUARIO_CLIENTE VARCHAR(12) NOT NULL,
NOMBRE_CLIENTE VARCHAR(50) NOT NULL,
APELLIDO_CLIENTE VARCHAR(50) NOT NULL,
FECHA_REGISTRO DATE NOT NULL,
CORREO_CLIENTE VARCHAR(50) NOT NULL,
PASSWORD_CLIENTE VARCHAR(12) NOT NULL,
PRIMARY KEY(ID_CLIENTE),
UNIQUE(USUARIO_CLIENTE),
UNIQUE(CORREO_CLIENTE)
);
*/

CREATE TABLE ROL(
ID_ROL INTEGER AUTO_INCREMENT,
ROL VARCHAR(10),
PRIMARY KEY(ID_ROL)
);

CREATE TABLE USUARIO(
ID_USUARIO INTEGER AUTO_INCREMENT,
CORREO VARCHAR(50),
PASSWORD VARCHAR(50),
ID_ROL INTEGER,
PRIMARY KEY(ID_USUARIO),
UNIQUE(CORREO),
FOREIGN KEY(ID_ROL) REFERENCES ROL(ID_ROL)
);

CREATE TABLE EMPLEADO (
ID_EMPLEADO INTEGER AUTO_INCREMENT,
NOMBRE_EMPLEADO VARCHAR(50) NOT NULL,
APELLIDO_EMPLEADO VARCHAR(50) NOT NULL,
ID_USUARIO INTEGER,
PRIMARY KEY(ID_EMPLEADO),
FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO)
);

CREATE TABLE CLIENTE (
ID_CLIENTE INTEGER AUTO_INCREMENT,
USUARIO_CLIENTE VARCHAR(12) NOT NULL,
NOMBRE_CLIENTE VARCHAR(50) NOT NULL,
APELLIDO_CLIENTE VARCHAR(50) NOT NULL,
ID_USUARIO INTEGER,
PRIMARY KEY(ID_CLIENTE),
UNIQUE(USUARIO_CLIENTE),
FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO)
);

INSERT INTO USUARIO VALUES ('','paulaber@gmail.com','paula1234','2');
INSERT INTO CLIENTE VALUES ('','paula1','paula','bermudez','1');
alter table rol rename ID_ROL INTEGER AUTO_INCREMENT;
INSERT INTO ROL VALUES ('','Empleado'),('','Cliente');
insert into cliente C JOIN USUARIO U ON C.ID_CLIENTE=U.ID_USUARIO (C.USUARIO_CLIENTE, C.NOMBRE_CLIENTE, C.APELLIDO_CLIENTE,U.CORREO, U.PASSWORD) values('paula1','paula','bermudez','paulaber@gmail.com','paula1234');

SELECT C.NOMBRE_CLIENTE,C.USUARIO_CLIENTE, U.PASSWORD FROM CLIENTE C JOIN USUARIO U ON C.ID_CLIENTE=U.ID_USUARIO WHERE C.USUARIO_CLIENTE = USUARIO_CLIENTE AND U.PASSWORD = PASSWORD AND C.ID_USUARIO = U.ID_USUARIO;
INSERT INTO CLIENTE VALUES ('','mariaa1','maria','bermudez', '');


DELIMITER $
CREATE OR REPLACE TRIGGER TG_INSERTAR_IDUSUARIO
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
SET NEW.ID_USUARIO := (SELECT MAX(NEW.ID_USUARIO) FROM USUARIO);
END;
$
DELIMITER ;

CREATE TABLE MESA(
ID_MESA INTEGER AUTO_INCREMENT,
NUMERO_MESA INTEGER NOT NULL,
ESTADO VARCHAR(10),
PRIMARY KEY(ID_MESA),
UNIQUE(NUMERO_MESA)
);

CREATE TABLE PEDIDO(
ID_PEDIDO INTEGER AUTO_INCREMENT,
FECHA_PEDIDO TIMESTAMP NOT NULL,
HORA_INICIO TIME NOT NULL,
HORA_FIN TIME,
COSTO_TOTAL DOUBLE,
ID_CLIENTE INTEGER,
ID_EMPLEADO INTEGER,
ID_MESA INTEGER,
PRIMARY KEY(ID_PEDIDO),
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE),
FOREIGN KEY(ID_EMPLEADO) REFERENCES EMPLEADO(ID_EMPLEADO),
FOREIGN KEY(ID_MESA) REFERENCES MESA(ID_MESA)
);

CREATE TABLE PRODUCTO(
ID_PRODUCTO INTEGER AUTO_INCREMENT,
NOMBRE_PRODUCTO VARCHAR(50) NOT NULL,
PRECIO DECIMAL NOT NULL,
ID_MARCA INTEGER,
PRIMARY KEY(ID_PRODUCTO),
FOREIGN KEY(ID_MARCA) REFERENCES MARCA(ID_MARCA)
);



CREATE TABLE PEDIDO_PRODUCTO(
ID_PEDIDO INTEGER,
ID_PRODUCTO INTEGER,
FOREIGN KEY(ID_PEDIDO) REFERENCES PEDIDO(ID_PEDIDO),
FOREIGN KEY(ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO)
);


---TRIGGERS---
---PONER LA PRIMERA LETRA EN MAYUSCULA (NOMBRE-APELLIDO)---
---SE CREA UNA FUNCION PARA CUMPLIR CON LO ANTERIOR---
DELIMITER $
CREATE FUNCTION initcap(cadena varchar(50)) returns varchar(50)
    BEGIN
    DECLARE len INT;
    DECLARE i INT;
    DECLARE input varchar(45);

    SET len   = CHAR_LENGTH(cadena);
    SET input = LOWER(cadena);
    SET i = 0;

    WHILE (i < len) DO
        IF (MID(input,i,1) = ' ' OR i = 0) THEN
           IF (i < len) THEN
                SET input = CONCAT(LEFT(input,i),UPPER(MID(input,i + 1,1)),RIGHT(input,len - i - 1));
            END IF;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN input;
    END $
	
DELIMITER ;

---TRIGGER: COLOCAR EN MINUSCULA EL CAMPO USUARIO_CLIENTE
DELIMITER $
CREATE OR REPLACE TRIGGER TG_MIN_USUARIO
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
SET NEW.USUARIO_CLIENTE := LOWER(NEW.USUARIO_CLIENTE);
END;
$
DELIMITER ;

---PONER LA FECHA AUTOMÁTICA---
DELIMITER $
CREATE OR REPLACE TRIGGER TG_FECHA_CLIENTE
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
SET NEW.FECHA_REGISTRO := NOW();
end;
$
DELIMITER ;


---PONER HORA INICIO Y FECHA EN PEDIDO---
DELIMITER $
CREATE OR REPLACE TRIGGER TG_HORAFECHA_PEDIDO
BEFORE INSERT ON PEDIDO
FOR EACH ROW
BEGIN
SET NEW.FECHA_PEDIDO := CURRENT_DATE();
SET NEW.HORA_INICIO := CURRENT_TIME();
END;
$
DELIMITER ;

---MAYUSCULAS---
DELIMITER $
CREATE OR REPLACE TRIGGER TG_MAYUS_EMPLEADO
BEFORE INSERT ON EMPLEADO
FOR EACH ROW
BEGIN
SET NEW.NOMBRE_EMPLEADO := INITCAP(NEW.NOMBRE_EMPLEADO);
SET NEW.APELLIDO_EMPLEADO := INITCAP(NEW.APELLIDO_EMPLEADO);
END;
$
DELIMITER ;

DELIMITER $
CREATE OR REPLACE TRIGGER TG_MAYUS_CLIENTE
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
SET NEW.NOMBRE_CLIENTE := INITCAP(NEW.NOMBRE_CLIENTE);
SET NEW.APELLIDO_CLIENTE := INITCAP(NEW.APELLIDO_CLIENTE);
END;
$
DELIMITER ;

---LLENAR CAMPO ESTADO DE LA TABLA MESA DESPUÉS DE MODIFICADO LA HORA_FIN DE LA TABLA PEDIDO---
DELIMITER $
CREATE PROCEDURE PR_ESTADO_MESA()
BEGIN
DECLARE HORA VARCHAR(10);
DECLARE CURSORH CURSOR FOR SELECT HORA_FIN FROM PEDIDO;

OPEN CURSORH;
VUELVA: LOOP
FETCH CURSORH INTO HORA;
IF HORA > 0 THEN
	UPDATE MESA SET ESTADO='ACTIVO' WHERE ID_MESA = ID_MESA;
ELSE 
UPDATE MESA SET ESTADO='INACTIVO' WHERE ID_MESA = ID_MESA;
END IF;
END LOOP VUELVA;
CLOSE CURSORH;
END;	
$
DELIMITER ;

UPDATE MESA M JOIN PEDIDO P ON M.ID_MESA=P.ID_PEDIDO SET M.ESTADO='ACTIVO' WHERE P.HORA_FIN = CURTIME();

---PARA LLAMAR DE MANERA AUTOMÁTICA EL PROCEDIMIENTO PR_ESTADO_MESA ---
set global event_scheduler = on; ---ACTIVAR LA CONSULTA DEL EVENTO
show processlist; ---MIRAR SI ESTÁ ACTIVADO

DELIMITER $
CREATE EVENT EV_ESTADO_MESA
ON SCHEDULE EVERY 5 SECOND 
ON COMPLETION PRESERVE
DO CALL PR_ESTADO_MESA();
$
DELIMITER ;

UPDATE PEDIDO SET HORA_FIN = '' WHERE ID_MESA = 2;
UPDATE PEDIDO SET HORA_FIN = CURTIME() WHERE ID_MESA = 2;

---------INSERCIÓN DE DATOS EN TABLAS---------

INSERT INTO EMPLEADO VALUES ('','luis','garzon','luis@gmail.com','luis123','1');
INSERT INTO CLIENTE VALUES ('','alejo123','alejandro','martinez','','alejandroe@gmail.com','alejo123');

INSERT INTO MESA VALUES ('','1','');
INSERT INTO MESA VALUES ('','2','');

INSERT INTO PEDIDO VALUES ('','','','','','1','1','2');

------------------------------Versión 3-----------------------------------------
CREATE DATABASE PRU_bar;
USE PRU_bar;
DROP DATABASE PRU_BAR

CREATE TABLE CATEGORIA(
ID_CATEGORIA INTEGER AUTO_INCREMENT,
NOMBRE_CATEGORIA VARCHAR(50) NOT NULL, 
PRIMARY KEY(ID_CATEGORIA)
);

CREATE TABLE ESTADO(
ID_ESTADO INTEGER AUTO_INCREMENT,
NOMBRE_ESTADO VARCHAR(12),
PRIMARY KEY(ID_ESTADO)
);

CREATE TABLE ROL(
ID_ROL INTEGER AUTO_INCREMENT,
ROL VARCHAR(10),
PRIMARY KEY(ID_ROL)
);

CREATE TABLE USUARIO(
ID_USUARIO INTEGER AUTO_INCREMENT,
CORREO VARCHAR(50),
PASSWORD VARCHAR(50),
ID_ROL INTEGER,
PRIMARY KEY(ID_USUARIO),
UNIQUE(CORREO),
FOREIGN KEY(ID_ROL) REFERENCES ROL(ID_ROL)
);

CREATE TABLE EMPLEADO (
ID_EMPLEADO INTEGER AUTO_INCREMENT,
NOMBRE_EMPLEADO VARCHAR(50) NOT NULL,
APELLIDO_EMPLEADO VARCHAR(50) NOT NULL,
ID_USUARIO INTEGER,
PRIMARY KEY(ID_EMPLEADO),
FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO)
);

CREATE TABLE CLIENTE (
ID_CLIENTE INTEGER AUTO_INCREMENT,
USUARIO_CLIENTE VARCHAR(12) NOT NULL,
NOMBRE_CLIENTE VARCHAR(50) NOT NULL,
APELLIDO_CLIENTE VARCHAR(50) NOT NULL,
ID_USUARIO INTEGER,
PRIMARY KEY(ID_CLIENTE),
UNIQUE(USUARIO_CLIENTE),
FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO)
);

CREATE TABLE PEDIDO (
ID_PEDIDO INTEGER AUTO_INCREMENT,
FECHA_PEDIDO TIMESTAMP NOT NULL,
HORA_INICIO TIME NOT NULL,
HORA_FIN TIME,
COSTO_TOTAL DOUBLE,
ID_ESTADO INTEGER,
ID_CLIENTE INTEGER,
ID_EMPLEADO INTEGER,
PRIMARY KEY(ID_PEDIDO),
FOREIGN KEY(ID_ESTADO) REFERENCES ESTADO(ID_ESTADO),
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(ID_CLIENTE),
FOREIGN KEY(ID_EMPLEADO) REFERENCES EMPLEADO(ID_EMPLEADO)
);

CREATE TABLE MESA(
ID_MESA INTEGER AUTO_INCREMENT,
NUMERO_MESA INTEGER NOT NULL,
ID_ESTADO INTEGER,
PRIMARY KEY(ID_MESA),
UNIQUE(NUMERO_MESA),
FOREIGN KEY(ID_ESTADO) REFERENCES ESTADO(ID_ESTADO)
);

CREATE TABLE PRODUCTO(
ID_PRODUCTO INTEGER AUTO_INCREMENT,
NOMBRE_PRODUCTO VARCHAR(50) NOT NULL,
PRECIO DECIMAL NOT NULL,
REFERENCIA INTEGER(50) NOT NULL,
CANTIDAD_PRODUCTO INTEGER,
ID_ESTADO INTEGER,
ID_CATEGORIA INTEGER,
PRIMARY KEY(ID_PRODUCTO),
FOREIGN KEY(ID_ESTADO) REFERENCES ESTADO(ID_ESTADO),
FOREIGN KEY(ID_CATEGORIA) REFERENCES CATEGORIA(ID_CATEGORIA)
);

CREATE TABLE PEDIDO_PRODUCTO(
ID_PEDIDO INTEGER,
ID_PRODUCTO INTEGER,
CANTIDAD_PED_PROD VARCHAR(25),
FOREIGN KEY(ID_PEDIDO) REFERENCES PEDIDO(ID_PEDIDO),
FOREIGN KEY(ID_PRODUCTO) REFERENCES PRODUCTO(ID_PRODUCTO)
);

-------------
INSERT INTO USUARIO VALUES ('','paulaber@gmail.com','paula1234','1');
INSERT INTO CLIENTE VALUES ('','paula1','paula','bermudez','1');
alter table rol rename ID_ROL INTEGER AUTO_INCREMENT;
INSERT INTO ROL VALUES ('','Empleado'),('','Cliente');
insert into cliente C JOIN USUARIO U ON C.ID_CLIENTE=U.ID_USUARIO (C.USUARIO_CLIENTE, C.NOMBRE_CLIENTE, C.APELLIDO_CLIENTE,U.CORREO, U.PASSWORD) values('paula1','paula','bermudez','paulaber@gmail.com','paula1234');

SELECT C.NOMBRE_CLIENTE,C.USUARIO_CLIENTE, U.PASSWORD, C.ID_USUARIO, U.ID_USUARIO FROM CLIENTE C JOIN USUARIO U ON C.ID_USUARIO=U.ID_USUARIO WHERE C.USUARIO_CLIENTE = c.USUARIO_CLIENTE AND U.PASSWORD = u.PASSWORD;

INSERT INTO CLIENTE VALUES ('','mariaa1','maria','bermudez', 1);

SELECT C.NOMBRE_CLIENTE,C.USUARIO_CLIENTE, U.PASSWORD, C.ID_USUARIO, U.ID_USUARIO FROM CLIENTE C JOIN USUARIO U ON C.ID_USUARIO=U.ID_USUARIO WHERE U.ID_USUARIO = C.ID_USUARIO;

SELECT E.NOMBRE_EMPLEADO, U.PASSWORD, E.ID_USUARIO, U.ID_USUARIO FROM EMPLEADO E JOIN USUARIO U ON E.ID_USUARIO=U.ID_USUARIO WHERE U.ID_USUARIO = E.ID_USUARIO OR U.ID_ROL = 1;



SELECT C.USUARIO_CLIENTE, U.PASSWORD FROM CLIENTE C JOIN USUARIO U ON C.ID_USUARIO=U.ID_USUARIO WHERE C.USUARIO_CLIENTE = c.USUARIO_CLIENTE AND U.PASSWORD = u.PASSWORD AND C.ID_USUARIO=U.ID_USUARIO;



DELIMITER $
CREATE OR REPLACE TRIGGER TG_INSERTAR_IDUSUARIO
BEFORE INSERT ON CLIENTE
FOR EACH ROW
BEGIN
SET NEW.ID_USUARIO := (SELECT MAX(NEW.ID_USUARIO) FROM USUARIO);
END;
$
DELIMITER ;


DROP EVENT EV_IDU2;
DROP PROCEDURE PR_IDU;
SELECT MAX(ID_USUARIO) ULTIMO FROM USUARIO;
SELECT * FROM USUARIO GROUP`MAX(ID_USUARIO);

INSERT INTO USUARIO VALUES ('','','vacio','1');
INSERT INTO USUARIO VALUES ('','funciona@gmail.com','porfavor','2');

UPDATE CLIENTE C JOIN USUARIO U ON C.ID_CLIENTE=U.ID_USUARIO  SET C.ID_USUARIO= (max(u.ID_USUARIO)) WHERE C.ID_USUARIO = 1;

INSERT INTO USUARIO values ('','empleado@empleado.com','empleado','1');
INSERT INTO empleado VALUES ('','empleado','empleado','1');


DELIMITER $
CREATE PROCEDURE PR_ID_USUARIO()
BEGIN
DECLARE USUARIO INTEGER;
	SET USUARIO = (SELECT MAX(ID_USUARIO) FROM USUARIO);
	
	UPDATE CLIENTE SET ID_USUARIO=USUARIO WHERE ID_USUARIO=1;
	UPDATE EMPLEADO SET ID_USUARIO=USUARIO WHERE ID_USUARIO=1;
END;	
$
DELIMITER ;

DELIMITER $
CREATE EVENT EV_ID_USUARIO
ON SCHEDULE EVERY 5 SECOND 
ON COMPLETION PRESERVE
DO CALL PR_ID_USUARIO();
$
DELIMITER ;



---------------------PARA TENER EN CUENTAAAAAAAAA: PRIMERO SE EJECUTA EL PROCEDIMIENTO, LUEGO EL EVENTO Y DE ULTIMA SE ENCIEDE EL EVENTO.
set global event_scheduler = on;-----------------


--------Version Sustentacion-------
insert into estado values ('','Activo');
insert into estado values ('','Inactivo');
insert into estado values ('','Reservado');
insert into pedido values ('','', '15:00','13:00',4545,'1',1,1);
insert into pedido values ('','', '18:00','20:00',10002200,'3',1,1);
insert into pedido values ('','', '20:00','22:00',5610,'2',1,1);

insert into pedido values ('','', '20:00','22:00',5610,'2',1,2);
insert into pedido values ('','', '20:00','22:00',5610,'2',1,3);
insert into pedido values ('','', '20:00','22:00',5610,'2',12,3);
insert into pedido values ('','', '20:00','22:00',5610,'2',11,3);

INSERT INTO EMPLEADO VALUES ('','samuel','diaz villanueva','1');
INSERT INTO USUARIO VALUES ('','samuel@gmail.com','samuel','1');

SELECT EM.ID_USUARIO, U.ID_USUARIO, U.PASSWORD, U.CORREO
FROM EMPLEADO EM
INNER JOIN USUARIO U ON U.ID_USUARIO=EM.ID_USUARIO
WHERE U.CORREO = U.CORREO AND U.PASSWORD = U.PASSWORD;

SELECT U.PASSWORD, U.CORREO, EM.ID_USUARIO, U.ID_USUARIO, em.id_empleado FROM EMPLEADO EM INNER JOIN USUARIO U ON U.ID_USUARIO=EM.ID_USUARIO WHERE U.PASSWORD = U.PASSWORD AND EM.ID_USUARIO = U.ID_USUARIO;


SELECT C.USUARIO_CLIENTE, U.PASSWORD FROM CLIENTE C JOIN USUARIO U ON U.ID_USUARIO=C.ID_USUARIO WHERE C.USUARIO_CLIENTE = c.USUARIO_CLIENTE AND U.PASSWORD = u.PASSWORD AND C.ID_USUARIO=U.ID_USUARIO;



CREATE VIEW PRUEBA AS
SELECT P.HORA_INICIO AS 'HORA INICIO', P.HORA_FIN AS 'HORA FIN', P.COSTO_TOTAL AS 'COSTO TOTAL', ES.NOMBRE_ESTADO AS ESTADO, CONCAT(C.NOMBRE_CLIENTE,' ',C.APELLIDO_CLIENTE) AS 'CLIENTE', CONCAT(EM.NOMBRE_EMPLEADO,' ',EM.APELLIDO_EMPLEADO) AS 'EMPLEADO'
FROM PEDIDO P
INNER JOIN ESTADO ES ON ES.ID_ESTADO=P.ID_ESTADO
INNER JOIN CLIENTE C ON C.ID_CLIENTE=P.ID_CLIENTE
INNER JOIN EMPLEADO EM ON EM.ID_EMPLEADO=P.ID_EMPLEADO
INNER JOIN USUARIO U ON U.ID_USUARIO=EM.ID_USUARIO
WHERE U.CORREO = U.CORREO
GROUP BY P.ID_PEDIDO;


SELECT P.HORA_INICIO, P.HORA_FIN , P.COSTO_TOTAL, ES.NOMBRE_ESTADO, P.ID_CLIENTE, P.ID_EMPLEADO FROM PEDIDO P INNER JOIN ESTADO ES ON ES.ID_ESTADO=P.ID_ESTADO;

INSERT INTO CATEGORIA VALUES ('','Cerveza');
INSERT INTO CATEGORIA VALUES ('','Cerveza Artesanal');
INSERT INTO CATEGORIA VALUES ('','Ron');
INSERT INTO CATEGORIA VALUES ('','Whisky');
INSERT INTO CATEGORIA VALUES ('','Aguardiente');

INSERT INTO PODUCTO VALUES ('','Antioqueño','48000','112134465782',10,'1','5');
INSERT INTO PRODUCTO VALUES ('','BBC Macondo','60000','121232445563',10,'2','2');
INSERT INTO PRODUCTO VALUES ('','Monserrate Roja BBC','50000','1213231113',0,'1','2');
INSERT INTO PRODUCTO VALUES ('','Havana Club','80000','1221313431215',10,'1','3');
INSERT INTO PRODUCTO VALUES ('','Poker','30000','12125642261213',0,'2','1');

INSERT INTO PEDIDO_PRODUCTO VALUES (1,1,'2 litros');
INSERT INTO PEDIDO_PRODUCTO VALUES (1,2,'1/2 litros');
INSERT INTO PEDIDO_PRODUCTO VALUES (2,3,'3/4 litros');
INSERT INTO PEDIDO_PRODUCTO VALUES (2,3,'2 litros');
INSERT INTO PEDIDO_PRODUCTO VALUES (3,4,'1 litro');
INSERT INTO PEDIDO_PRODUCTO VALUES (8,4,'2 litros');
INSERT INTO PEDIDO_PRODUCTO VALUES (8,5,'2 litros');
INSERT INTO PEDIDO_PRODUCTO VALUES (9,4,'1 litro');


CREATE VIEW LISTA_PEDIDOS AS
SELECT PE.ID_PEDIDO AS 'NUMERO PEDIDO', count(PR.NOMBRE_PRODUCTO) AS 'CANTIDAD DE PRODUCTOS', CONCAT(C.NOMBRE_CLIENTE,' ', C.APELLIDO_CLIENTE) AS CLIENTE FROM PEDIDO_PRODUCTO PP INNER JOIN PEDIDO PE ON PE.ID_PEDIDO=PP.ID_PEDIDO INNER JOIN PRODUCTO PR ON PR.ID_PRODUCTO=PP.ID_PRODUCTO INNER JOIN CLIENTE C ON C.ID_CLIENTE=PE.ID_CLIENTE group by PP.ID_PEDIDO;


SELECT PR.NOMBRE_PRODUCTO as productos FROM PEDIDO_PRODUCTO PP INNER JOIN PEDIDO PE ON PE.ID_PEDIDO=PP.ID_PEDIDO INNER JOIN PRODUCTO PR ON PR.ID_PRODUCTO=PP.ID_PRODUCTO WHERE PE.ID_PEDIDO = PE.ID_PEDIDO;

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE DATABASE PRU_bar;
USE PRU_bar;

create table categoria(
id_categoria integer auto_increment,
nombre_categoria varchar(50) not null, 
primary key(id_categoria),
UNIQUE(nombre_categoria)
);

create table estado(
id_estado integer auto_increment,
nombre_estado varchar(12),
primary key(id_estado)
);

create table rol(
id_rol integer auto_increment,
rol varchar(25),
primary key(id_rol)
);

create table mesa(
numero_mesa integer not null,
capacidad varchar(30) not null,
id_estado integer,
primary key(numero_mesa),
foreign key(id_estado) references estado(id_estado)
);

create table usuario(
id_usuario integer auto_increment,
correo varchar(50),
password varchar(15),
id_rol integer,
primary key(id_usuario),
unique(correo),
foreign key(id_rol) references rol(id_rol)
);

create table empleado (
id_empleado integer auto_increment,
nombre_empleado varchar(50) not null,
apellido_empleado varchar(50) not null,
id_usuario integer,
primary key(id_empleado),
foreign key(id_usuario) references usuario(id_usuario),
UNIQUE(id_usuario)
);

create table cliente (
id_cliente integer auto_increment,
nombre_cliente varchar(50) not null,
apellido_cliente varchar(50) not null,
id_usuario integer,
primary key(id_cliente),
foreign key(id_usuario) references usuario(id_usuario),
UNIQUE(id_usuario)
);

create table pedido(
id_pedido integer auto_increment,
fecha_ingreso timestamp not null,
costo_total double,
id_estado integer,
id_cliente integer,
id_empleado integer,
numero_mesa integer,
primary key(id_pedido),
foreign key(id_estado) references estado(id_estado),
foreign key(id_cliente) references cliente(id_cliente),
foreign key(id_empleado) references empleado(id_empleado),
foreign key(numero_mesa) references mesa(numero_mesa)
);

create table producto(
id_producto integer auto_increment,
nombre_producto varchar(50) not null,
foto longblob,
precio_unidad double not null,
descripcion varchar(200) not null,
stock integer,
id_estado integer,
id_categoria integer,
primary key(id_producto),
foreign key(id_estado) references estado(id_estado),
foreign key(id_categoria) references categoria(id_categoria)
);

CREATE TABLE detalle_compras (
id_detalle int(10) auto_increment,
id_producto int(11)  NOT NULL,
id_pedido int(11)  NOT NULL,
cantidad int(11)  not NULL,
primary key(id_detalle),
foreign key(id_pedido) references pedido(id_pedido),
foreign key(id_producto) references producto(id_producto)
);


DELIMITER $
CREATE FUNCTION initcap(cadena varchar(50)) returns varchar(50)
    BEGIN
    DECLARE len INT;
    DECLARE i INT;
    DECLARE input varchar(45);

    SET len   = CHAR_LENGTH(cadena);
    SET input = LOWER(cadena);
    SET i = 0;

    WHILE (i < len) DO
        IF (MID(input,i,1) = ' ' OR i = 0) THEN
           IF (i < len) THEN
                SET input = CONCAT(LEFT(input,i),UPPER(MID(input,i + 1,1)),RIGHT(input,len - i - 1));
            END IF;
        END IF;
        SET i = i + 1;
    END WHILE;

    RETURN input;
    END $
	
DELIMITER ;

---MAYUSCULAS---
DELIMITER $
CREATE OR REPLACE TRIGGER tg_mayus_empleado
BEFORE INSERT ON empleado
FOR EACH ROW
BEGIN
SET NEW.nombre_empleado := INITCAP(NEW.nombre_empleado);
SET NEW.apellido_empleado := INITCAP(NEW.apellido_empleado);
END;
$
DELIMITER ;

DELIMITER $
CREATE OR REPLACE TRIGGER tg_mayus_cliente
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN
SET NEW.nombre_cliente := INITCAP(NEW.nombre_cliente);
SET NEW.apellido_cliente := INITCAP(NEW.apellido_cliente);
END;
$
DELIMITER ;

DELIMITER $
CREATE OR REPLACE TRIGGER tg_mayus_categoria
BEFORE INSERT ON categoria
FOR EACH ROW
BEGIN
SET NEW.nombre_categoria := INITCAP(NEW.nombre_categoria);
END;
$
DELIMITER ;

DELIMITER $
CREATE OR REPLACE TRIGGER tg_mayus_producto
BEFORE INSERT ON producto
FOR EACH ROW
BEGIN
SET NEW.nombre_producto := INITCAP(NEW.nombre_producto);
END;
$
DELIMITER ;

---TRIGGER: PARA PONER LA FECHA EN LA ACTUAL
DELIMITER $
CREATE OR REPLACE TRIGGER tg_fecha_pedido
BEFORE INSERT ON pedido
FOR EACH ROW
BEGIN
SET NEW.fecha_ingreso := now();
END;
$
DELIMITER ;


---TRIGGER PARA QUITAR ESPACIOS DE LOS LADOS.
DELIMITER $
CREATE OR REPLACE TRIGGER tg_drop_categorias
BEFORE INSERT ON categoria
FOR EACH ROW
BEGIN
SET NEW.nombre_categoria := TRIM(NEW.nombre_categoria);
END;
$
DELIMITER ;

DELIMITER $
CREATE OR REPLACE TRIGGER tg_drop_productos
BEFORE INSERT ON producto
FOR EACH ROW
BEGIN
SET NEW.nombre_producto := trim(NEW.nombre_producto);
END;
$
DELIMITER ;

---CONVIERTE EL CAMPO ESTADO DEPENDIENDO DE LO QUE HAYA EN EL CAMPO STOCK DE LA TABLA PRODUCTO
DELIMITER $
CREATE OR REPLACE TRIGGER tg_estado_productos
BEFORE INSERT ON producto
FOR EACH ROW
BEGIN
	IF (NEW.stock < 1)  THEN 
		SET NEW.id_estado=2;
	END IF; 
	IF (NEW.stock > 0) THEN
	set NEW.id_estado=1;
	END IF;
END;
$
DELIMITER ;


---SE CREA UN PROCEDIMIENTO PARA AGREGAR EL ID_USUARIO DE MANERA AUTOMATICA A LA TABLA CLIENTE---
---EN LA VARIABLE USUARIO SE INTRODUCE UNA CONSULTA SELECT PARA SELECCIONAR EL ÚLTIMO(MAX) ID_USUARIO INGRESADO DE LA TABLA USUARIO---
---LUEGO SE CREAN DOS UPDATE PARA ACTUALIZAR LAS TABLAS CLIENTE Y EMPLEADO INTRODUCIENDO LA VARIABLE USUARIO EN EL CAMPO ID_USUARIO CON UNA CONDICION (WHERE) 1. ESTO QUIERE DECIR QUE MIENTRAS EL ID_USUARIO SEA 1 EL UPDATE VA A FUNCIONAR (INSERTAR LA CONSULTA EN EL CAMPO).---


DELIMITER $
CREATE PROCEDURE pr_id_usuario()
BEGIN
DECLARE usuario INTEGER;
DECLARE rol INTEGER;
DECLARE idC INTEGER;
DECLARE idE INTEGER;
DECLARE error integer;
	SET usuario = (SELECT MAX(id_usuario) FROM usuario);
	SET rol = (SELECT MAX(id_rol) FROM usuario);
	SET idC = (SELECT MAX(id_cliente) FROM cliente);
	SET idE = (SELECT MAX(id_empleado) FROM empleado);
	
		UPDATE cliente SET id_usuario=usuario WHERE isnull(id_usuario);
		UPDATE empleado SET id_usuario=usuario WHERE isnull(id_usuario);
END;	
$
DELIMITER ;

UPDATE cliente c, usuario u SET c.id_usuario=6 WHERE c.id_cliente=12; AND C.ID_USUARIO=NULL;


---LUEGO SE CREA UN EVENTO PARA EJECUTAR EL PROCEDIMIENTO DESPUÉS DE 5 SEGUNDOS DE HABER CREADO EL EVENTO (DE MANERA AUTOMÁTICA)---

DELIMITER $
CREATE event ev_id_usuario
ON SCHEDULE EVERY 2 SECOND 
ON COMPLETION PRESERVE
DO CALL pr_id_usuario();
$
DELIMITER ;

---!!!!!!!!IMPORTATE!!!!!!!!---
---PARA QUE FUNCIONE EL EVENT SE DEBE EJECUTAR EL SIGUIENTE COMANDO--
set global event_scheduler = on;

DELIMITER $
CREATE OR REPLACE TRIGGER tg_idUsuario_cliente
AFTER INSERT ON CLIENTE
FOR EACH ROW
BEGIN
	UPDATE CLIENTE SET NEW.ID_USUARIO = NEW.ID_USUARIO;
END;
$
DELIMITER ;

--Administrador--
INSERT INTO usuario VALUES ('','administrador@gmail.com','adm1',1);
INSERT INTO empleado VALUES ('','Felipe','Botero',1);

--Cliente--
INSERT INTO usuario VALUES ('','mariaplml190@gmail.com','mp123',2);
INSERT INTO cliente VALUES ('','maria','Bermudez',NULL);

--EMPLEADO--
INSERT INTO usuario VALUES ('','sararodriguez@gmail.com','sara1',3);
INSERT INTO empleado VALUES ('','Sara','Rodriguez',NULL);

--ACTUALIZACIÓN--
UPDATE EMPLEADO SET ID_USUARIO = 1 WHERE ID_EMPLEADO = 1;

UPDATE EMPLEADO SET ID_USUARIO = 3 WHERE ID_EMPLEADO IS NULL;
UPDATE EMPLEADO SET ID_USUARIO = 5 WHERE ID_EMPLEADO = 3;
UPDATE cliente SET ID_USUARIO = 2 WHERE ID_cliente = 1;


----REGISTROS----
INSERT INTO categoria VALUES ('','cerveza'),('','cerveza artesanal');
INSERT INTO categoria VALUES ('',' cervezaartesanal ');

--
INSERT INTO estado VALUES ('','Activo'),('','Inactivo'),('','Resevado');

--
INSERT INTO rol values ('','Administrador'),('','Cliente'),('','Mesero');





------------------------------------------------
INSERT INTO mesa VALUES (1,'4 personas','2'),(2,'2 personas','2'),(3,'8 personas','3');


INSERT INTO PRODUCTO VALUES ('','poker','',2500,'Poker 1.5',0,3,1);


INSERT INTO PRODUCTO VALUES ('','poker','',2500,'Poker 1.5',0,'',1);

INSERT INTO usuario VALUES ('','cabrera@gmail.com','diaz123','2');
INSERT INTO cliente VALUES ('','juan','cabrera',NULL);

INSERT INTO usuario VALUES ('','ruiz@gmail.com','diaz123','2');
INSERT INTO cliente VALUES ('','alejandro','ruiz',null);

INSERT INTO usuario VALUES ('','diazdavid@gmail.com','diaz123','2');
INSERT INTO cliente VALUES ('','david','diaz',NULL);

INSERT INTO usuario VALUES ('','josue@gmail.com','jos1',3);
INSERT INTO empleado VALUES ('','josue','alaniz',NULL);

INSERT INTO usuario VALUES ('','pedro@gmail.com','pedro1',3);
INSERT INTO empleado VALUES ('','pedro','castillo',NULL);

INSERT INTO usuario VALUES ('','veronica@gmail.com','vero1',3);
INSERT INTO empleado VALUES ('','veronica','gomez',NULL);

INSERT INTO usuario VALUES ('','alejandra@gmail.com','vero1',3);
INSERT INTO empleado VALUES ('','alejandra','gomez',NULL);

INSERT INTO usuario VALUES ('','sofia@gmail.com','sofi1',3);
INSERT INTO empleado VALUES ('','sofia','castillo',NULL);

INSERT INTO usuario VALUES ('','josue@gmail.com','jos1',3);
INSERT INTO empleado VALUES ('','josue','alaniz',NULL);


DELETE FROM CLIENTE WHERE Id_usuario is null;
DELETE FROM empleado WHERE Id_usuario is null;

update empleado set id_usuario = 2 where id_empleado= 2;
update empleado set id_usuario = 4 where id_empleado= 3;

update cliente set id_usuario = 3 where id_cliente = 1;

INSERT INTO usuario VALUES ('','samuel@gmail.com','samu1',3);
INSERT INTO empleado VALUES ('','samuel','carvajal',null);

INSERT INTO usuario VALUES ('','andres@gmail.com','an23',2);
INSERT INTO cliente VALUES ('','andres','camacho',null);

INSERT INTO usuario VALUES ('','charlie@gmail.com','jos1',3);
INSERT INTO empleado VALUES ('','charlie','rodd',null);

INSERT INTO usuario VALUES ('','bmiles@gmail.com','diaz123',2);
INSERT INTO cliente VALUES ('','brayan','miles',null);
--
INSERT INTO pedido VALUES ('','',,1,1,2),('','',85004,2,2,2),('','',,3,3,2);

------------------------------------------------

SELECT CORREO, PASSWORD FROM USUARIO WHERE CORREO = CORREO AND PASSWORD = PASSWORD AND ID_ROL=1;

UPDATE EMPLEADO E INNER JOIN USUARIO U ON U.ID_USUARIO=E.ID_USUARIO SET E.NOMBRE_EMPLEADO='jose' WHERE u.id_usuario=4



TRUNCATE cliente;
TRUNCATE empleado;
TRUNCATE usuario;

ALTER TABLE cliente AUTO_INCREMENT = 1;
ALTER TABLE empleado AUTO_INCREMENT = 1;
ALTER TABLE usuario AUTO_INCREMENT = 1;

TRUNCATE pedido;

ALTER TABLE pedido AUTO_INCREMENT = 1;



INSERT INTO categoria VALUES ('','cerveza'),('','cerveza artesanal'),('','Aguardiente'),('','Whisky');

INSERT INTO producto VALUES ('','poker','',2500,'Poker 1.5 litro',25,'',1);
INSERT INTO producto VALUES ('','Aguila','',2900,'1.5 litros',0,'',1);
INSERT INTO producto VALUES ('','Antioqueño','',20000,'1/2 litro',5,'',3);
INSERT INTO producto VALUES ('','Nectar','',25000,'1 litro',15,'',3);
INSERT INTO producto VALUES ('','Johnnie Walker','',30000,'1 litro',10,'',4);
INSERT INTO producto VALUES ('','Jack Daniel´s','',45000,'1 litro',15,'',4);


INSERT INTO pedido VALUES ('','',14000,1,2,2,1),('','',100000,1,3,3,3),('','',50000,1,1,2,1),('','',15000,1,4,3,2);


INSERT INTO producto VALUES ('','poker','',2500,'Poker 1.5 litro',25,'',1);
INSERT INTO producto VALUES ('','Aguila','',2900,'1.5 litros',0,'',1);
INSERT INTO producto VALUES ('','Antioqueño','',20000,'1/2 litro',5,'',3);
INSERT INTO producto VALUES ('','Nectar','',25000,'1 litro',15,'',3);
INSERT INTO producto VALUES ('','Johnnie Walker','',30000,'1 litro',10,'',4);
INSERT INTO producto VALUES ('','Jack Daniel´s','',45000,'1 litro',15,'',4);


INSERT INTO pedido VALUES ('','',14000,1,2,2,1),('','',100000,1,3,3,3),('','',50000,1,1,2,1),('','',15000,1,4,3,2);


INSERT INTO detalle_compras VALUES ('',1,3,1),('',2,3,3),('',3,4,4),('',4,4,2);

CREATE VIEW vw_detalle_pedido () as
select  dt.id_pedido, concat(cl.nombre_cliente, ' ', cl.apellido_cliente),pr.nombre_producto,dt.cantidad, pr.descripcion, pd.costo_total 
from detalle_compras dt
inner join producto pr on pr.id_producto=dt.id_producto
inner join pedido pd on pd.id_pedido=dt.id_pedido
inner join cliente cl on cl.id_cliente=pd.id_cliente;


CREATE VIEW vw_pedido_fila (NumeroPedido,cliente,cantidad) 
as
select dt.id_pedido as NumeroPedido, concat(cl.nombre_cliente, ' ', cl.apellido_cliente) as cliente, sum(dt.cantidad) as cantidad
from detalle_compras dt
inner join pedido pd on pd.id_pedido=dt.id_pedido
inner join cliente cl on cl.id_cliente=pd.id_cliente
group by dt.id_pedido;

CREATE VIEW vw_detalle_pedido as
select dt.id_pedido as NumeroPedido, concat(cl.nombre_cliente, ' ', cl.apellido_cliente) as cliente, pr.nombre_producto as producto, dt.cantidad as cantidad, pd.numero_mesa as numeroMesa
from detalle_compras dt
inner join producto pr on pr.id_producto=dt.id_producto
inner join pedido pd on pd.id_pedido=dt.id_pedido
inner join cliente cl on cl.id_cliente=pd.id_cliente where dt.id_pedido=3;
inner;

select * from vw_detalle_pedido 
where dt.id_pedido = 2;

drop view vw_detalle_pedido inner join ;



SELECT em.nombre_empleado, em.apellido_empleado, u.correo, u.password
FROM empleado em
INNER JOIN usuario u on u.id_usuario=em.id_usuario
WHERE u.correo = 'sararodriguez@gmail.com';



 SELECT em.nombre_empleado, em.apellido_empleado, u.correo FROM empleado em INNER JOIN usuario u WHERE u.correo =

update empleado em, usuario u set em.nombre_empleado = 'Sara', em.apellido_empleado = 'Rodri', u.correo = 'sararodriguez@gmail.com', u.password = '1234' where em.id_empleado = 2 and u.id_usuario=3;

 <%
                                            
                                            UsuarioEmpC user = new UsuarioEmpC();
                                            List<infoEmpleado>list=emp.listar();
                                            List<infoUsuario>listU=user.listar();
                                            Iterator<infoEmpleado>iter=list.iterator();
                                            Iterator<infoUsuario>iterU=listU.iterator();
                                            infoEmpleado inf=null;
                                            infoUsuario infU=null;
                                            
                                            while(iter.hasNext() && iterU.hasNext()){
                                                inf=iter.next();
                                                infU=iterU.next();
                                        %>

<input class="btn btn-primary" type="submit" name="accion" value="Guardar Cambios" href="ControladorEmp?accion=cambios">


----pedido realizado
CREATE VIEW vw_pedido_realizado as
select pe.id_pedido, pe.fecha_ingreso as fecha, pe.costo_total, concat(c.nombre_cliente, ' ', c.apellido_cliente) as cliente, pe.numero_mesa, u.correo, pe.id_estado from pedido pe inner join empleado em on em.id_empleado=pe.id_empleado inner join usuario u on u.id_usuario=em.id_usuario inner join cliente c on c.id_cliente=pe.id_cliente 
where pe.id_empleado = em.id_empleado and pe.id_estado=2;

drop view vw_pedido_realizado;


--- Modal
select id_pedido as NumeroPedido, fecha_ingreso as fecha, costo_total, concat(c.nombre_cliente, ' ', c.apellido_cliente) as cliente, numero_mesa from pedido pe inner join empleado em on em.id_empleado =pe.id_empleado inner join cliente c on c.id_cliente=pe.id_cliente inner join usuario u on u.id_usuario=em.id_usuario where u.correo = 'sofia@gmail.com'

--- Pedidos
select dt.id_pedido as NumeroPedido, concat(cl.nombre_cliente, ' ', cl.apellido_cliente) as cliente, sum(dt.cantidad) as cantidad from detalle_compras dt inner join pedido pd on pd.id_pedido=dt.id_pedido inner join cliente cl on cl.id_cliente=pd.id_cliente where pd.id_estado = 1 group by dt.id_pedido;


insert into detalle_compras values ('',4,1,1);
insert into detalle_compras values ('',5,1,1);
insert into detalle_compras values ('',1,2,2);
insert into detalle_compras values ('',2,2,1);


CREATE VIEW vw_pedidos_activos AS
SELECT dt.id_pedido AS NumeroPedido, CONCAT(cl.nombre_cliente, ' ', cl.apellido_cliente) AS cliente, SUM(dt.cantidad) AS cantidad from detalle_compras dt INNER JOIN pedido pd ON pd.id_pedido=dt.id_pedido INNER JOIN cliente cl ON cl.id_cliente=pd.id_cliente WHERE pd.id_estado = 1 group by dt.id_pedido;

----Actualizar campos estado y empleado de la tabla pedido----
update pedido set id_estado = 2, id_empleado = 0 where id_pedido = 3;

select id_empleado from empleado em inner join usuario us on us.id_usuario=em.id_usuario where correo = 'sofia@gmail.com';


----Gráfica----
select




















