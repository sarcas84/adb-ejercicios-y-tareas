
## Ejercicio 1 (Resuelto)

La siguiente tabla representa una base de datos simplificada para una biblioteca:

| CodLibro | Titulo              | Autor                         | Editorial      | CodLector | NombreLector            | FechaDev     |
|----------|---------------------|-------------------------------|----------------|-----------|-------------------------|--------------|
| 1001     | Variable Compleja   | Murray Spiegel                | McGraw Hill    | 501       | Pérez Gómez, Juan       | 15/04/2014   |
| 1004     | Visual Basic 5      | E. Petroustsos                | Anaya          | 502       | Ríos Terán, Ana         | 17/04/2014   |
| 1005     | Estadística         | Murray Spiegel                | McGraw Hill    | 503       | Roca, René              | 16/04/2014   |
| 1006     | Oracle University   | Nancy Greenberg, Priya Nathan | Oracle Corp.   | 504       | García Roque, Luis      | 20/04/2014   |
| 1007     | Clipper 5.01        | Ramalho                       | McGraw Hill    | 501       | Pérez Gómez, Juan       | 18/04/2014   |
| 1004     | Visual Basic 5      | E. Petroustsos                | Anaya          | 505       | Padrón González, Alicia | 30/04/2014   |

### Primera Forma Normal (1NF)

La clave primaria estaría compuesta por los campos _CodLibro_ y _CodLector_, ya que cada combinación única identifica un préstamo específico de un libro a un lector.

> __Nota__: al elegir como clave primaria _CodLibro_ y _CodLector_, significa que no permitimos que un mismo lector puede sacar el mismo libro más de una vez.

Para cumplir con la _1NF_, descomponemos el nombre del lector en sus componentes atómicos: _Apellido1_, _Apellido2_ y _Nombre_.

Tabla `Biblioteca` en 1NF:

| CodLibro | Titulo              | Autor                          | Editorial      | CodLector | Apellido1 |Apellido2 | Nombre | FechaDev   |
|----------|---------------------|--------------------------------|----------------|-----------|-----------|----------|--------|------------|
| 1001     | Variable Compleja   | Murray Spiegel                 | McGraw Hill    | 501       | Pérez     | Gómez    | Juan   | 15/04/2014 |
| 1004     | Visual Basic 5      | E. Petroustsos                 | Anaya          | 502       | Ríos      | Terán    | Ana    | 17/04/2014 |
| 1005     | Estadística         | Murray Spiegel                 | McGraw Hill    | 503       | Roca      |          | René   | 16/04/2014 |
| 1006     | Oracle University   | Nancy Greenberg, Priya Nathan  | Oracle Corp.   | 504       | García    | Roque    | Luis   | 20/04/2014 |
| 1007     | Clipper 5.01        | Ramalho                        | McGraw Hill    | 501       | Pérez     | Gómez    | Juan   | 18/04/2014 |
| 1004     | Visual Basic 5      | E. Petroustsos                 | Anaya          | 505       | Padrón    | González | Alicia | 30/04/2014 |

Además los valores del campo `Autor` no son atómicos, con lo que creamos distintos registros para crear cada uno de los autores:

| CodLibro | Titulo              | Autor           | Editorial      | CodLector | Apellido1 |Apellido2 | Nombre | FechaDev   |
|----------|---------------------|-----------------|----------------|-----------|-----------|----------|--------|------------|
| 1001     | Variable Compleja   | Murray Spiegel  | McGraw Hill    | 501       | Pérez     | Gómez    | Juan   | 15/04/2014 |
| 1004     | Visual Basic 5      | E. Petroustsos  | Anaya          | 502       | Ríos      | Terán    | Ana    | 17/04/2014 |
| 1005     | Estadística         | Murray Spiegel  | McGraw Hill    | 503       | Roca      |          | René   | 16/04/2014 |
| 1006     | Oracle University   | Nancy Greenberg | Oracle Corp.   | 504       | García    | Roque    | Luis   | 20/04/2014 |
| 1006     | Oracle University   | Priya Nathan    | Oracle Corp.   | 504       | García    | Roque    | Luis   | 20/04/2014 |
| 1007     | Clipper 5.01        | Ramalho         | McGraw Hill    | 501       | Pérez     | Gómez    | Juan   | 18/04/2014 |
| 1004     | Visual Basic 5      | E. Petroustsos  | Anaya          | 505       | Padrón    | González | Alicia | 30/04/2014 |

Este cambio genera una redundancia en la clave primaria (_CodLibro_, _CodLector_), por lo que sigue sin cumplir la _1FN_ por lo que debemos crear una tabla para guardar los `autores`.

Tabla `Biblioteca`:

| CodLibro | Titulo              | Editorial      | CodLector | Apellido1 |Apellido2 | Nombre | FechaDev   |
|----------|---------------------|----------------|-----------|-----------|----------|--------|------------|
| 1001     | Variable Compleja   | McGraw Hill    | 501       | Pérez     | Gómez    | Juan   | 15/04/2014 |
| 1004     | Visual Basic 5      | Anaya          | 502       | Ríos      | Terán    | Ana    | 17/04/2014 |
| 1005     | Estadística         | McGraw Hill    | 503       | Roca      |          | René   | 16/04/2014 |
| 1006     | Oracle University   | Oracle Corp.   | 504       | García    | Roque    | Luis   | 20/04/2014 |
| 1007     | Clipper 5.01        | McGraw Hill    | 501       | Pérez     | Gómez    | Juan   | 18/04/2014 |
| 1004     | Visual Basic 5      | Anaya          | 505       | Padrón    | González | Alicia | 30/04/2014 |

Tabla `Autores`:

| CodLibro | Autor           |
|----------|-----------------|
| 1001     | Murray Spiegel  |
| 1004     | E. Petroustsos  |
| 1005     | Murray Spiegel  |
| 1006     | Nancy Greenberg |
| 1006     | Priya Nathan    |
| 1007     | Ramalho         |

De esta forma solucionamos la redundancia en la clave primaria y cumple la _1FN_.

Claves primarias:
* Tabla `Biblioteca` (_compuesta_): _CodLibro_ y _CodLector_.
* Tabla `Autores`: _CodLibro_.

### Segunda Forma Normal (2NF)

La 2NF elimina las dependencias funcionales.

Análisis de dependencias funcionales:
* _Titulo_ y _Editorial_ dependen solamente de _CodLibro_, ya que estas características pertenecen exclusivamente al libro y no dependen del lector. Esto indica una _dependencia funcional parcial_ con respecto a la clave primaria compuesta (_CodLibro_, _CodLector_).
* _Apellido1_, _Apellido2_ y _Nombre_ dependen solamente de _CodLector_, porque estos datos pertenecen únicamente al lector y no están relacionados directamente con el libro. Esto también es una _dependencia funcional parcial_ respecto a la clave primaria compuesta (_CodLibro_, _CodLector_).
* _FechaDev_ depende _CodLibro_ y _CodLector_, porque estos datos están relacionados con el lector y el libro. Esto es una _dependencia funcional completa_ respecto a la clave primaria compuesta.

Se crean tablas adicionales para los datos de los _libros_, _lectores_ y la _relación préstamo_.

Tabla `Libros`:

| CodLibro | Titulo              | Editorial    |
|----------|---------------------|--------------|
| 1001     | Variable Compleja   | McGraw Hill  |
| 1004     | Visual Basic 5      | Anaya        |
| 1005     | Estadística         | McGraw Hill  |
| 1006     | Oracle University   | Oracle Corp. |
| 1007     | Clipper 5.01        | McGraw Hill  |

Tabla `Lectores`:

| CodLector | Apellido1 | Apellido2 | Nombre |
|-----------|-----------|-----------|--------|
| 501       | Pérez     | Gómez     | Juan   |
| 502       | Ríos      | Terán     | Ana    |
| 503       | Roca      |           | René   |
| 504       | García    | Roque     | Luis   |
| 505       | Padrón    | González  | Alicia |

Tabla `Prestamos`:

| CodLibro | CodLector | FechaDev   |
|----------|-----------|------------|
| 1001     | 501       | 15/04/2014 |
| 1004     | 502       | 17/04/2014 |
| 1005     | 503       | 16/04/2014 |
| 1006     | 504       | 20/04/2014 |
| 1007     | 501       | 18/04/2014 |
| 1004     | 505       | 30/04/2014 |

Recuerda que, anteriormente, ya habíamos generado la tabla `Autores`:

| CodLibro | Autor           |
|----------|-----------------|
| 1001     | Murray Spiegel  |
| 1004     | E. Petroustsos  |
| 1005     | Murray Spiegel  |
| 1006     | Nancy Greenberg |
| 1006     | Priya Nathan    |
| 1007     | Ramalho         |

Ahora sí cumple la _2FN_.

### Tercera Forma Normal (3NF)

No existen  dependencias transitivas:

Tabla `Autores`:
* __Clave primaria__ (compuesta): _CodLibro_ y _Autor_.
* Análisis de dependencias transitivas:
    * `CodLibro → Autor`: _Autor_ depende directamente de _CodLibro_.

En esta tabla, no hay dependencias transitivas porque cada atributo _Autor_ depende únicamente de la clave primaria _CodLibro_ y no de ningún otro atributo intermedio.

Tabla `Libros`:
* __Clave primaria__: _CodLibro_.
* Análisis de dependencias transitivas:
    * `CodLibro → Titulo`: _Titulo_ depende directamente de _CodLibro_.
    * `CodLibro → Editorial`: _Editorial_ depende directamente de _CodLibro_.

En esta tabla, no hay dependencias transitivas porque cada atributo _Titulo_ y _Editorial_ depende únicamente de la clave primaria _CodLibro_ y no de ningún otro atributo intermedio.

Tabla `Lectores`:

* __Clave primaria__: _CodLector_
* Análisis de dependencias transitivas:
    * `CodLector → Apellido1, Apellido2, Nombre`: todos estos atributos dependen directamente de _CodLector_.

No existen dependencias transitivas en esta tabla, ya que cada atributo _Apellido1_, _Apellido2_ y _Nombre_ depende exclusivamente de la clave primaria _CodLector_ y no de ningún otro atributo intermedio.

Tabla `Prestamos`:

* __Clave primaria compuesta__: (_CodLibro_, _CodLector_)
* Análisis de dependencias transitivas:
    * `(CodLibro, CodLector) → FechaDev`: _FechaDev_ depende directamente de la clave primaria compuesta (_CodLibro_, _CodLector_).

En esta tabla, no existen dependencias transitivas porque _FechaDev_ depende completamente de la clave primaria compuesta (_CodLibro_, _CodLector_) y no de ningún otro atributo intermedio.