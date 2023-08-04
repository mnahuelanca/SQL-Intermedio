CREATE DATABASE JUGOS_VENTAS;

USE JUGOS_VENTAS;

DROP TABLE IF EXISTS ITEMS_FACTURAS;
DROP TABLE IF EXISTS FACTURAS;
DROP TABLE IF EXISTS TABLA_DE_CLIENTES;
DROP TABLE IF EXISTS TABLA_DE_PRODUCTOS;
DROP TABLE IF EXISTS TABLA_DE_VENDEDORES;

CREATE TABLE TABLA_DE_CLIENTES(
	DNI varchar(11) NOT NULL,
	NOMBRE varchar(100) NULL,
	DIRECCION_1 varchar(150) NULL,
	DIRECCION_2 varchar(150) NULL,
	BARRIO varchar(50) NULL,
	CIUDAD varchar(50) NULL,
	ESTADO varchar(2) NULL,
	CP varchar(8) NULL,
	FECHA_DE_NACIMIENTO date NULL,
	EDAD smallint NULL,
	SEXO varchar(1) NULL,
	LIMITE_DE_CREDITO float NULL,
	VOLUMEN_DE_COMPRA float NULL,
	PRIMERA_COMPRA bit NULL,
	PRIMARY KEY (DNI));
	
CREATE TABLE TABLA_DE_PRODUCTOS(
	CODIGO_DEL_PRODUCTO varchar(10) NOT NULL,
	NOMBRE_DEL_PRODUCTO varchar(50) NULL,	
	TAMANO varchar(10) NULL,
	SABOR varchar(20) NULL,
        ENVASE varchar(20) NULL,
	PRECIO_DE_LISTA float NOT NULL,
    PRIMARY KEY(CODIGO_DEL_PRODUCTO));
	
CREATE TABLE TABLA_DE_VENDEDORES(
	MATRICULA varchar(5) NOT NULL,
	NOMBRE varchar(100) NULL,
	PORCENTAJE_COMISION float NULL,
	FECHA_ADMISION date NULL,
	VACACIONES bit NULL,
	BARRIO varchar(50) NULL,
 PRIMARY KEY(MATRICULA));
 
 CREATE TABLE FACTURAS(
	DNI varchar(11) NOT NULL,
	MATRICULA varchar(5) NOT NULL,
	FECHA_VENTA date NULL,
	NUMERO int NOT NULL,
	IMPUESTO float NOT NULL,
    PRIMARY KEY (NUMERO),
	FOREIGN KEY (MATRICULA) REFERENCES TABLA_DE_VENDEDORES(MATRICULA),
	FOREIGN KEY (DNI) REFERENCES TABLA_DE_CLIENTES(DNI));

CREATE TABLE ITEMS_FACTURAS(
	NUMERO int NOT NULL,
	CODIGO_DEL_PRODUCTO varchar(10) NOT NULL,
	CANTIDAD int NOT NULL,
	PRECIO float NOT NULL,
	PRIMARY KEY (NUMERO, CODIGO_DEL_PRODUCTO),
	FOREIGN KEY (CODIGO_DEL_PRODUCTO) REFERENCES TABLA_DE_PRODUCTOS (CODIGO_DEL_PRODUCTO),
	FOREIGN KEY (NUMERO) REFERENCES FACTURAS (NUMERO));