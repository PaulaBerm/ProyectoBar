CREATE DATABASE DBbar;
USE DBbar;

------------------------------INICIO NUEVA BD------------------------------
---------CREACIÓN DE TABLAS---------

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
	SET usuario = (SELECT MAX(id_usuario) FROM usuario);
	
		UPDATE cliente SET id_usuario=usuario WHERE isnull(id_usuario);
		UPDATE empleado SET id_usuario=usuario WHERE isnull(id_usuario);
END;	
$
DELIMITER ;

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


---------------REGISTROOOOOOOOOOO-----------
INSERT INTO estado VALUES ('','Activo'),('','Inactivo'),('','Resevado');

--
INSERT INTO rol values ('','Administrador'),('','Cliente'),('','Mesero');


-----SIEMPRE SE DEBE REGISTRAR PRIMERO EN USUARIO Y LUEGO EN LA OTRA TABLA-----
-------SE DEBE REGISTRAR UNO POR UNO, PRIMERO EL DE LA TABLA USUARIO Y LUEGO TABLA CLIENTE/EMPLEADO----
--Administrador--
INSERT INTO usuario VALUES ('','administrador@gmail.com','adm1',1);
INSERT INTO empleado VALUES ('','Felipe','Botero',1);

--Cliente--
INSERT INTO usuario VALUES ('','mariaplml190@gmail.com','mp123',2);
INSERT INTO cliente VALUES ('','maria','Bermudez',NULL);

--EMPLEADO--
INSERT INTO usuario VALUES ('','sararodriguez@gmail.com','sara1',3);
INSERT INTO empleado VALUES ('','Sara','Rodriguez',NULL);