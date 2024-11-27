## Ejercicio 3

En una base de datos de una empresa de alquiler de vehículos, se tiene la siguiente tabla Alquileres que contiene información sobre los vehículos alquilados y sus conductores.

| AlquilerID | FechaAlquiler | ClienteID | ClienteNombre | Vehiculos                  | PrecioVehiculos |
|------------|---------------|-----------|---------------|----------------------------|-----------------|
| 101        | 10/03/2023    | 201       | Carlos        | "Sedán, SUV"               | "50, 70"       |
| 102        | 12/03/2023    | 202       | Laura         | "Convertible, Pickup"      | "80, 65"       |
| 103        | 15/03/2023    | 203       | Pedro         | "SUV, Van, Sedán"          | "70, 60, 50"   |
| 104        | 18/03/2023    | 204       | Ana           | "Sedán"                    | "50"           |


### Primera Forma Normal (1NF)

__Paso 1: Eliminar valores no atómicos__
La columna Vehiculos y PrecioVehiculos contiene valores múltiples. Separamos cada combinación en filas individuales.

| AlquilerID | FechaAlquiler | ClienteID | ClienteNombre | Vehiculo      | PrecioVehiculo |
|------------|---------------|-----------|---------------|---------------|----------------|
| 101        | 10/03/2023    | 201       | Carlos        | Sedán         | 50             |
| 101        | 10/03/2023    | 201       | Carlos        | SUV           | 70             |
| 102        | 12/03/2023    | 202       | Laura         | Convertible   | 80             |
| 102        | 12/03/2023    | 202       | Laura         | Pickup        | 65             |
| 103        | 15/03/2023    | 203       | Pedro         | SUV           | 70             |
| 103        | 15/03/2023    | 203       | Pedro         | Van           | 60             |
| 103        | 15/03/2023    | 203       | Pedro         | Sedán         | 50             |
| 104        | 18/03/2023    | 204       | Ana           | Sedán         | 50             |

Clave primaria: _AlquilerID_, _Vehiculo_ 

### Segunda Forma Normal (2FN)

__Identificación de dependencias funcionales:__
    *ClienteID → ClienteNombre (los datos del cliente dependen de ClienteID).
    *Vehiculo → PrecioVehiculo (el precio depende únicamente del tipo de vehículo).
    *AlquilerID → FechaAlquiler (la fecha depende del ID del alquiler).
__Paso 2: Crear tablas para eliminar dependencias parciales.__
Se crean tablas para separar Clientes, Vehiculos y Alquileres.

Tabla `Clientes`

| ClienteID | ClienteNombre |
|-----------|---------------|
| 201       | Carlos        |
| 202       | Laura         |
| 203       | Pedro         |
| 204       | Ana           |

Clave primaria: _ClienteID_

Tabla `Vehiculos`

| Vehiculo      | PrecioVehiculo |
|---------------|----------------|
| Sedán         | 50             |
| SUV           | 70             |
| Convertible   | 80             |
| Pickup        | 65             |
| Van           | 60             |

Clave primaria: _Vehiculo_

Tabla `Alquileres`

| AlquilerID | FechaAlquiler | ClienteID |
|------------|---------------|-----------|
| 101        | 10/03/2023    | 201       |
| 102        | 12/03/2023    | 202       |
| 103        | 15/03/2023    | 203       |
| 104        | 18/03/2023    | 204       |

Clave primaria: _AlquilerID_

Tabla `DetalleAlquiler`

| AlquilerID | Vehiculo      |
|------------|---------------|
| 101        | Sedán         |
| 101        | SUV           |
| 102        | Convertible   |
| 102        | Pickup        |
| 103        | SUV           |
| 103        | Van           |
| 103        | Sedán         |
| 104        | Sedán         |

Clave primaria compuesta: (AlquilerID, Vehiculo).

Tercera Forma Normal (3FN)
Las tablas ya cumplen con la 3FN.