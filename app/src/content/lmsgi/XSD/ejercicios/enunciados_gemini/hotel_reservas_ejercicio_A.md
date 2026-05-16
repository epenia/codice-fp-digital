### Ejercicio A: Sistema de Servicios Globales

**Basado en:** `hotel_reservas.xml`

Define el esquema para `<servicios_globales>`:

- **Booleano Personalizado:** El atributo `inclusión_completa` solo puede ser 'Si' o 'No' (crear un `simpleType` con enumeración).

- **Restricción de Coste:** El atributo `coste_unidad` de `<servicio>` debe validar que, si es un precio numérico, sea mayor que cero.

- **Elementos Vacíos:** Define `<estacionamiento_cubierto>` (similar a `enred` del PDF) como un tipo complejo sin contenido de texto, solo atributos.