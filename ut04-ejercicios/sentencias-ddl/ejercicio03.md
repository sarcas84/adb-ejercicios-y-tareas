
## Ejercicio 3: Biblioteca y Libros (Relación Uno a Muchos 1:N)

```
-- 1. Crear la base de datos biblioteca con collation utf8mb4_unicode_ci:
CREATE DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Modificar la base de datos biblioteca para cambiar su collation a utf8mb4_general_ci:
ALTER DATABASE biblioteca COLLATE utf8mb4_general_ci;

-- 3. Seleccionar la base de datos biblioteca:
USE biblioteca;

-- 4. Crear la tabla bibliotecas con los campos id y nombre:
CREATE TABLE bibliotecas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 5. Crear la tabla libros con los campos indicados:
CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    biblioteca_id INT UNSIGNED,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    anio_publicacion YEAR NOT NULL,
    FOREIGN KEY (biblioteca_id) REFERENCES bibliotecas(id)
);

-- 6. Modificar la tabla libros agregando una columna genero de tipo VARCHAR(50):
ALTER TABLE libros 
    ADD COLUMN genero VARCHAR(50);

-- 7. Cambiar el tamaño del campo nombre en la tabla bibliotecas a 150 caracteres:
ALTER TABLE bibliotecas 
    MODIFY COLUMN nombre VARCHAR(150) NOT NULL;

-- 8. Eliminar la columna genero de la tabla libros:
ALTER TABLE libros 
    DROP COLUMN genero;

-- 9. Añadir una nueva columna isbn de tipo VARCHAR(20) después del campo titulo en la tabla libros:
ALTER TABLE libros 
    ADD COLUMN isbn VARCHAR(20) AFTER titulo;

-- 10. Cambiar el tipo de dato de isbn en la tabla libros para que sea CHAR(13):
ALTER TABLE libros 
    MODIFY COLUMN isbn CHAR(13);

-- 11. Insertar una biblioteca llamada "Biblioteca Central":
INSERT INTO bibliotecas (nombre) VALUES ('Biblioteca Central');

-- 12. Añadir un libro "El Quijote" de "Miguel de Cervantes" en la Biblioteca Central:

-- Cambia el tipo de la columna 'anio_publicacion' a 'INT' para permitir años anteriores a 1901:
ALTER TABLE libros MODIFY COLUMN anio_publicacion INT;

INSERT INTO libros (biblioteca_id, titulo, autor, anio_publicacion, isbn)
    VALUES (
        (SELECT id FROM bibliotecas WHERE nombre = 'Biblioteca Central'),
        'El Quijote', 
        'Miguel de Cervantes', 
        1605,
        '0000000000000'  
    );

-- 13. Registrar dos libros adicionales en la Biblioteca Central:
-- Libro 1:
INSERT INTO libros (biblioteca_id, titulo, autor, anio_publicacion, isbn)
    VALUES (
        (SELECT id FROM bibliotecas WHERE nombre = 'Biblioteca Central'),
        'Cien Años de Soledad', 
        'Gabriel García Márquez', 
        1967, 
        '1111111111111'
    );
-- Libro 2:
INSERT INTO libros (biblioteca_id, titulo, autor, anio_publicacion, isbn)
    VALUES (
        (SELECT id FROM bibliotecas WHERE nombre = 'Biblioteca Central'),
        '1984', 
        'George Orwell', 
        1949, 
        '2222222222222'
    );

-- 14. Consultar todos los libros con su biblioteca:
SELECT b.nombre AS biblioteca, l.titulo, l.autor, l.anio_publicacion, l.isbn
FROM libros l
JOIN bibliotecas b ON l.biblioteca_id = b.id;

-- 15. Mostrar todas las bibliotecas sin libros registrados:
SELECT *
FROM bibliotecas
WHERE id NOT IN (SELECT biblioteca_id FROM libros);

-- 16. Actualizar el año de publicación de "1984" a 1950:
UPDATE libros
SET anio_publicacion = 1950
WHERE titulo = '1984';

-- 17. Eliminar un libro con id = 1:
DELETE FROM libros
WHERE id = 1;

-- 18. Eliminar la Biblioteca Central y todos sus libros:
DELETE FROM libros
WHERE biblioteca_id = (SELECT id FROM bibliotecas WHERE nombre = 'Biblioteca Central');
DELETE FROM bibliotecas
WHERE nombre = 'Biblioteca Central';

-- 19. Consultar la estructura de la tabla libros:
DESCRIBE libros;
-- O alternativamente: SHOW COLUMNS FROM libros;

-- 20. Eliminar las tablas libros y bibliotecas:
DROP TABLE IF EXISTS libros;
DROP TABLE IF EXISTS bibliotecas;

-- 21. Eliminar la base de datos biblioteca:
DROP DATABASE IF EXISTS biblioteca;
```
