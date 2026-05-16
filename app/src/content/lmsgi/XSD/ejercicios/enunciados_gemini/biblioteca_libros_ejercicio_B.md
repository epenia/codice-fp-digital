### Ejercicio B: Estructura de Contenido y Capítulos

**Basado en:** `biblioteca_libros.xml`

Define el esquema para `<estructura_contenido>`:

- **Tipos Numéricos:** El atributo `pagina_rango` de `<pagine_estimadas>` debe ser un número entero positivo.

- **Referencia de Capítulos:** Define `<capitulo>` con atributos `numero_inicio` y `numero_fin`. Ambos deben ser obligatorios.

- **Restricción de Texto:** El elemento `<indice>` dentro de `<indices_clave>` debe tener un atributo `importancia`. Crea un tipo simple para este atributo que solo permita las palabras: 'Máxima', 'Crucial', 'Media' o 'Temática Central'.