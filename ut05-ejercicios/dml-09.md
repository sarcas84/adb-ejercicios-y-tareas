
## Ejercicio 9. Gestión de ventas (varias tablas)

Resuelva todas las consultas utilizando la sintaxis de SQL1 y SQL2.

- [Esquema SQL1](./01-schema.sql)
- [Datos SQL1](./01-data.sql)

- [Esquema SQL2](./02-schema.sql)
- [Datos SQL2](./02-data.sql)

```
-- 1. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
SELECT DISTINCT c.id, c.nombre, c.apellido1, c.apellido2
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
ORDER BY c.apellido1, c.apellido2, c.nombre;

-- 2. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
SELECT p.*, c.*
FROM pedido p
JOIN cliente c ON p.id_cliente = c.id
ORDER BY c.apellido1, c.apellido2, c.nombre;

-- 3. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
SELECT p.*, com.*
FROM pedido p
JOIN comercial com ON p.id_comercial = com.id
ORDER BY com.apellido1, com.apellido2, com.nombre;

-- 4. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los comerciales asociados a cada pedido.
SELECT c.*, p.*, com.*
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
JOIN comercial com ON p.id_comercial = com.id;

-- 5. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
SELECT DISTINCT c.*
FROM cliente c
JOIN pedido p ON c.id = p.id_cliente
WHERE YEAR(p.fecha) = 2017 AND p.total BETWEEN 300 AND 1000;

-- 6. Devuelve el nombre y los apellidos de todos los comerciales que ha participado en algún pedido realizado por María Santana Moreno.
SELECT DISTINCT com.nombre, com.apellido1, com.apellido2
FROM pedido p
JOIN cliente c ON p.id_cliente = c.id
JOIN comercial com ON p.id_comercial = com.id
WHERE c.nombre = 'María' AND c.apellido1 = 'Santana' AND c.apellido2 = 'Moreno';

-- 7. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
SELECT DISTINCT c.nombre, c.apellido1, c.apellido2
FROM pedido p
JOIN cliente c ON p.id_cliente = c.id
JOIN comercial com ON p.id_comercial = com.id
WHERE com.nombre = 'Daniel' AND com.apellido1 = 'Sáez' AND com.apellido2 = 'Vega';
```
