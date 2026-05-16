### Ejercicio A: Control de Metadatos y Géneros

**Basado en:** `biblioteca_libros.xml`

Crea un esquema XSD para el elemento `<metadatos>` que cumpla lo siguiente:

- **SimpleType con Restricciones:** El elemento `<gerenre_principal>` debe tener un atributo `id` que empiece por la letra "G" seguida de tres números (ej. G001).

- **ComplexType:** Define `<generes_secundarios>` como un tipo complejo que contenga una secuencia de elementos `<genero_secundario>`.

- **Atributos Enumerados:** El atributo `prioridad` de `<genero_secundario>` solo puede admitir los valores: 'Alto', 'Medio' o 'Bajo'.

- **Opcionalidad:** El elemento `<publicacion>` es obligatorio, pero el atributo `formato_electronico` debe ser opcional.