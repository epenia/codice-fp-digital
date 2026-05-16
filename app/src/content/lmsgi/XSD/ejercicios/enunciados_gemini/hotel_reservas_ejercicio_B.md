### Ejercicio B: Gestión de Reservas y Clientes

**Basado en:** `hotel_reservas.xml`

Crea el esquema para `<reserva>`:

- **Identificadores Cruzados:** El atributo `id` de `<cliente>` debe ser la clave primaria, y el atributo `ref_id` dentro de `<servicio>` (en la estancia) debe hacer referencia a un servicio existente.

- **Patrón de Documento:** El elemento `<documento_identidad>` debe seguir el patrón de ocho números seguidos de una letra (estilo DNI español) o el formato "DNI-" seguido de 8 dígitos.

- **Estructura de Facturación:** El elemento `<resumen_facturacion>` debe contener una secuencia obligatoria de `subtotal_estadia`, `impuesto_turistico` y `coste_total`.