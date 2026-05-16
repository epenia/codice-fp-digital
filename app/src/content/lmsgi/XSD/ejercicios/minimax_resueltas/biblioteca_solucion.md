# Solución: Ejercicio Biblioteca - Catálogo de Libros

## Análisis del Enunciado

El ejercicio requiere crear un XSD que valide la estructura de un catálogo bibliográfico. Analizando los archivos de XML de referencia, hemos identificado los siguientes elementos clave:

### Estructura Principal
- Elemento raíz: `biblioteca` con tres atributos obligatorios
- Elemento único de tareas bibliográficas
- Elementos `libro` que pueden repetirse

### Elementos y Atributos Clave

1. **Atributos del elemento raíz**:
   - `catalogo_general`: Identificador del catálogo general
   - `fecha_última_actualización`: Fecha en formato YYYY-MM-DD
   - `bibliotecario`: Nombre del bibliotecario responsable

2. **Estructura del libro**:
   - Información ISBN con validación de tipo
   - Metadatos del libro
   - Estructura de contenido con capítulos e índices
   - Información de autores con colaboraciones

## Decisiones de Diseño del XSD

### 1. Elemento Raíz y Atributos Obligatorios

**Decisión**: Usar `elementFormDefault="qualified"` para exigir que todos los elementos estén declarados y atributos se declaren en elementos, no directamente en el documento.

```xml
<xs:element name="biblioteca">
    <xs:complexType>
        <!-- Atributos obligatorios con use="required" -->
        <xs:attribute name="catalogo_general" type="xs:string" use="required"/>
        <xs:attribute name="fecha_última_actualización" type="xs:date" use="required"/>
        <xs:attribute name="bibliotecario" type="xs:string" use="required"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: El atributo `date` de XML Schema requiere formato específico (YYYY-MM-DD), mientras que `string` permite cualquier texto. Esto garantiza consistencia en los datos.

### 2. Elemento tarea_bibliografica

**Decisión**: Crear un `simpleType` para los valores permitidos en `tipo` y `estado`.

```xml
<xs:simpleType name="TipoTarea">
    <xs:restriction base="xs:string">
        <xs:enumeration value="Catalogación Completa"/>
        <xs:enumeration value="Revisión"/>
        <xs:enumeration value="Actualización"/>
    </xs:restriction>
</xs:simpleType>

<xs:simpleType name="EstadoTarea">
    <xs:restriction base="xs:string">
        <xs:enumeration value="Pendiente"/>
        <xs:enumeration value="En Proceso"/>
        <xs:enumeration value="Completada"/>
    </xs:restriction>
</xs:simpleType>
```

**Justificación**: En lugar de enumeraciones simples, usamos `simpleType` porque el XSD puede tener múltiples elementos con los mismos valores restrictivos.

### 3. Atributos ISBN

**Decisión**: Usar `xs:string` en lugar de `xs:decimal` para ISBN.

**Justificación**: Los ISBN pueden contener caracteres especiales como guiones y pueden tener diferentes longitudes (ISBN-10 vs ISBN-13).

### 4. Elemento isbn_valido

**Decisión**: Crear un simple type para valores booleanos en texto.

```xml
<xs:simpleType name="ValidacionBooleana">
    <xs:restriction base="xs:string">
        <xs:enumeration value="si"/>
        <xs:enumeration value="no"/>
    </xs:restriction>
</xs:simpleType>
```

**Justificación**: El XML usa "si/no" en minúsculas, no "true/false".

### 5. Metadatos y Publicación

**Decisión**: Para tirada_estimada usar `xs:nonNegativeInteger`.

**Justificación**: Una tirada no puede ser negativa ni cero, así que usamos `nonNegativeInteger` en vez de `integer`.

### 6. Estructura de Contenido

**Decisión**: Separar capítulos e índices en elementos distintos.

```xml
<xs:element name="capitulo" maxOccurs="unbounded">
    <xs:complexType>
        <xs:attribute name="numero_inicio" type="xs:nonNegativeInteger"/>
        <xs:attribute name="numero_fin" type="xs:nonNegativeInteger"/>
        <xs:attribute name="titulo_general" type="xs:string"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: Los números de capítulo comienzan en 0 o en negativo son inválidos. Usamos `nonNegativeInteger`.

### 7. Tipos de Género

**Decisión**: Añadir un simpleType para prioridad de género.

```xml
<xs:simpleType name="PrioridadGénero">
    <xs:restriction base="xs:string">
        <xs:enumeration value="Alto"/>
        <xs:enumeration value="Medio"/>
        <xs:enumeration value="Bajo"/>
    </xs:restriction>
</xs:simpleType>
```

**Justificación**: Valores restringidos para mantener consistencia en toda la colección.

### 8. Autorías y Colaboraciones

**Decisión**: Hacer `nacionalidad` opcional (sin `use="required"`).

**Justificación**: En el XML de ejemplo, algunos autores pueden no tener nacionalidad especificada.

## Consideraciones Especiales

### 1. Orden de los Elementos

El XSD define el orden de los elementos para coincidir con el XML. XML Schema valida tanto la estructura como el orden.

### 2. maxOccurs="unbounded"

Usado para:
- Elementos `libro` (varios libros por tarea)
- Elementos `capitulo` (varios capítulos)
- Elementos `indice` dentro de índices_clave
- Elementos `autor` (varios autores por libro)
- Elementos `genero_secundario`

### 3. minOccurs="0"

Solo usado donde el XML claramente permite ausencia (aunque en este caso raro).

### 4. Tipos de Datos Combinados

Para elementos con contenido y atributos (como `publicacion`), usamos:

```xml
<xs:complexType>
    <xs:sequence>...</xs:sequence> <!-- Elementos hijos (none) -->
    <xs:attribute name="anio" .../>
    <!-- otros atributos -->
</xs:complexType>
```

**Justificación**: Esto permite tener un elemento que solo tiene atributos.

## Validación de Restricciones

### Atributos Restrictivos

1. **isbn_valido**: Solo "si" o "no"
2. **prioridad**: Solo "Alto", "Medio", "Bajo"
3. **isbn_tipo**: Solo "ISBN-10" o "ISBN-13"

**Justificación**: Esto previene errores de entrada y asegura consistencia en la colección de datos.

## Conclusión

El XSD define completamente la estructura del catálogo bibliográfico, incluyendo:
- Elementos obligatorios y opcionales
- Valores restringidos para atributos
- Tipos de datos apropiados para cada contexto
- Repetición de elementos donde sea apropiado
