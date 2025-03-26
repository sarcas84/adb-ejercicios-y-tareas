
## Ejercicio 4: Alumnos y Asignaturas (N:M)

```
-- Crea una base de datos llamada universidad con utf8mb4_unicode_ci.
CREATE DATABASE universidad CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Modifica la base de datos universidad para cambiar su collation a utf8mb4_general_ci.
ALTER DATABASE universidad COLLATE utf8mb4_general_ci;

USE universidad;

-- Crea una tabla alumnos con los siguientes campos:
-- id: UNSIGNED INT, auto incremental, clave primaria.
-- nombre: VARCHAR(100), no nulo.
CREATE TABLE alumnos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crea una tabla asignaturas con los siguientes campos:
-- id: AUTO_INCREMENT, clave primaria.
-- nombre: VARCHAR(100), no nulo.
CREATE TABLE asignaturas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crea la tabla intermedia matriculas para gestionar la relación muchos a muchos entre alumnos y asignaturas, con los campos:
-- id: AUTO_INCREMENT, clave primaria.
-- alumno_id: UNSIGNED INT, clave foránea a alumnos(id).
-- asignatura_id: UNSIGNED INT, clave foránea a asignaturas(id).
-- fecha_matricula: DATE, no nulo.
CREATE TABLE matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    alumno_id INT UNSIGNED,
    asignatura_id INT,
    fecha_matricula DATE NOT NULL,
    CONSTRAINT fk_alumno FOREIGN KEY (alumno_id) REFERENCES alumnos(id),
    CONSTRAINT fk_asignatura FOREIGN KEY (asignatura_id) REFERENCES asignaturas(id)
);

-- Modifica la tabla matriculas para agregar una columna nota de tipo DECIMAL(4,2).
ALTER TABLE matriculas ADD COLUMN nota DECIMAL(4,2);

-- Cambia el tamaño del campo nombre en la tabla asignaturas a 150 caracteres.
ALTER TABLE asignaturas MODIFY COLUMN nombre VARCHAR(150) NOT NULL;

-- Elimina la columna nota de la tabla matriculas.
ALTER TABLE matriculas DROP COLUMN nota;

-- Añade un índice a la columna nombre en asignaturas para mejorar la búsqueda.
CREATE INDEX idx_nombre ON asignaturas(nombre);

-- Inserta un alumno llamado "Luis Gómez".
INSERT INTO alumnos (nombre) VALUES ('Luis Gómez');

-- Añade una asignatura llamada "Matemáticas".
INSERT INTO asignaturas (nombre) VALUES ('Matemáticas');

-- Matricula al alumno en Matemáticas con fecha de matrícula de hoy.
INSERT INTO matriculas (alumno_id, asignatura_id, fecha_matricula)
VALUES (
    (SELECT id FROM alumnos WHERE nombre = 'Luis Gómez'),
    (SELECT id FROM asignaturas WHERE nombre = 'Matemáticas'),
    CURDATE()
);

-- Inserta dos alumnos adicionales ("María Fernández" y "Carlos Ruiz").
INSERT INTO alumnos (nombre) VALUES ('María Fernández'), ('Carlos Ruiz');

-- Añade tres asignaturas adicionales ("Física", "Historia", "Química").
INSERT INTO asignaturas (nombre) VALUES ('Física'), ('Historia'), ('Química');

-- Matricula a los alumnos en distintas asignaturas.
-- Se matricula a "María Fernández" en "Historia" y "Química", y a "Carlos Ruiz" en "Física" y "Química".
INSERT INTO matriculas (alumno_id, asignatura_id, fecha_matricula)
VALUES 
    ((SELECT id FROM alumnos WHERE nombre = 'María Fernández'),
     (SELECT id FROM asignaturas WHERE nombre = 'Historia'),
     CURDATE()),
    ((SELECT id FROM alumnos WHERE nombre = 'María Fernández'),
     (SELECT id FROM asignaturas WHERE nombre = 'Química'),
     CURDATE()),
    ((SELECT id FROM alumnos WHERE nombre = 'Carlos Ruiz'),
     (SELECT id FROM asignaturas WHERE nombre = 'Física'),
     CURDATE()),
    ((SELECT id FROM alumnos WHERE nombre = 'Carlos Ruiz'),
     (SELECT id FROM asignaturas WHERE nombre = 'Química'),
     CURDATE());

-- Consulta todas las asignaturas en las que está inscrito el alumno "Luis Gómez".
SELECT a.*
FROM asignaturas a
JOIN matriculas m ON a.id = m.asignatura_id
JOIN alumnos al ON m.alumno_id = al.id
WHERE al.nombre = 'Luis Gómez';

-- Consulta todos los alumnos que están inscritos en la asignatura "Matemáticas".
SELECT al.*
FROM alumnos al
JOIN matriculas m ON al.id = m.alumno_id
JOIN asignaturas a ON m.asignatura_id = a.id
WHERE a.nombre = 'Matemáticas';

-- Elimina la inscripción de un alumno en una asignatura específica.
-- Se elimina la inscripción de "María Fernández" en "Historia".
DELETE FROM matriculas
WHERE alumno_id = (SELECT id FROM alumnos WHERE nombre = 'María Fernández')
  AND asignatura_id = (SELECT id FROM asignaturas WHERE nombre = 'Historia');

-- Elimina un alumno y sus matrículas asociadas.
-- Se elimina el alumno "Carlos Ruiz" y sus matrículas.
DELETE FROM matriculas
WHERE alumno_id IN (SELECT id FROM (SELECT id FROM alumnos WHERE nombre = 'Carlos Ruiz') AS tmp);
DELETE FROM alumnos
WHERE nombre = 'Carlos Ruiz';

-- Elimina la base de datos universidad.
DROP DATABASE universidad;

```