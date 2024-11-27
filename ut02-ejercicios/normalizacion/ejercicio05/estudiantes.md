## Ejercicio 5

En una universidad, se lleva un registro de cursos, estudiantes y sus calificaciones.

| RegistroID | EstudianteID | NombreEstudiante | Cursos                   | Profesor        | Notas          | Departamento |
|------------|--------------|------------------|--------------------------|-----------------|----------------|--------------|
| 1          | 201          | Alicia           | "Matemáticas, Física"    | "Dr. Pérez"     | "85, 90"       | Ciencias     |
| 2          | 202          | Roberto          | "Matemáticas, Química"   | "Dr. Pérez"     | "78, 88"       | Ciencias     |
| 3          | 203          | Julia            | "Historia, Literatura"   | "Dr. Gómez"     | "92, 80"       | Humanidades  |
| 4          | 204          | Mario            | "Química"                | "Dr. Pérez"     | "75"           | Ciencias     |


### Primera Forma Normal (1FN)

Separar los valores no atómicos en filas individuales:

| RegistroID | EstudianteID | NombreEstudiante | Curso         | Profesor    | Nota | Departamento |
|------------|--------------|------------------|---------------|-------------|------|--------------|
| 1          | 201          | Alicia           | Matemáticas   | Dr. Pérez   | 85   | Ciencias     |
| 1          | 201          | Alicia           | Física        | Dr. Pérez   | 90   | Ciencias     |
| 2          | 202          | Roberto          | Matemáticas   | Dr. Pérez   | 78   | Ciencias     |
| 2          | 202          | Roberto          | Química       | Dr. Pérez   | 88   | Ciencias     |
| 3          | 203          | Julia            | Historia      | Dr. Gómez   | 92   | Humanidades  |
| 3          | 203          | Julia            | Literatura    | Dr. Gómez   | 80   | Humanidades  |
| 4          | 204          | Mario            | Química       | Dr. Pérez   | 75   | Ciencias     |

Clave primaria: _RegistroID_, _Curso_

### Segunda Forma Normal (2FN)

__Identificación de dependencias funcionales:__
    *EstudianteID → NombreEstudiante (el nombre depende del ID del estudiante).
    *Curso → Profesor, Departamento (la información del curso depende únicamente del curso).
    *(EstudianteID, Curso) → Nota (las notas dependen de la combinación de estudiante y curso).
__Paso 2: Crear tablas para eliminar dependencias parciales.__
Se crean tablas para Estudiantes, Cursos y Notas.

Tabla `Estudiantes`

| EstudianteID | NombreEstudiante |
|--------------|------------------|
| 201          | Alicia           |
| 202          | Roberto          |
| 203          | Julia            |
| 204          | Mario            |

Clave primaria: _EstudianteID_

Tabla `Cursos`

| Curso         | Profesor    | Departamento |
|---------------|-------------|--------------|
| Matemáticas   | Dr. Pérez   | Ciencias     |
| Física        | Dr. Pérez   | Ciencias     |
| Química       | Dr. Pérez   | Ciencias     |
| Historia      | Dr. Gómez   | Humanidades  |
| Literatura    | Dr. Gómez   | Humanidades  |

Clave primaria: _Curso_

Tabla `Notas`

| EstudianteID | Curso         | Nota |
|--------------|---------------|------|
| 201          | Matemáticas   | 85   |
| 201          | Física        | 90   |
| 202          | Matemáticas   | 78   |
| 202          | Química       | 88   |
| 203          | Historia      | 92   |
| 203          | Literatura    | 80   |
| 204          | Química       | 75   |

Clave primaria compuesta: _EstudianteID_, _Curso_

## Tercera Forma Normal (3FN)

No existen dependencias transitivas. Las tablas ya cumplen con la 3FN.