# Solución: Ejercicio Música Rock - Catálogo de Bandas

## Análisis del Enunciado

Este ejercicio describe un catálogo de bandas de rock con información histórica, incluyendo:
- Bandas con su membresía
- Discográficas con sus álbumes
- Canciones con detalles musicales
- Giras con especificaciones técnicas

### Estructura Principal
- `catalog` como elemento raíz
- Elementos `band` repetibles (múltiples bandas)
- `membreros` - miembros de cada banda
- `disquera` - discográficas
- `gira_destacada` - opcional

## Decisiones de Diseño del XSD

### 1. Elemento Raíz: catalog

**Decisión**: Los atributos del elemento raíz son obligatorios.

```xml
<xs:element name="catalog">
    <xs:complexType>
        <xs:sequence>
            <xs:element name="band" maxOccurs="unbounded">...</xs:element>
        </xs:sequence>
        <xs:attribute name="periodo_historico_music" type="xs:string" use="required"/>
        <xs:attribute name="genero_predominante" type="xs:string" use="required"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: Son metadatos esenciales sobre el periodo histórico del catálogo.

### 2. Elementos Band

**Decisión**: Usar `maxOccurs="unbounded"` para permitir múltiples bandas.

```xml
<xs:element name="band" maxOccurs="unbounded">
    <xs:complexType>
        <xs:sequence>
            <xs:element name="membreros">...</xs:element>
            <xs:element name="disquera">...</xs:element>
            <xs:element name="gira_destacada" minOccurs="0">...</xs:element>
        </xs:sequence>
        <xs:attribute name="id" type="xs:string" use="required"/>
        <xs:attribute name="nombre" type="xs:string" use="required"/>
        <xs:attribute name="genero" type="xs:string" use="required"/>
        <xs:attribute name="fundadores" type="xs:string" use="required"/>
        <xs:attribute name="activo" type="xs:string" use="required"/>
        <xs:attribute name="trayectoria_anos" type="xs:string" use="required"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: `activo` puede ser "si" o "no", por lo que no usamos `xs:boolean`.

### 3. Miembros de la Banda

**Decisión**: Los miembros pueden aparecer y desaparecer (actualmente activos/inactivos).

```xml
<xs:element name="miembro" maxOccurs="unbounded">
    <xs:complexType>
        <xs:attribute name="id" type="xs:string" use="required"/>
        <xs:attribute name="nombre" type="xs:string" use="required"/>
        <xs:attribute name="rol" type="xs:string" use="required"/>
        <xs:attribute name="activo" type="xs:string" use="required"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: `activo="no"` para bands o miembros fallecidos, pero el XML sigue el mismo esquema.

### 4. Discográficas

**Decisión**: Los atributos de disquera pueden estar presentes o no.

```xml
<xs:element name="disquera">
    <xs:complexType>
        <xs:sequence>
            <xs:element name="album" maxOccurs="unbounded">...</xs:element>
        </xs:sequence>
        <xs:attribute name="principal" type="xs:string"/>
        <xs:attribute name="fondo_catalogo" type="xs:string"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: No se especifica que estos atributos sean obligatorios, así que no ponemos `use="required"`.

### 5. Álbumes y Canciones

**Decisión**: Las canciones son opcionales dentro de un álbum (`minOccurs="0"`).

```xml
<xs:element name="album" maxOccurs="unbounded">
    <xs:complexType>
        <xs:sequence>
            <xs:element name="canción" minOccurs="0" maxOccurs="unbounded">...</xs:element>
        </xs:sequence>
        <xs:attribute name="id" type="xs:string" use="required"/>
        <xs:attribute name="titulo" type="xs:string" use="required"/>
        <xs:attribute name="anio" type="xs:positiveInteger" use="required"/>
        <xs:attribute name="productor" type="xs:string" use="required"/>
        <xs:attribute name="formato_original" type="xs:string" use="required"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: Un álbum puede no tener canciones en el XML (aunque parece raro).

### 6. Canciones y Metadatos Musicales

**Decisión**: Los metadatos musicales tienen atributos adicionales según el tipo.

```xml
<xs:element name="canción">
    <xs:complexType>
        <xs:sequence>
            <xs:element name="compositor">...</xs:element>
            <xs:element name="estilo">...</xs:element>
            <xs:element name="instrumentacion">...</xs:element>
            <xs:element name="metadata_musical">...</xs:element>
            <xs:element name="estructura_musical" minOccurs="0">...</xs:element>
            <xs:element name="elementos_sonoros" minOccurs="0">...</xs:element>
        </xs:sequence>
        <xs:attribute name="id" type="xs:string" use="required"/>
        <xs:attribute name="titulo" type="xs:string" use="required"/>
        <xs:attribute name="duracion_min" type="xs:decimal" use="required"/>
        <xs:attribute name="hit_single" type="xs:string" use="required"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: La duración puede tener decimales (3.7, 5.5 minutos).

### 7. Metadatos Musicales

**Decisión**: Usar `xs:string` para atributos con valores libres.

```xml
<xs:element name="metadata_musical">
    <xs:complexType>
        <xs:attribute name="tipo" type="xs:string" use="required"/>
        <xs:attribute name="escala"/>
        <xs:attribute name="tiempo_bpm"/>
        <xs:attribute name="etiqueta"/>
        <xs:attribute name="secciones"/>
        <xs:attribute name="detalle"/>
        <xs:attribute name="complejidad_sonora"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: El tipo es obligatorio, pero los demás pueden variar según el contexto.

### 8. Compositor

**Decisión**: Atributos simples de fuente y notas.

```xml
<xs:element name="compositor">
    <xs:complexType>
        <xs:attribute name="fuente" type="xs:string"/>
        <xs:attribute name="notas_destacadas" type="xs:string"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: Estos son datos descriptivos libres.

### 9. Estilo Musical

**Decisión**: Definir tipos de tiempo sugerido y complejidad.

```xml
<xs:element name="estilo">
    <xs:complexType>
        <xs:attribute name="tiempo_sugerido" type="xs:string"/>
        <xs:attribute name="complejidad" type="xs:string"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: Valores como "ritmo cañíva", "balada romántica etérea", "variado de género".

### 10. Instrumentación

**Decisión**: Atributos para sección, nivel y tipo.

```xml
<xs:element name="instrumentacion">
    <xs:complexType>
        <xs:attribute name="sección" type="xs:string"/>
        <xs:attribute name="nivel" type="xs:string"/>
        <xs:attribute name="tipo" type="xs:string"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: Define la configuración de instrumentos para la canción.

### 11. Gira Destacada

**Decisión**: Opcional (`minOccurs="0"`), con estructura técnica.

```xml
<xs:element name="gira_destacada" minOccurs="0">
    <xs:complexType>
        <xs:sequence>
            <xs:element name="contenido_técnico">
                <xs:complexType>
                    <xs:sequence>
                        <xs:element name="numero_canciones">...</xs:element>
                        <xs:element name="dispositivo_grabacion">...</xs:element>
                        <xs:element name="tiempo_total_horas">...</xs:element>
                        <xs:element name="audiencia_estimada">...</xs:element>
                    </xs:sequence>
                </xs:complexType>
            </xs:element>
        </xs:sequence>
        <xs:attribute name="nombre" type="xs:string" use="required"/>
        <xs:attribute name="anio_fecha" type="xs:string"/>
        <xs:attribute name="ubicacion" type="xs:string" use="required"/>
        <xs:attribute name="nota_histórica" type="xs:string"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: Solo algunas bandas tienen giras destacadas.

### 12. Contenido Técnico de Gira

**Decisión**: Elementos con atributos para especificaciones técnicas.

```xml
<xs:element name="dispositivo_grabacion">
    <xs:complexType>
        <xs:attribute name="tipo" type="xs:string"/>
        <xs:attribute name="calidad_sonido" type="xs:string"/>
        <xs:attribute name="máx_canales" type="xs:integer"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: Máximo de canales debe ser entero (24, 32).

### 13. Elementos con Valores Numéricos

**Decisión**: Tipos apropiados para valores numéricos.

- `numero_canciones`: `xs:integer`
- `cantidad` (audiencia): `xs:integer`
- `duracion`: `xs:decimal` (horas con decimales)
- `máx_canales`: `xs:integer`

**Justificación**: Número de canciones y audiencia son enteros, duración son decimales.

## Consideraciones Especiales

### 1. Hierarquía de Elementos
El orden de los elementos es importante:
1. `membreros` (siempre presente)
2. `disquera` (siempre presente)
3. `gira_destacada` (opcional)

### 2. Referencias Cruzadas
`gira_destacada` está dentro de `band`, pero referencia información técnica de contenido.

### 3. Métodos de Grabación
`dispositivo_grabacion` puede ser "Analógica" o "Digital Audio" o "Multitrack Digital".

### 4. Valores de Complejidad
`complejidad` puede ser: "media", "media-alta", "muy alta".

## Conclusión

Este XSD valida:
- Estructura histórica de bandas de rock
- Información de discográficas y álbumes
- Detalles musicales de canciones
- Especificaciones técnicas de giras
- Metadatos de producción musical
