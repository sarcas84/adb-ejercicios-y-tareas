
## Ejercicio 5. Universidad

- [Esquema SQL](./05-schema.sql)
- [Datos SQL](./05-data.sql)

```
-- 1. Listado con el primer apellido, segundo apellido y el nombre de todos los alumnos, ordenado alfabéticamente
SELECT apellido1, apellido2, nombre
FROM persona
WHERE tipo = 'alumno'
ORDER BY apellido1, apellido2, nombre;

-- 2. Alumnos que no han dado de alta su número de teléfono
SELECT nombre, apellido1, apellido2
FROM persona
WHERE tipo = 'alumno' AND telefono IS NULL;

-- 3. Alumnos nacidos en 1999
SELECT *
FROM persona
WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;

-- 4. Profesores sin teléfono y cuyo NIF termina en 'K'
SELECT *
FROM persona
WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE '%K';

-- 5. Asignaturas del primer cuatrimestre, tercer curso del grado con id 7
SELECT *
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- 6. Nombres de todos los alumnos
SELECT nombre
FROM persona
WHERE tipo = 'alumno';

-- 7. Alumnos que viven en “Madrid”
SELECT *
FROM persona
WHERE tipo = 'alumno' AND ciudad = 'Madrid';

-- 8. Alumnos cuya ciudad comienza por "S"
SELECT *
FROM persona
WHERE tipo = 'alumno' AND ciudad LIKE 'S%';

-- 9. Alumnos que no viven en “Madrid”
SELECT *
FROM persona
WHERE tipo = 'alumno' AND ciudad <> 'Madrid';

-- 10. Total de alumnos
SELECT COUNT(*) AS total_alumnos
FROM persona
WHERE tipo = 'alumno';

-- 11. Número de ciudades diferentes entre los alumnos
SELECT COUNT(DISTINCT ciudad) AS ciudades_diferentes
FROM persona
WHERE tipo = 'alumno';

-- 12. Nombres y ciudades de los alumnos ordenados por ciudad
SELECT nombre, ciudad
FROM persona
WHERE tipo = 'alumno'
ORDER BY ciudad;

-- 13. Número de alumnos por ciudad
SELECT ciudad, COUNT(*) AS total
FROM persona
WHERE tipo = 'alumno'
GROUP BY ciudad;

-- 14. Alumnos cuyo nombre contiene la letra “a”
SELECT *
FROM persona
WHERE tipo = 'alumno' AND nombre LIKE '%a%';

-- 15. Alumnos cuya ciudad tiene exactamente 5 caracteres
SELECT *
FROM persona
WHERE tipo = 'alumno' AND CHAR_LENGTH(ciudad) = 5;

-- 16. Nombre de todos los profesores
SELECT nombre
FROM persona
WHERE tipo = 'profesor';

-- 17. Profesores del departamento 10
SELECT p.*
FROM persona p
JOIN profesor prof ON p.id = prof.id_profesor
WHERE prof.id_departamento = 10;

-- 18. Profesores cuyo nombre empieza por “M”
SELECT *
FROM persona
WHERE tipo = 'profesor' AND nombre LIKE 'M%';

-- 19. Número de profesores por departamento
SELECT id_departamento, COUNT(*) AS total_profesores
FROM profesor
GROUP BY id_departamento;

-- 20. Nombre del profesor con el código más alto
SELECT nombre
FROM persona
WHERE id = (
    SELECT MAX(id_profesor)
    FROM profesor
);

-- 21. Total de profesores
SELECT COUNT(*) AS total_profesores
FROM persona
WHERE tipo = 'profesor';

-- 22. Códigos de departamento distintos de los profesores
SELECT DISTINCT id_departamento
FROM profesor;

-- 23. Nombre de todas las asignaturas de 1er curso
SELECT nombre
FROM asignatura
WHERE curso = 1;

-- 24. Asignaturas del primer cuatrimestre
SELECT *
FROM asignatura
WHERE cuatrimestre = 1;

-- 25. Asignaturas con más de 6 créditos
SELECT *
FROM asignatura
WHERE creditos > 6;

-- 26. Número de asignaturas por curso
SELECT curso, COUNT(*) AS total_asignaturas
FROM asignatura
GROUP BY curso;

-- 27. Asignaturas ordenadas por créditos de mayor a menor
SELECT *
FROM asignatura
ORDER BY creditos DESC;

-- 28. Asignaturas cuyo nombre contiene "Programación"
SELECT *
FROM asignatura
WHERE nombre LIKE '%Programación%';

-- 29. Número total de asignaturas
SELECT COUNT(*) AS total_asignaturas
FROM asignatura;

-- 30. Número total de matrículas registradas
SELECT COUNT(*) AS total_matriculas
FROM alumno_se_matricula_asignatura;
```
