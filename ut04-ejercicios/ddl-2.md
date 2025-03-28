
## Ejercicio 2: Pacientes e Historia Clínica (Relación Uno a Uno - 1:1)

```
-- 1. Crear la base de datos hospital con collation utf8mb4_unicode_ci:
CREATE DATABASE hospital CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Modificar la base de datos hospital para cambiar su collation a utf8mb4_general_ci:
ALTER DATABASE hospital COLLATE utf8mb4_general_ci;

-- 3. Seleccionar la base de datos hospital:
USE hospital;

-- 4. Crear la tabla pacientes con los campos id (auto incremental, clave primaria) y nombre (VARCHAR(100) no nulo):
CREATE TABLE pacientes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 5. Crear la tabla historias_clinicas donde cada paciente tiene una única historia clínica:
CREATE TABLE historias_clinicas (
    paciente_id INT UNSIGNED PRIMARY KEY,
    diagnostico TEXT NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
);

-- 6. Modificar la tabla historias_clinicas agregando una columna tratamiento de tipo TEXT:
ALTER TABLE historias_clinicas 
    ADD COLUMN tratamiento TEXT;

-- 7. Cambiar el tamaño del campo nombre en la tabla pacientes a 150 caracteres:
ALTER TABLE pacientes 
    MODIFY COLUMN nombre VARCHAR(150) NOT NULL;

-- 8. Agregar una nueva columna telefono de tipo VARCHAR(15) después del campo nombre en pacientes:
ALTER TABLE pacientes 
    ADD COLUMN telefono VARCHAR(15) AFTER nombre;

-- 9. Cambiar el tipo de dato de telefono en pacientes para que sea BIGINT:
ALTER TABLE pacientes 
    MODIFY COLUMN telefono BIGINT;

-- 10. Eliminar la columna telefono de la tabla pacientes:
ALTER TABLE pacientes 
    DROP COLUMN telefono;

-- 11. Insertar un paciente llamado "Juan Pérez":
INSERT INTO pacientes (nombre) VALUES ('Juan Pérez');

-- 12. Insertar una historia clínica con diagnóstico "Hipertensión" para el paciente "Juan Pérez":
INSERT INTO historias_clinicas (paciente_id, diagnostico)
    VALUES ((SELECT id FROM pacientes WHERE nombre = 'Juan Pérez'), 'Hipertensión');

-- 13. Insertar dos pacientes adicionales ("Ana Gómez" y "Carlos Ruiz"):
INSERT INTO pacientes (nombre) VALUES ('Ana Gómez'), ('Carlos Ruiz');

-- 14. Añadir historias clínicas para los nuevos pacientes:
-- Para Ana Gómez:
INSERT INTO historias_clinicas (paciente_id, diagnostico)
    VALUES ((SELECT id FROM pacientes WHERE nombre = 'Ana Gómez'), 'Diabetes');
-- Para Carlos Ruiz:
INSERT INTO historias_clinicas (paciente_id, diagnostico)
    VALUES ((SELECT id FROM pacientes WHERE nombre = 'Carlos Ruiz'), 'Alergia');

-- 15. Consultar todas las historias clínicas junto con el nombre del paciente:
SELECT p.nombre, h.diagnostico, h.tratamiento, h.fecha_registro
FROM pacientes p
JOIN historias_clinicas h ON p.id = h.paciente_id;

-- 16. Mostrar todos los pacientes que no tienen historia clínica registrada:
SELECT p.*
FROM pacientes p
LEFT JOIN historias_clinicas h ON p.id = h.paciente_id
WHERE h.paciente_id IS NULL;

-- 17. Actualizar el diagnóstico de "Juan Pérez" a "Hipertensión crónica":
UPDATE historias_clinicas
SET diagnostico = 'Hipertensión crónica'
WHERE paciente_id = (SELECT id FROM pacientes WHERE nombre = 'Juan Pérez');

-- 18. Eliminar la historia clínica de "Carlos Ruiz":
DELETE FROM historias_clinicas
WHERE paciente_id = (SELECT id FROM pacientes WHERE nombre = 'Carlos Ruiz');

-- 19. Consultar la estructura de la tabla historias_clinicas:
DESCRIBE historias_clinicas;
-- También se puede usar: SHOW COLUMNS FROM historias_clinicas;

-- 20. Eliminar las tablas historias_clinicas y pacientes:
DROP TABLE IF EXISTS historias_clinicas;
DROP TABLE IF EXISTS pacientes;

-- 21. Eliminar la base de datos hospital:
DROP DATABASE IF EXISTS hospital;
```