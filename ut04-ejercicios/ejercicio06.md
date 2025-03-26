
## Ejercicio 6: Profesores y Cursos (N:M)

```

-- Crea una base de datos llamada instituto con utf8mb4_unicode_ci.
CREATE DATABASE instituto CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Modifica la base de datos instituto para cambiar su collation a utf8mb4_general_ci.
ALTER DATABASE instituto COLLATE utf8mb4_general_ci;

USE instituto;

-- Crea una tabla profesores con los siguientes campos:
-- id: UNSIGNED INT, auto incremental, clave primaria.
-- nombre: VARCHAR(100), no nulo.
CREATE TABLE profesores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crea una tabla cursos con los siguientes campos:
-- id: AUTO_INCREMENT, clave primaria.
-- nombre: VARCHAR(150), no nulo.
-- descripcion: TEXT, opcional.
CREATE TABLE cursos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT
);

-- Crea la tabla intermedia profesores_cursos para gestionar la relación muchos a muchos entre profesores y cursos, con los campos:
-- id: AUTO_INCREMENT, clave primaria.
-- profesor_id: UNSIGNED INT, clave foránea a profesores(id).
-- curso_id: UNSIGNED INT, clave foránea a cursos(id).
-- fecha_asignacion: DATE, no nulo.
CREATE TABLE profesores_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profesor_id INT UNSIGNED,
    curso_id INT UNSIGNED,
    fecha_asignacion DATE NOT NULL,
    CONSTRAINT fk_profesor FOREIGN KEY (profesor_id) REFERENCES profesores(id),
    CONSTRAINT fk_curso FOREIGN KEY (curso_id) REFERENCES cursos(id)
);

-- Modifica la tabla profesores_cursos para agregar una columna horas_clase de tipo INT.
ALTER TABLE profesores_cursos ADD COLUMN horas_clase INT;

-- Cambia el tamaño del campo nombre en la tabla cursos a 200 caracteres.
ALTER TABLE cursos MODIFY COLUMN nombre VARCHAR(200) NOT NULL;

-- Elimina la columna horas_clase de la tabla profesores_cursos.
ALTER TABLE profesores_cursos DROP COLUMN horas_clase;

-- Añade un índice a la columna nombre en cursos para mejorar la búsqueda.
CREATE INDEX idx_nombre ON cursos(nombre);

-- Inserta un profesor llamado "Juan Pérez".
INSERT INTO profesores (nombre) VALUES ('Juan Pérez');

-- Añade un curso llamado "Matemáticas" con una descripción "Curso de álgebra y geometría".
INSERT INTO cursos (nombre, descripcion) VALUES ('Matemáticas', 'Curso de álgebra y geometría');

-- Asigna el profesor "Juan Pérez" al curso "Matemáticas" con fecha de asignación de hoy.
INSERT INTO profesores_cursos (profesor_id, curso_id, fecha_asignacion)
VALUES (
    (SELECT id FROM profesores WHERE nombre = 'Juan Pérez'),
    (SELECT id FROM cursos WHERE nombre = 'Matemáticas'),
    CURDATE()
);

-- Inserta dos profesores adicionales ("Ana Rodríguez" y "Luis Gómez").
INSERT INTO profesores (nombre) VALUES ('Ana Rodríguez'), ('Luis Gómez');

-- Añade tres cursos adicionales ("Física", "Historia", "Química").
INSERT INTO cursos (nombre) VALUES ('Física'), ('Historia'), ('Química');

-- Asigna a los profesores a distintos cursos.
INSERT INTO profesores_cursos (profesor_id, curso_id, fecha_asignacion)
VALUES 
    (
        (SELECT id FROM profesores WHERE nombre = 'Ana Rodríguez'),
        (SELECT id FROM cursos WHERE nombre = 'Física'),
        CURDATE()
    ),
    (
        (SELECT id FROM profesores WHERE nombre = 'Ana Rodríguez'),
        (SELECT id FROM cursos WHERE nombre = 'Química'),
        CURDATE()
    ),
    (
        (SELECT id FROM profesores WHERE nombre = 'Luis Gómez'),
        (SELECT id FROM cursos WHERE nombre = 'Historia'),
        CURDATE()
    );

-- Consulta todos los cursos en los que imparte clases "Juan Pérez".
SELECT c.*
FROM cursos c
JOIN profesores_cursos pc ON c.id = pc.curso_id
JOIN profesores p ON pc.profesor_id = p.id
WHERE p.nombre = 'Juan Pérez';

-- Consulta todos los profesores que enseñan el curso "Matemáticas".
SELECT p.*
FROM profesores p
JOIN profesores_cursos pc ON p.id = pc.profesor_id
JOIN cursos c ON pc.curso_id = c.id
WHERE c.nombre = 'Matemáticas';

-- Elimina la asignación de un profesor en un curso específico.
DELETE FROM profesores_cursos
WHERE profesor_id = (SELECT id FROM profesores WHERE nombre = 'Ana Rodríguez')
  AND curso_id = (SELECT id FROM cursos WHERE nombre = 'Física');

-- Elimina un profesor y sus registros de cursos.
DELETE FROM profesores_cursos
WHERE profesor_id = (SELECT id FROM profesores WHERE nombre = 'Luis Gómez');
DELETE FROM profesores
WHERE nombre = 'Luis Gómez';

-- Elimina la base de datos instituto.
DROP DATABASE instituto;

```