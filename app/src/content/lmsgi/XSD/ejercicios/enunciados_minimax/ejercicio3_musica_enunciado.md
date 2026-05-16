# Ejercicio 3: Música Rock - Catálogo de Bandas

## Descripción

Un archivo histórico utiliza documentos XML para catalogar bandas de rock, sus miembros, discográficas, álbumes, canciones, giras y contenido técnico de grabaciones.

## Requisitos del XSD

1. **Elemento raíz**: `catalog` con atributos:
   - `periodo_historico_music` (string, obligatorio)
   - `genero_predominante` (string, obligatorio)

2. **Bandas**: Uno o más elementos `band`. Atributos:
   - `id` (string, obligatorio) - identificador único
   - `nombre` (string, obligatorio)
   - `genero` (string, obligatorio)
   - `fundadores` (string, obligatorio)
   - `activo` (string, obligatorio) - valores: "si", "no"
   - `trayectoria_anos` (string, obligatorio) - ejemplo: "60+", "40+"

3. **Miembros** (obligatorio):
   - `miembro`: puede haber varios. Atributos:
     - `id` (string, obligatorio)
     - `nombre` (string, obligatorio)
     - `rol` (string, obligatorio)
     - `activo` (string, obligatorio) - valores: "si", "no"

4. **Discográfica** (obligatorio):
   - Atributos: `principal` (string), `fondo_catalogo` (string)
   - `album`: puede haber varios. Atributos:
     - `id` (string, obligatorio)
     - `titulo` (string, obligatorio)
     - `anio` (entero positivo, obligatorio)
     - `productor` (string, obligatorio)
     - `formato_original` (string, obligatorio)

5. **Canciones** (dentro de álbum):
   - `canción`: puede haber varias. Atributos:
     - `id` (string, obligatorio)
     - `titulo` (string, obligatorio)
     - `duracion_min` (decimal, obligatorio)
     - `hit_single` (string, obligatorio) - valores: "si", "no"
     - `compositor`: atributos `fuente` (string), `notas_destacadas` (string)
     - `estilo`: atributos `tiempo_sugerido` (string), `complejidad` (string)
     - `instrumentacion`: atributos `sección` (string), `nivel` (string), `tipo` (string)
     - `metadata_musical`: atributo `tipo` (string). Puede tener:
       - Atributos adicionales según tipo: `escala`, `tiempo_bpm`, `etiqueta`, `secciones`, `detalle`, `complejidad_sonora`

6. **Gira destacada** (opcional):
   - Atributos: `nombre` (string), `anio_fecha` (string), `ubicacion` (string)
   - `nota_histórica` (string)
   - `contenido_técnico`:
     - `numero_canciones`: atributos `cantidad` (entero), `repertorio_min` (entero)
     - `dispositivo_grabacion`: atributos `tipo` (string), `calidad_sonido` (string), `máx_canales` (entero)
     - `tiempo_total_horas`: atributos `duracion` (decimal), `duración_estimada_hrs` (decimal)
     - `audiencia_estimada`: atributos `cantidad` (entero), `tipo` (string)

## Archivo XML de referencia

Ver: `musica_rock.xml`

## Tarea

Crea un archivo XSD que valide este tipo de documentos XML, eligiendo los tipos de datos más apropiados para cada elemento y atributo.