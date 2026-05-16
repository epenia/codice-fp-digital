# Ejercicio 1: Biblioteca - Catálogo de Libros

## Descripción

Una biblioteca utiliza documentos XML para gestionar su catálogo de libros. Cada documento contiene información bibliográfica con metadatos de libros, géneros, publicaciones, estructura del contenido, autorías y colaboraciones.

## Requisitos del XSD

1. **Elemento raíz**: `biblioteca` con atributos:
   - `catalogo_general` (string, obligatorio)
   - `fecha_ultima_actualización` (date, obligatorio)
   - `bibliotecario` (string, obligatorio)

2. **Elemento tarea_bibliografica**: Obligatorio, con atributos:
   - `tarea_id` (string, obligatorio) - identificador único
   - `tipo` (string, obligatorio) - valores: "Catalogación Completa", "Revisión", "Actualización"
   - `estado` (string, obligatorio) - valores: "Pendiente", "En Proceso", "Completada"

3. **Elemento libro**: Puede haber uno o más. Atributos:
   - `isbn` (string, obligatorio) - identificador único del libro
   - `isbn_tipo` (string, obligatorio) - valores: "ISBN-10", "ISBN-13"
   - `isbn_valido` (string, obligatorio) - valores: "si", "no"
   - `idioma_original` (string, obligatorio)

4. **Metadatos del libro** (todos obligatorios):
   - `titulo` (string)
   - `genero_principal` con atributo `id` (string)
   - `generos_secundarios`: elemento `genero_secundario` con atributos `prioridad` (Alto/Medio/Bajo), `etiqueta` (string), `grado_temático` (string). Puede haber varios.
   - `publicacion`: atributos `anio` (entero positivo), `editorial` (string), `tirada_estimada` (entero), `formato_físico` (string), `formato_electrónico` (string)

5. **Estructura del contenido**:
   - `páginas_estimadas`: atributos `pagina_rango` (string), `pausas_personales_recomendadas` (Sí/No), `formato_digital` (string)
   - `tema_central`: atributos `tema_clave` (string), `complejidad_conceptual` (string)
     - `capitulo`: atributos `numero_inicio` (entero), `numero_fin` (entero), `titulo_general` (string). Puede haber varios.
     - `indices_clave`: contiene `indice` con atributos `tema` (string), `aparece_capitulos` (string), `importancia` (string)

6. **Autorías**:
   - `autor`: atributos `id_autor` (string, obligatorio), `nombre` (string), `nacionalidad` (string), `nacimientos` (string). Puede haber varios autores por libro.
     - `obra_destacada`: atributo `idioma_ejemplo` (string)
     - `tema_principal` (string)
     - `biografia_breve`: atributo `pagina_referencia` (entero)
     - `colaboraciones`: contiene `colab` con atributos `colaborador` (string), `tipo` (string), `nivel_afinidad` (string)

## Archivo XML de referencia

Ver: `biblioteca_libros.xml`

## Tarea

Crea un archivo XSD que valide este tipo de documentos XML, eligiendo los tipos de datos más apropiados para cada elemento y atributo.