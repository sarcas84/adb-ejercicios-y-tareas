
## Ejercicio 3. Gestión de ventas

- [Esquema SQL](./03-schema.sql)
- [Datos SQL](./03-data.sql)

```
-- 1. Devuelve un listado con todos los pedidos que se han realizado. Ordenados por fecha, primero los más recientes
SELECT * FROM pedido ORDER BY fecha DESC;

-- 2. Devuelve todos los datos de los dos pedidos de mayor valor
SELECT * FROM pedido ORDER BY total DESC LIMIT 2;

-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido, sin repetir
SELECT DISTINCT id_cliente FROM pedido;

-- 4. Devuelve un listado de todos los pedidos realizados en 2017 con total > 500€
SELECT * FROM pedido 
WHERE fecha BETWEEN '2017-01-01' AND '2017-12-31' 
  AND total > 500;

-- 5. Devuelve nombre y apellidos de los comerciales con comisión entre 0.05 y 0.11
SELECT nombre, apellido1, apellido2 
FROM comercial 
WHERE comision BETWEEN 0.05 AND 0.11;

-- 6. Devuelve el valor máximo de la comisión en la tabla comercial
SELECT MAX(comision) AS comision_maxima FROM comercial;

-- 7. Devuelve id, nombre y primer apellido de clientes cuyo segundo apellido no es NULL, ordenado por apellidos y nombre
SELECT id, nombre, apellido1 
FROM cliente 
WHERE apellido2 IS NOT NULL 
ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

-- 8. Devuelve nombres de clientes que empiecen por A y terminen por n o empiecen por P, ordenado alfabéticamente
SELECT nombre 
FROM cliente 
WHERE (nombre LIKE 'A%n' OR nombre LIKE 'P%') 
ORDER BY nombre ASC;

-- 9. Devuelve nombres de clientes que NO empiecen por A, ordenado alfabéticamente
SELECT nombre 
FROM cliente 
WHERE nombre NOT LIKE 'A%' 
ORDER BY nombre ASC;

-- 10. Devuelve nombres de comerciales que terminan en 'el' o 'o', sin repetir, ordenado alfabéticamente
SELECT DISTINCT nombre 
FROM comercial 
WHERE nombre LIKE '%el' OR nombre LIKE '%o' 
ORDER BY nombre ASC;
```