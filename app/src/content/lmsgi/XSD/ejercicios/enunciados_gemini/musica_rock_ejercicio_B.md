### Ejercicio B: Álbumes y Metadatos de Canciones

**Basado en:** `musica_rock.xml`

Define la estructura de `<album>` y `<canción>`:

- **Tipos Numéricos y Tiempo:** El elemento `<metadata_musical>` tiene un atributo `tiempo_bpm`. Define este valor como un entero entre 40 y 250.

- **Secuencias complejas:** El elemento `<canción>` debe contener obligatoriamente los elementos `<compositor>`, `<estilo>` e `<instrumentacion>`, en ese orden estricto.

- **Uso de Mixed Content:** Si el elemento `<nota_histórica>` pudiera contener texto y otros elementos (como negritas), defínelo como `mixed="true"`.