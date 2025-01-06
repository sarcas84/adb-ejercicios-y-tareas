-- Crear la base de datos solo si no existe
CREATE DATABASE IF NOT EXISTS tienda;

-- Seleccionar la base de datos
USE tienda;

-- Crear la tabla `clientes` solo si no existe
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    correo VARCHAR(100)
);

-- Insertar 50 registros en la tabla `clientes`
INSERT INTO clientes (nombre, correo) VALUES
('Carlos Mendoza', 'cmendoza@example.com'),
('Ana López', 'analopez@example.com'),
('Luis Fernández', 'lfernandez@example.com'),
('María Torres', 'mtorres@example.com'),
('Javier Pérez', 'jperez@example.com'),
('Elena Gómez', 'egomez@example.com'),
('Diego Ramírez', 'dramirez@example.com'),
('Claudia Sánchez', 'csanchez@example.com'),
('Hugo Martín', 'hmartin@example.com'),
('Lucía Díaz', 'ldiaz@example.com'),
('Manuel Castro', 'mcastro@example.com'),
('Patricia Ruiz', 'pruiz@example.com'),
('Raúl Ortiz', 'rortiz@example.com'),
('Carmen Herrera', 'cherrera@example.com'),
('Andrés Moreno', 'amoreno@example.com'),
('Laura Vega', 'lvega@example.com'),
('Miguel Domínguez', 'mdominguez@example.com'),
('Sara García', 'sgarcia@example.com'),
('Adrián Gil', 'agil@example.com'),
('Paula Campos', 'pcampos@example.com'),
('Isabel Ríos', 'irios@example.com'),
('Ricardo López', 'rlopez@example.com'),
('Cristina Serrano', 'cserrano@example.com'),
('Pablo Delgado', 'pdelgado@example.com'),
('Valeria Núñez', 'vnunez@example.com'),
('Fernando Álvarez', 'falvarez@example.com'),
('Sofía Márquez', 'smarquez@example.com'),
('David Méndez', 'dmendez@example.com'),
('Julia Flores', 'jflores@example.com'),
('Daniel Castillo', 'dcastillo@example.com'),
('Alejandra Ramos', 'aramos@example.com'),
('Iván Salas', 'isalas@example.com'),
('Carolina Medina', 'cmedina@example.com'),
('Alberto Aguirre', 'aaguirre@example.com'),
('Verónica Guzmán', 'vguzman@example.com'),
('Juan Cárdenas', 'jcardenas@example.com'),
('Marta Paredes', 'mparedes@example.com'),
('Esteban Molina', 'emolina@example.com'),
('Natalia Varela', 'nvarela@example.com'),
('Óscar Gutiérrez', 'ogutierrez@example.com'),
('Clara Suárez', 'csuarez@example.com'),
('Felipe León', 'fleon@example.com'),
('Marisol Morales', 'mmorales@example.com'),
('Guillermo Peña', 'gpena@example.com'),
('Rosa Vargas', 'rvargas@example.com'),
('Camila Espinosa', 'cespinosa@example.com'),
('Francisco Cortés', 'fcortes@example.com'),
('Lorena Santamaría', 'lsantamaria@example.com'),
('Ángel Romero', 'aromero@example.com');

-- Consultar todos los clientes
SELECT * FROM clientes;