### Ejercicio A: Miembros y Roles de la Banda

**Basado en:** `musica_rock.xml`

Define el esquema para `<membreros>`:

- **Restricción de Atributos:** El atributo `activo` en el elemento `<miembro>` es obligatorio y solo acepta 'si' o 'no'.

- **ComplexContent:** Define `<miembro>` como un tipo complejo que solo tiene atributos y no contiene texto ni subelementos.

- **ID obligatorios:** Cada `<miembro>` debe tener un `id` único que empiece por "M" seguido de tres números.