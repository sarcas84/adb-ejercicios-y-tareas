
## Ejercicio 1: Usuarios y Direcciones (Relación Uno a Uno 1:1).

```
-- 1. Crear la base de datos usuarios_db con collation utf8mb4_unicode_ci:
CREATE DATABASE usuarios_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Modificar la base de datos usuarios_db para cambiar su collation a utf8mb4_general_ci:
ALTER DATABASE usuarios_db COLLATE utf8mb4_general_ci;

-- Seleccionar la base de datos:
USE usuarios_db;

-- 3. Crear la tabla usuarios con los campos id (auto incremental, clave primaria) y nombre (VARCHAR(100) no nulo):
CREATE TABLE usuarios (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- 4. Crear la tabla direcciones donde cada usuario tiene una única dirección:
CREATE TABLE direcciones (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED UNIQUE,
    direccion VARCHAR(255) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

-- 5. Modificar la tabla direcciones para cambiar la clave primaria y hacer que usuario_id sea clave primaria y clave foránea a la vez:
ALTER TABLE direcciones 
    DROP PRIMARY KEY, 
    DROP COLUMN id,
    ADD PRIMARY KEY (usuario_id);
-- Nota: Se elimina la columna id y se establece usuario_id como clave primaria, manteniendo su condición de clave foránea.

-- 6. Cambiar el tamaño del campo nombre en la tabla usuarios a 150 caracteres:
ALTER TABLE usuarios 
    MODIFY COLUMN nombre VARCHAR(150) NOT NULL;

-- 7. Agregar una nueva columna telefono de tipo VARCHAR(15) después del campo nombre en usuarios:
ALTER TABLE usuarios 
    ADD COLUMN telefono VARCHAR(15) AFTER nombre;

-- 8. Cambiar el tipo de dato de telefono en usuarios para que sea BIGINT:
ALTER TABLE usuarios 
    MODIFY COLUMN telefono BIGINT;

-- 9. Eliminar la columna telefono de la tabla usuarios:
ALTER TABLE usuarios 
    DROP COLUMN telefono;

-- 10. Insertar un usuario llamado "Juan Pérez":
INSERT INTO usuarios (nombre) VALUES ('Juan Pérez');

-- 11. Insertar una dirección "Calle Mayor 123" para el usuario "Juan Pérez":
INSERT INTO direcciones (usuario_id, direccion) 
    VALUES ((SELECT id FROM usuarios WHERE nombre = 'Juan Pérez'), 'Calle Mayor 123');

-- 12. Insertar dos usuarios adicionales ("Ana Gómez" y "Carlos Ruiz"):
INSERT INTO usuarios (nombre) VALUES ('Ana Gómez'), ('Carlos Ruiz');

-- 13. Añadir direcciones para los nuevos usuarios:
-- Para Ana Gómez:
INSERT INTO direcciones (usuario_id, direccion)
    VALUES ((SELECT id FROM usuarios WHERE nombre = 'Ana Gómez'), 'Calle Falsa 456');
-- Para Carlos Ruiz:
INSERT INTO direcciones (usuario_id, direccion)
    VALUES ((SELECT id FROM usuarios WHERE nombre = 'Carlos Ruiz'), 'Avenida Siempre Viva 742');

-- 14. Consultar todas las direcciones junto con el nombre del usuario:
SELECT u.nombre, d.direccion
FROM usuarios u
JOIN direcciones d ON u.id = d.usuario_id;

-- 15. Mostrar todos los usuarios que no tienen dirección registrada:
SELECT u.*
FROM usuarios u
LEFT JOIN direcciones d ON u.id = d.usuario_id
WHERE d.usuario_id IS NULL;

-- 16. Actualizar la dirección de "Juan Pérez" a "Avenida Central 456":
UPDATE direcciones
SET direccion = 'Avenida Central 456'
WHERE usuario_id = (SELECT id FROM usuarios WHERE nombre = 'Juan Pérez');

-- 17. Eliminar la dirección de "Carlos Ruiz":
DELETE FROM direcciones
WHERE usuario_id = (SELECT id FROM usuarios WHERE nombre = 'Carlos Ruiz');

-- 18. Consultar la estructura de la tabla direcciones:
DESCRIBE direcciones;
-- O alternativamente: SHOW COLUMNS FROM direcciones;

-- 19. Eliminar las tablas direcciones y usuarios:
DROP TABLE IF EXISTS direcciones;
DROP TABLE IF EXISTS usuarios;

-- 20. Eliminar la base de datos usuarios_db:
DROP DATABASE IF EXISTS usuarios_db;

```