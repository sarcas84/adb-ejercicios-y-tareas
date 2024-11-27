## Ejercicio 5

A partir del siguiente enunciado diseñar el modelo entidad-relación.

Una clínica necesita llevar un control informatizado de su gestión de pacientes y médicos.

De cada paciente se desea guardar el código, nombre, apellidos, dirección, población, provincia, código postal, teléfono y fecha de nacimiento.

De cada médico se desea guardar el código, nombre, apellidos, teléfono y especialidad.

Se desea llevar el control de cada uno de los ingresos que el paciente hace en el hospital. Cada ingreso que realiza el paciente queda registrado en la base de datos. De cada ingreso se guarda el código de ingreso (que se incrementará automáticamente cada vez que el paciente realice un ingreso), el número de habitación y cama en la que el paciente realiza el ingreso y la fecha de ingreso.

Un médico puede atender varios ingresos, pero un ingreso solamente puede ser atendido por un único médico. Un paciente puede realizar varios ingresos en el hospital.

![clinica](image.png)