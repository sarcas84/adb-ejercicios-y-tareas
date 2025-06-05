
## Ejercicio 1. Tienda de informática

- [Esquema SQL](./01-schema.sql)
- [Datos SQL](./01-data.sql)

```
-- 1. Lista el nombre de todos los productos que hay en la tabla producto
SELECT nombre FROM producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto
SELECT nombre, precio FROM producto;

-- 3. Lista todas las columnas de la tabla producto
SELECT * FROM producto;

-- 4. Lista el nombre de los productos, el precio en euros (EUR) y el precio en dólares estadounidenses (USD) si el cambio está a 1 EUR = 1.14 USD
SELECT nombre, precio, precio * 1.14 FROM producto;

-- 5. Lista el nombre de los productos, el precio en euros (EUR) y el precio en dólares estadounidenses (USD) con alias: nombre de producto, euros, dólares
SELECT nombre AS "nombre de producto", precio AS euros, precio * 1.14 AS dolares FROM producto;

-- 6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula
SELECT UPPER(nombre) AS nombre, precio FROM producto;

-- 7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula
SELECT LOWER(nombre) AS nombre, precio FROM producto;

-- 8. Lista el nombre de todos los fabricantes y en otra columna los dos primeros caracteres en mayúscula
SELECT nombre, UPPER(LEFT(nombre, 2)) AS abreviatura FROM fabricante;

-- 9. Lista los nombres y los precios de todos los productos, redondeando el precio
SELECT nombre, ROUND(precio) AS precio_redondeado FROM producto;

-- 10. Lista los nombres y los precios truncados (sin decimales)
SELECT nombre, TRUNCATE(precio, 0) AS precio_truncado FROM producto;

-- 11. Lista el identificador de los fabricantes que tienen productos
SELECT id_fabricante FROM producto;

-- 12. Lista los identificadores únicos de fabricantes que tienen productos
SELECT DISTINCT id_fabricante FROM producto;

-- 13. Lista los nombres de los fabricantes ordenados ascendentemente
SELECT nombre FROM fabricante ORDER BY nombre ASC;

-- 14. Lista los nombres de los fabricantes ordenados descendentemente
SELECT nombre FROM fabricante ORDER BY nombre DESC;

-- 15. Lista los nombres de los productos ordenados por nombre ASC y precio DESC
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;

-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante
SELECT * FROM fabricante LIMIT 5;

-- 17. Devuelve una lista con 2 filas a partir de la cuarta (incluida) de la tabla fabricante
SELECT * FROM fabricante LIMIT 3,2;

-- 18. Lista el nombre y precio del producto más barato (ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

-- 19. Lista el nombre y precio del producto más caro (ORDER BY y LIMIT)
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

-- 20. Lista el nombre de todos los productos del fabricante con id = 2
SELECT nombre FROM producto WHERE id_fabricante = 2;

-- 21. Lista los productos con precio menor o igual a 120€
SELECT nombre FROM producto WHERE precio <= 120;

-- 22. Lista los productos con precio mayor o igual a 400€
SELECT nombre FROM producto WHERE precio >= 400;

-- 23. Lista los productos que no tienen precio mayor o igual a 400€
SELECT nombre FROM producto WHERE NOT precio >= 400;

-- 24. Lista los productos con precio entre 80€ y 300€ sin BETWEEN
SELECT nombre FROM producto WHERE precio >= 80 AND precio <= 300;

-- 25. Lista los productos con precio entre 60€ y 200€ usando BETWEEN
SELECT nombre FROM producto WHERE precio BETWEEN 60 AND 200;

-- 26. Lista los productos con precio > 200€ y fabricante id = 6
SELECT * FROM producto WHERE precio > 200 AND id_fabricante = 6;

-- 27. Lista los productos donde el id_fabricante sea 1, 3 o 5 (sin IN)
SELECT * FROM producto WHERE id_fabricante = 1 OR id_fabricante = 3 OR id_fabricante = 5;

-- 28. Lista los productos donde el id_fabricante sea 1, 3 o 5 (con IN)
SELECT * FROM producto WHERE id_fabricante IN (1, 3, 5);

-- 29. Lista el nombre y precio en céntimos (alias: céntimos)
SELECT nombre, precio * 100 AS centimos FROM producto;

-- 30. Lista los nombres de fabricantes cuyo nombre empieza por S
SELECT nombre FROM fabricante WHERE nombre LIKE 'S%';

-- 31. Lista los nombres de fabricantes cuyo nombre termina en "e"
SELECT nombre FROM fabricante WHERE nombre LIKE '%e';

-- 32. Lista los nombres de fabricantes cuyo nombre contiene la letra "w"
SELECT nombre FROM fabricante WHERE nombre LIKE '%w%';

-- 33. Lista los nombres de fabricantes cuyo nombre tiene exactamente 4 caracteres
SELECT nombre FROM fabricante WHERE nombre LIKE '____';

-- 34. Lista los productos que contienen "Portátil" en el nombre
SELECT nombre FROM producto WHERE nombre LIKE '%Portátil%';

-- 35. Lista los productos que contienen "Monitor" y precio < 215€
SELECT nombre FROM producto WHERE nombre LIKE '%Monitor%' AND precio < 215;

-- 36. Lista los productos con precio >= 180€, ordenados por precio DESC y nombre ASC
SELECT nombre, precio FROM producto WHERE precio >= 180 ORDER BY precio DESC, nombre ASC;
```
