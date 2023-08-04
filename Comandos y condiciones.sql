use jugos_ventas;

#Usando comando LIKE.
SELECT * FROM tabla_de_productos WHERE sabor LIKE "%manzana";
SELECT * FROM tabla_de_productos WHERE sabor LIKE "%manzana"
AND envase = "Botellas PET";
SELECT * FROM tabla_de_clientes WHERE nombre LIKE "%ez";

#Usando comando DISTINCT
SELECT DISTINCT ENVASE, TAMANO FROM tabla_de_productos;

SELECT DISTINCT ENVASE, TAMANO, SABOR FROM tabla_de_productos
WHERE SABOR = "Naranja";

SELECT DISTINCT BARRIO FROM TABLA_DE_CLIENTES 
WHERE Ciudad = "Ciudad de México";

#Usando comando LIMIT
SELECT * FROM tabla_de_productos LIMIT 5;
SELECT * FROM tabla_de_productos LIMIT 5, 3;

SELECT * FROM facturas
WHERE fecha_venta = "2017-01-01"
LIMIT 10;

#Usando comando ORDER BY
SELECT * FROM tabla_de_productos
ORDER BY PRECIO_DE_LISTA;

SELECT * FROM tabla_de_productos 
ORDER BY PRECIO_DE_LISTA DESC;

SELECT * FROM tabla_de_productos
ORDER BY PRECIO_DE_LISTA;

SELECT * FROM items_facturas
WHERE CODIGO_DEL_PRODUCTO = "1101035"
ORDER BY CANTIDAD DESC;


#Usando comando GROUP BY
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) AS LIMITE 
FROM tabla_de_clientes
GROUP BY ESTADO;

SELECT ENVASE, MAX(PRECIO_DE_LISTA) AS PRECIO 
FROM tabla_de_productos
GROUP BY ENVASE;

SELECT ENVASE, COUNT(*)
FROM tabla_de_productos
GROUP BY ENVASE;

SELECT ESTADO, BARRIO, EDAD, MAX(LIMITE_DE_CREDITO) AS LIMITE
FROM tabla_de_clientes
WHERE EDAD >= 20
GROUP BY ESTADO, BARRIO
ORDER BY EDAD;

SELECT SUM(CANTIDAD) AS CANTIDAD FROM items_facturas
WHERE CODIGO_DEL_PRODUCTO = "1101035";