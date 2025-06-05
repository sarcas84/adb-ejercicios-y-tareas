
## Ejercicio 4. Jardinería

- [Esquema SQL](./04-schema.sql)
- [Datos SQL](./04-data.sql)

```
-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas
SELECT codigo_oficina, ciudad FROM oficina;

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España
SELECT ciudad, telefono FROM oficina WHERE pais = 'España';

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7
SELECT nombre, apellido1, apellido2, email FROM empleado WHERE codigo_jefe = 7;

-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa
SELECT puesto, nombre, apellido1, apellido2, email 
FROM empleado 
WHERE codigo_jefe IS NULL;

-- 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas
SELECT nombre, apellido1, apellido2, puesto 
FROM empleado 
WHERE puesto <> 'Representante Ventas';

-- 6. Devuelve un listado con el nombre de los todos los clientes españoles
SELECT nombre_cliente 
FROM cliente 
WHERE pais = 'España';

-- 7. Devuelve un listado con los distintos estados por los que puede pasar un pedido
SELECT DISTINCT estado FROM pedido;

-- 8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008, sin repetir

-- Utilizando YEAR()
SELECT DISTINCT codigo_cliente 
FROM pago 
WHERE YEAR(fecha_pago) = 2008;

-- Utilizando DATE_FORMAT()
SELECT DISTINCT codigo_cliente 
FROM pago 
WHERE DATE_FORMAT(fecha_pago, '%Y') = '2008';

-- Sin funciones
SELECT DISTINCT codigo_cliente 
FROM pago 
WHERE fecha_pago BETWEEN '2008-01-01' AND '2008-12-31';

-- 9. Devuelve pedidos no entregados a tiempo (fecha_entrega > fecha_esperada)
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega 
FROM pedido 
WHERE fecha_entrega > fecha_esperada;

-- 10. Devuelve pedidos entregados al menos dos días antes de la fecha esperada

-- Utilizando ADDDATE
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega 
FROM pedido 
WHERE fecha_entrega <= ADDDATE(fecha_esperada, INTERVAL -2 DAY);

-- Utilizando DATEDIFF
SELECT codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega 
FROM pedido 
WHERE DATEDIFF(fecha_esperada, fecha_entrega) >= 2;

-- 11. Devuelve todos los pedidos que fueron rechazados en 2009
SELECT * 
FROM pedido 
WHERE estado = 'Rechazado' 
  AND YEAR(fecha_pedido) = 2009;

-- 12. Devuelve todos los pedidos entregados en el mes de enero de cualquier año
SELECT * 
FROM pedido 
WHERE MONTH(fecha_entrega) = 1;

-- 13. Devuelve pagos realizados en 2008 mediante PayPal, ordenados de mayor a menor
SELECT * 
FROM pago 
WHERE YEAR(fecha_pago) = 2008 
  AND forma_pago = 'PayPal' 
ORDER BY total DESC;

-- 14. Devuelve todas las formas de pago sin repetir
SELECT DISTINCT forma_pago FROM pago;

-- 15. Devuelve productos de la gama 'Ornamentales' con más de 100 unidades en stock, ordenados por precio de mayor a menor
SELECT * 
FROM producto 
WHERE gama = 'Ornamentales' 
  AND cantidad_en_stock > 100 
ORDER BY precio_venta DESC;

-- 16. Devuelve clientes de Madrid cuyo representante tenga código 11 o 30
SELECT * 
FROM cliente 
WHERE ciudad = 'Madrid' 
  AND codigo_empleado_rep_ventas IN (11, 30);
```