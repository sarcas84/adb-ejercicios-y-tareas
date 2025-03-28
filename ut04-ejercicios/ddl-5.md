
## Ejercicio 5: Actores y Películas (Relación N:M)

```
-- Crea una base de datos llamada cine con utf8mb4_unicode_ci.
CREATE DATABASE cine CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Modifica la base de datos cine para cambiar su collation a utf8mb4_general_ci.
ALTER DATABASE cine COLLATE utf8mb4_general_ci;

USE cine;

-- Crea una tabla actores con los siguientes campos:
-- id: UNSIGNED INT, auto incremental, clave primaria.
-- nombre: VARCHAR(100), no nulo.
CREATE TABLE actores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crea una tabla peliculas con los siguientes campos:
-- id: AUTO_INCREMENT, clave primaria.
-- titulo: VARCHAR(150), no nulo.
-- anio_estreno: YEAR, no nulo.
CREATE TABLE peliculas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    anio_estreno YEAR NOT NULL
);

-- Crea la tabla intermedia actores_peliculas para gestionar la relación muchos a muchos entre actores y peliculas, con los campos:
-- id: AUTO_INCREMENT, clave primaria.
-- actor_id: UNSIGNED INT, clave foránea a actores(id).
-- pelicula_id: UNSIGNED INT, clave foránea a peliculas(id).
-- personaje: VARCHAR(100), no nulo.
CREATE TABLE actores_peliculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    actor_id INT UNSIGNED,
    pelicula_id INT UNSIGNED,
    personaje VARCHAR(100) NOT NULL,
    CONSTRAINT fk_actor FOREIGN KEY (actor_id) REFERENCES actores(id),
    CONSTRAINT fk_pelicula FOREIGN KEY (pelicula_id) REFERENCES peliculas(id)
);

-- Modifica la tabla actores_peliculas para agregar una columna salario de tipo DECIMAL(10,2).
ALTER TABLE actores_peliculas ADD COLUMN salario DECIMAL(10,2);

-- Cambia el tamaño del campo nombre en la tabla actores a 150 caracteres.
ALTER TABLE actores MODIFY COLUMN nombre VARCHAR(150) NOT NULL;

-- Elimina la columna salario de la tabla actores_peliculas.
ALTER TABLE actores_peliculas DROP COLUMN salario;

-- Añade un índice a la columna titulo en peliculas para mejorar la búsqueda.
CREATE INDEX idx_titulo ON peliculas(titulo);

-- Inserta un actor llamado "Leonardo DiCaprio".
INSERT INTO actores (nombre) VALUES ('Leonardo DiCaprio');

-- Añade una película llamada "Titanic" con año de estreno 1997.
INSERT INTO peliculas (titulo, anio_estreno) VALUES ('Titanic', 1997);

-- Registra la participación de "Leonardo DiCaprio" en "Titanic" como el personaje "Jack Dawson".
INSERT INTO actores_peliculas (actor_id, pelicula_id, personaje)
VALUES (
    (SELECT id FROM actores WHERE nombre = 'Leonardo DiCaprio'),
    (SELECT id FROM peliculas WHERE titulo = 'Titanic'),
    'Jack Dawson'
);

-- Inserta dos actores adicionales ("Kate Winslet" y "Tom Hanks").
INSERT INTO actores (nombre) VALUES ('Kate Winslet'), ('Tom Hanks');

-- Añade tres películas adicionales ("Forrest Gump", "Avatar", "Inception").
INSERT INTO peliculas (titulo, anio_estreno) VALUES 
    ('Forrest Gump', 1994),
    ('Avatar', 2009),
    ('Inception', 2010);

-- Registra la participación de actores en distintas películas.
INSERT INTO actores_peliculas (actor_id, pelicula_id, personaje)
VALUES
    (
        (SELECT id FROM actores WHERE nombre = 'Kate Winslet'),
        (SELECT id FROM peliculas WHERE titulo = 'Titanic'),
        'Rose DeWitt Bukater'
    ),
    (
        (SELECT id FROM actores WHERE nombre = 'Tom Hanks'),
        (SELECT id FROM peliculas WHERE titulo = 'Forrest Gump'),
        'Forrest Gump'
    );

-- Consulta todas las películas en las que ha trabajado "Leonardo DiCaprio".
SELECT p.*
FROM peliculas p
JOIN actores_peliculas ap ON p.id = ap.pelicula_id
JOIN actores a ON ap.actor_id = a.id
WHERE a.nombre = 'Leonardo DiCaprio';

-- Consulta todos los actores que han participado en la película "Titanic".
SELECT a.*
FROM actores a
JOIN actores_peliculas ap ON a.id = ap.actor_id
JOIN peliculas p ON ap.pelicula_id = p.id
WHERE p.titulo = 'Titanic';

-- Elimina la participación de un actor en una película específica.
DELETE FROM actores_peliculas
WHERE actor_id = (SELECT id FROM actores WHERE nombre = 'Kate Winslet')
  AND pelicula_id = (SELECT id FROM peliculas WHERE titulo = 'Titanic');

-- Elimina un actor y sus registros de películas.
DELETE FROM actores_peliculas
WHERE actor_id IN (SELECT id FROM (SELECT id FROM actores WHERE nombre = 'Tom Hanks') AS tmp);
DELETE FROM actores
WHERE nombre = 'Tom Hanks';

-- Elimina la base de datos cine.
DROP DATABASE cine;

```