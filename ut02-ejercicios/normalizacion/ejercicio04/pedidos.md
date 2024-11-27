## Ejercicio 4

Una tienda de suministros almacena los datos de sus pedidos en la siguiente tabla Pedidos

| PedidoID | FechaPedido | ClienteID | ClienteNombre | ProductoID | ProductoNombre | Cantidad | PrecioUnitario |
|----------|-------------|-----------|---------------|------------|----------------|----------|----------------|
| 301      | 05/04/2023  | 501       | Juan          | 1001       | Lápiz          | 10       | 0.5            |
| 301      | 05/04/2023  | 501       | Juan          | 1002       | Cuaderno       | 5        | 1.5            |
| 302      | 06/04/2023  | 502       | María         | 1003       | Bolígrafo      | 8        | 0.8            |
| 303      | 07/04/2023  | 503       | Luis          | 1001       | Lápiz          | 12       | 0.5            |
| 303      | 07/04/2023  | 503       | Luis          | 1004       | Borrador       | 4        | 0.3            |


### Primera Forma Normal (1FN)

Esta tabla ya cumple con la 1FN, pues todos los valores son atómicos.

Clave primaria: _PedidoID_, _ProductoID_ (una combinación única identifica cada fila).

### Segunda Forma Normal (2FN)

__Identificación de dependencias funcionales:__
    *ClienteID → ClienteNombre (los datos del cliente dependen de su ID).
    *ProductoID → ProductoNombre, *PrecioUnitario (los datos del producto dependen de su ID).
    *PedidoID → FechaPedido, ClienteID (la fecha y cliente dependen del ID del pedido).
__Paso 2: Crear tablas para eliminar dependencias parciales.__
Se crean tablas para Clientes, Productos, Pedidos y DetallePedidos.

Tabla `Clientes`

| ClienteID | ClienteNombre |
|-----------|---------------|
| 501       | Juan          |
| 502       | María         |
| 503       | Luis          |

Clave primaria: _ClienteID_

Tabla `Productos`

| ProductoID | ProductoNombre | PrecioUnitario |
|------------|----------------|----------------|
| 1001       | Lápiz          | 0.5            |
| 1002       | Cuaderno       | 1.5            |
| 1003       | Bolígrafo      | 0.8            |
| 1004       | Borrador       | 0.3            |

Clave primaria: _ProductoID_

Tabla `Pedidos`

| ProductoID | ProductoNombre | PrecioUnitario |
|------------|----------------|----------------|
| 1001       | Lápiz          | 0.5            |
| 1002       | Cuaderno       | 1.5            |
| 1003       | Bolígrafo      | 0.8            |
| 1004       | Borrador       | 0.3            |

Clave primaria: _PedidoID_

Tabla `DetallePedidos`

| PedidoID | ProductoID | Cantidad |
|----------|------------|----------|
| 301      | 1001       | 10       |
| 301      | 1002       | 5        |
| 302      | 1003       | 8        |
| 303      | 1001       | 12       |
| 303      | 1004       | 4        |

Clave primaria compuesta: _PedidoID_, _ProductoID_

### Tercera Forma Normal (3FN)

No existen dependencias transitivas, por lo que las tablas ya cumplen con la 3FN.