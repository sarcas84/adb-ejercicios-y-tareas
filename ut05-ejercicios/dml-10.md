
## Ejercicio 10. Jardinería (varias tablas)

Resuelva todas las consultas utilizando la sintaxis de SQL4.

- [Esquema SQL1](./01-schema.sql)
- [Datos SQL1](./01-data.sql)

- [Esquema SQL2](./02-schema.sql)
- [Datos SQL2](./02-data.sql)

```
-- 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c
JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado;

-- 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas
SELECT DISTINCT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c
JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
JOIN pago p ON c.codigo_cliente = p.codigo_cliente;

-- 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas
SELECT c.nombre_cliente, e.nombre, e.apellido1
FROM cliente c
JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
WHERE p.codigo_cliente IS NULL;

-- 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante
SELECT DISTINCT c.nombre_cliente, e.nombre, e.apellido1, o.ciudad
FROM cliente c
JOIN pago p ON c.codigo_cliente = p.codigo_cliente
JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
JOIN oficina o ON e.codigo_oficina = o.codigo_oficina;

-- 5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante
SELECT c.nombre_cliente, e.nombre, e.apellido1, o.ciudad
FROM cliente c
LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente
JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
JOIN oficina o ON e.codigo_oficina = o.codigo_oficina
WHERE p.codigo_cliente IS NULL;

-- 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada
SELECT DISTINCT o.linea_direccion1
FROM oficina o
JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
WHERE c.ciudad = 'Fuenlabrada';

-- 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante
SELECT c.nombre_cliente, e.nombre, e.apellido1, o.ciudad
FROM cliente c
JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
JOIN oficina o ON e.codigo_oficina = o.codigo_oficina;

-- 8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes
SELECT e1.nombre AS empleado, e2.nombre AS jefe
FROM empleado e1
JOIN empleado e2 ON e1.codigo_jefe = e2.codigo_empleado;

-- 9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe
SELECT e1.nombre AS empleado, e2.nombre AS jefe, e3.nombre AS jefe_del_jefe
FROM empleado e1
JOIN empleado e2 ON e1.codigo_jefe = e2.codigo_empleado
LEFT JOIN empleado e3 ON e2.codigo_jefe = e3.codigo_empleado;

-- 10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido
SELECT DISTINCT c.nombre_cliente
FROM cliente c
JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
WHERE p.fecha_entrega > p.fecha_esperada;

-- 11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente
SELECT DISTINCT c.nombre_cliente, gp.gama
FROM cliente c
JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
JOIN producto pr ON dp.codigo_producto = pr.codigo_producto
JOIN gama_producto gp ON pr.gama = gp.gama;
```
