## Ejercicio 2 (Resuelto)

Partimos de una tabla sin normalizar que contiene información sobre órdenes de compra y artículos.

| IdOrden | Fecha     | IdCliente | NombreCliente | TelefonoCliente     | Municipio  | Provincia              | IdArticulo | NombreArticulo | Cantidad | Precio |
|---------|-----------|-----------|---------------|---------------------|------------|------------------------|------------|----------------|----------|--------|
| 2301    | 23/02/14  | 101       | Martin        | 922141423 657659873 | Candelaria | Santa Cruz de Tenerife | 3786       | Red            | 3        | 35,00  |
| 2301    | 23/02/14  | 101       | Martin        | 922141423 657659873 | Candelaria | Santa Cruz de Tenerife | 4011       | Raqueta        | 6        | 65,00  |
| 2301    | 23/02/14  | 101       | Martin        | 922141423 657659873 | Candelaria | Santa Cruz de Tenerife | 9132       | Paq-3          | 8        | 4,75   |
| 2302    | 25/02/14  | 107       | Herman        | 928339463 633987125 | Telde      | Las Palmas             | 5794       | Paq-6          | 4        | 5,00   |
| 2303    | 27/02/14  | 110       | Pedro         | 928388841 798456870 | Telde      | Las Palmas             | 4011       | Raqueta        | 2        | 65,00  |
| 2303    | 27/02/14  | 110       | Pedro         | 928388841 798456870 | Telde      | Las Palmas             | 3141       | Funda          | 2        | 10,00  |

Datos a tener en cuenta:
* el campo _Precio_ indica el valor unitario del producto.

### Primera Forma Normal (1FN)

Para cumplir con la _1NF_, el campo _TelefonoCliente_ no es atómico, así que creamos la tabla `Telefonos`.

Tabla `Ordenes`:

| IdOrden | Fecha     | IdCliente | NombreCliente | Municipio  | Provincia              | IdArticulo  | NombreArticulo  | Cantidad | Precio |
|---------|-----------|-----------|---------------|------------|------------------------|-------------|-----------------|----------|--------|
| 2301    | 23/02/14  | 101       | Martin        | Candelaria | Santa Cruz de Tenerife | 3786        | Red             | 3        | 35,00  |
| 2301    | 23/02/14  | 101       | Martin        | Candelaria | Santa Cruz de Tenerife | 4011        | Raqueta         | 6        | 65,00  |
| 2301    | 23/02/14  | 101       | Martin        | Candelaria | Santa Cruz de Tenerife | 9132        | Paq-3           | 8        | 4,75   |
| 2302    | 25/02/14  | 107       | Herman        | Telde      | Las Palmas             | 5794        | Paq-6           | 4        | 5,00   |
| 2303    | 27/02/14  | 110       | Pedro         | Telde      | Las Palmas             | 4011        | Raqueta         | 2        | 65,00  |
| 2303    | 27/02/14  | 110       | Pedro         | Telde      | Las Palmas             | 3141        | Funda           | 2        | 10,00  |

Tabla `Telefonos`:

| IdCliente | TelefonoCliente |
|-----------|-----------------|
| 101       | 922141423       |
| 101       | 657659873       |
| 107       | 928339463       |
| 107       | 633987125       |
| 110       | 928388841       |
| 110       | 798456870       |

Claves primarias:

* Tabla `Ordenes`: compuesta por los campos _IdOrden_ y _IdArticulo_, ya que cada combinación única de estos campos identifica una orden de compra.
* Tabla `Telefonos`: compuesta por los campos _IdCliente_ y _TelefonoCliente_.

Las tablas `Ordenes` y `Telefonos` cumplen con la _1FN_ ya que todos los valores son atómicos.

### Segunda Forma Normal (2FN)

Para cumplir con la _2FN_, eliminamos las dependencias funcionales:
* Tabla `Ordenes`:
    * _NombreArticulo_ y _Precio_ dependen exclusivamente de _IdArticulo_, no de _IdOrden_. Esto significa que _NombreArticulo_ y _Precio_ tienen una dependencia parcial respecto a la clave compuesta (_IdOrden_, _IdArticulo_).
    * _NombreCliente_, _Municipio_ y _Provincia_ dependen exclusivamente de _IdCliente_. Esto significa que _NombreCliente_, _Municipio_ y _Provincia_ tienen una dependencia parcial respecto a la clave compuesta (_IdOrden_, _IdArticulo_).
    * _Fecha_ depende de _IdOrden y de _IdCliente_. Esto significa que _Fecha_ tiene una dependencia completa respecto a la clave compuesta (_IdOrden_, _IdArticulo_).
    * _Cantidad_ depende de _IdOrden_ y _IdArticulo_. Esto significa que _Cantidad_ tiene una dependencia parcial respecto a la clave compuesta (_IdOrden_, _IdArticulo_).
* Tabla `Telefonos`:
    * _TelefonoCliente_ depende exclusivamente de _IdCliente_, tienen una dependencia funcional completa respecto a la clave primaria _IdCliente_).

Para eliminar las dependencias funcionales creamos las tablas `Articulos` y `Clientes`.

Tabla `Articulos`:

| IdArticulo  | NombreArticulo  | Precio |
|-------------|-----------------|--------|
| 3786        | Red             | 35,00  |
| 4011        | Raqueta         | 65,00  |
| 9132        | Paq-3           | 4,75   |
| 5794        | Paq-6           | 5,00   |
| 3141        | Funda           | 10,00  |

Clave primaria: _IdArticulo_.

Tabla `Clientes`:

| IdCliente | NombreCliente | Municipio  | Provincia              |
|-----------|---------------|------------|------------------------|
| 101       | Martin        | Candelaria | Santa Cruz de Tenerife |
| 107       | Herman        | Telde      | Las Palmas             |
| 110       | Pedro         | Telde      | Las Palmas             |

Clave primaria: _IdCliente_.

Tabla `Ordenes`:

| IdOrden | Fecha     | IdCliente |
|---------|-----------|-----------|
| 2301    | 23/02/14  | 101       |
| 2302    | 25/02/14  | 107       |
| 2303    | 27/02/14  | 110       |

Clave primaria: _IdOrden_.

> __Nota__: es necesario añadir el campo _IdCliente_ para poder relacionar la orden de compra con el cliente.

Tabla `DetalleOrdenes`:

| IdOrden | IdArticulo | Cantidad |
|---------|------------|----------|
| 2301    | 3786       | 3        |
| 2301    | 4011       | 6        |
| 2301    | 9132       | 8        |
| 2302    | 5794       | 4        |
| 2303    | 4011       | 2        |
| 2303    | 3141       | 2        |

Clave primaria: _IdOrden_ y _IdArticulo_.

Tabla `Telefonos`(Calculada en la 1FN):

| IdCliente | TelefonoCliente |
|-----------|-----------------|
| 101       | 922141423       |
| 101       | 657659873       |
| 107       | 928339463       |
| 107       | 633987125       |
| 110       | 928388841       |
| 110       | 798456870       |

Clave primaria: _IdCliente_ y _TelefonoCLiente_.

Ahora sí cumple la _2FN_.

### Tercera Forma Normal (3FN)

Análisis de dependencias transitivas:

* Tabla `Clientes`: en esta tabla, existe una dependencia transitiva entre `NombreCliente → Municipio → Provincia`, con lo que crearemos la Tabla `Provincias`.

Tabla `Clientes`:

| IdCliente | NombreCliente | Municipio  |
|-----------|---------------|------------|
| 101       | Martin        | Candelaria |
| 107       | Herman        | Telde      |
| 110       | Pedro         | Telde      |

Clave primaria: _IdCliente_.

Tabla `Provincias`:

| Municipio  | Provincia              |
|------------|------------------------|
| Candelaria | Santa Cruz de Tenerife |
| Telde      | Las Palmas             |

Clave primaria: _Municipio_.

Ahora sí cumple la _3FN_.

### Ajuste de Normalización: eliminar redundancia del campo Municipio en la tabla Clientes y del campo Provincia en la tabla Provincias

En el caso del campo `Municipio` que se encuentra en ambas tablas `Clientes` y `Provincias`. Para eliminar la duplicación de información:
* Descomponer la tabla para que `Clientes` almacene solamente la información exclusiva del cliente y utilice una clave foránea (_IdMunicipio_) para relacionarse con una tabla independiente llamada `Municipios`. Así, si necesitas actualizar el municipio, puedes hacerlo en un solo lugar.
* Al separar _Municipio_ y _Provincia_ en la tabla `Provincias`, eliminamos la redundancia y mantenemos la información normalizada. La tabla `Clientes` tendrá ahora solo el identificador de _IdMunicipio_, que actúa como clave foránea y permite una relación con la tabla `Municipios`.

En el caso del campo `Provincia` que se encuentra en la tabla `Provincias`. Para eliminar la duplicación de información:
* Modificar la tabla `Municipios` para que utilice una clave foránea (_IdMunicipio_) un identificador (_IdProvincia_) para relacionarse con la tabla independiente llamada `Provincias`. Así, si necesitas actualizar la provincia de un municipio, puedes hacerlo en un solo lugar.
* Al añadir la clave foránea (_IdProvincia_) en la tabla `Municipios`, eliminamos la redundancia y mantenemos la información normalizada. La tabla `Municipios` tendrá ahora solo el identificador de _IdProvincia_, que actúa como clave foránea y permite una relación con la tabla `Provincias`.

Tabla `Clientes`:

| IdCliente | NombreCliente | IdMunicipio |
|-----------|---------------|-------------|
| 101       | Martin        | 1           |
| 107       | Herman        | 2           |
| 110       | Pedro         | 2           |

Clave primaria: _IdCliente_.

Tabla `Provincias`:

| IdProvincia | Provincia              |
|-------------|------------------------|
| 1           | Santa Cruz de Tenerife |
| 2           | Las Palmas             |

Clave primaria: _IdProvincia_.

Tabla `Municipios`:

| IdMunicipio | Municipio   | IdProvincia |
|-------------|-------------|-------------|
| 1           | Candelaria  | 1           |
| 2           | Telde       | 2           |

Clave primaria: _IdMunicipio_.
