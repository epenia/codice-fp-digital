### Ejercicio B: Catálogo de Marcas y Logotipos

**Basado en:** `coches_marcas.xml`

Define la estructura raíz `<catalogo_automocion>`:

- **Identificadores:** El atributo `id` de `<marca>` debe ser único y obligatorio (tipo `xs:ID`).

- **Tipos Complejos con Atributos:** El elemento `<logotipos>` debe contener un elemento `<formato>` que sea vacío pero que tenga atributos obligatorios: `formato`, `color_primario` (que debe validar un código hexadecimal como #0096FF) y `historia`.

- **Ocurrencias:** Una marca puede tener uno o más elementos `<modelo>`.