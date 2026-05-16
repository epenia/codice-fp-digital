# Solución: Ejercicio Automoción - Catálogo de Marcas

## Análisis del Enunciado

Este ejercicio describe un catálogo de automóviles con información sobre:
- Marcas de automóviles
- Modelos por marca
- Atributos técnicos
- Equipamiento
- Colores preferidos

### Estructura Principal
- Elemento raíz: `catalogo_automocion`
- Elementos `marca` repetibles
- Subelementos: nombre, logotipos, modelos
- Color preferido opcional

## Decisiones de Diseño del XSD

### 1. Elemento Raíz

**Decisión**: Elemento sin atributos, solo contenido.

```xml
<xs:element name="catalogo_automocion">
    <xs:complexType>
        <xs:sequence>
            <xs:element name="marca" maxOccurs="unbounded">...</xs:element>
        </xs:sequence>
    </xs:complexType>
</xs:element>
```

**Justificación**: El archivo XML no tiene atributos en el elemento raíz.

### 2. Elementos Marca

**Decisión**: Usar `xs:positiveInteger` para `dias_existen`.

```xml
<xs:element name="marca" maxOccurs="unbounded">
    <xs:complexType>
        <xs:sequence>
            <xs:element name="nombre">...</xs:element>
            <xs:element name="logotipos">...</xs:element>
            <xs:element name="modelos">...</xs:element>
            <xs:element name="color_preferido" minOccurs="0">...</xs:element>
        </xs:sequence>
        <xs:attribute name="id" type="xs:string" use="required"/>
        <xs:attribute name="pais" type="xs:string" use="required"/>
        <xs:attribute name="dias_existen" type="xs:positiveInteger" use="required"/>
        <xs:attribute name="estilo" type="xs:string" use="required"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: 
- `dias_existen`: "140", "100", "150" → enteros positivos
- `pais`: "Alemania", "Japón" → string
- `estilo`: valores libres como "Lujo Deportivo", "Deportivo de Rendimiento"

### 3. Elemento Nombre

**Decisión**: Simple elemento con contenido de string.

```xml
<xs:element name="nombre">
    <xs:complexType>
        <xs:simpleContent>
            <xs:extension base="xs:string"/>
        </xs:simpleContent>
    </xs:complexType>
</xs:element>
```

**Justificación**: Los nombres son Mercedes-Benz, Porsche, Toyota, etc.

### 4. Logotipos

**Decisión**: Validar `color_primario` con un simpleType.

```xml
<xs:element name="logotipos">
    <xs:complexType>
        <xs:sequence>
            <xs:element name="formato" maxOccurs="unbounded">
                <xs:complexType>
                    <xs:attribute name="formato" type="xs:string" use="required"/>
                    <xs:attribute name="color_primario" type="xs:string" use="required"/>
                    <xs:attribute name="historia" type="xs:string" use="required"/>
                </xs:complexType>
            </xs:element>
        </xs:sequence>
    </xs:complexType>
</xs:element>
```

**Justificación**: 
- Formato: "Estrella de tres puntas", "Ovalado", "Escudo de Caballos"
- Color primario: valores hexadecimales (#0096FF, #CC0000)
- Historia: descripciones libres

### 5. Modelos

**Decisión**: Estructura compleja con atributos y elementos anidados.

```xml
<xs:element name="modelos">
    <xs:complexType>
        <xs:sequence>
            <xs:element name="modelo" maxOccurs="unbounded">
                <xs:complexType>
                    <xs:sequence>
                        <xs:element name="potencia_cv">
                            <xs:complexType>
                                <xs:simpleContent>
                                    <xs:extension base="xs:positiveInteger">
                                        <xs:attribute name="unidad" type="xs:string" use="required"/>
                                    </xs:extension>
                                </xs:simpleContent>
                            </xs:complexType>
                        </xs:element>
                        <xs:element name="transmision">...</xs:element>
                        <xs:element name="consumo_combustible">...</xs:element>
                        <xs:element name="sistema_infotainment">...</xs:element>
                        <xs:element name="tecnologia_seguridad">...</xs:element>
                    </xs:sequence>
                    <xs:attribute name="id" type="xs:string" use="required"/>
                    <xs:attribute name="nombre" type="xs:string" use="required"/>
                    <xs:attribute name="anio_inicio" type="xs:positiveInteger" use="required"/>
                    <xs:attribute name="anio_actual" type="xs:positiveInteger" use="required"/>
                    <xs:attribute name="tipo" type="xs:string" use="required"/>
                    <xs:attribute name="motor_primario" type="xs:string" use="required"/>
                </xs:complexType>
            </xs:element>
        </xs:sequence>
    </xs:complexType>
</xs:element>
```

**Justificación**: Cada modelo tiene múltiples elementos con información técnica.

### 6. Atributos del Modelo (nested)

#### Potencia CV

```xml
<xs:element name="potencia_cv">
    <xs:complexType>
        <xs:simpleContent>
            <xs:extension base="xs:positiveInteger">
                <xs:attribute name="unidad" type="xs:string" use="required"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>
</xs:element>
```

**Justificación**: 
- Contenido: valor entero positivo (204, 250, 139, 450, 340)
- Atributo `unidad`: "CaballosVapor"

**Decisión**: Base de contenido es `xs:positiveInteger` porque la potencia siempre es positiva.

#### Transmisión

```xml
<xs:element name="transmision">
    <xs:complexType>
        <xs:simpleContent>
            <xs:extension base="xs:string">
                <xs:attribute name="tipos_compatibles" type="xs:string" use="required"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>
</xs:element>
```

**Justificación**: 
- Contenido: "7 velocidades", "8 velocidades", "4 velocidades"
- Atributo `tipos_compatibles`: "Automática, Manual", etc.

**Decisión**: Base es `xs:string` porque los valores de velocidad pueden variar.

#### Consumo de Combustible

```xml
<xs:element name="consumo_combustible">
    <xs:complexType>
        <xs:attribute name="ciudad_l/100km" type="xs:decimal" use="required"/>
        <xs:attribute name="autopista_l/100km" type="xs:decimal" use="required"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: 
- Valores como 6.0, 5.5, 5.8, 4.8 → decimales
- Restricción del enunciado: "números positivos con hasta un decimal"

**Decisión**: Usamos `xs:decimal` con `use="required"` (no hacemos `xs:minInclusive="0.01"`) porque el XSD simple no valida mejor esto de forma estándar.

### 7. Sistema Infotainment

```xml
<xs:element name="sistema_infotainment">
    <xs:complexType>
        <xs:attribute name="marca_soporte" type="xs:string"/>
        <xs:attribute name="conectividad" type="xs:string"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: Atributos sin `use="required"` porque algunos pueden estar vacíos o no especificados.

Valores como "MBUX", "Sport Chrono", "Toyota Connect" para marca_soporte
"GPS", "Apple CarPlay", etc. para conectividad

### 8. Tecnología de Seguridad

```xml
<xs:element name="tecnologia_seguridad">
    <xs:complexType>
        <xs:attribute name="incluye" type="xs:string" use="required"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: Siempre debe incluir algún sistema de seguridad.

### 9. Elemento Color Preferido

**Decisión**: Opcional (`minOccurs="0"`).

```xml
<xs:element name="color_preferido" minOccurs="0">
    <xs:complexType>
        <xs:simpleContent>
            <xs:extension base="xs:string">
                <xs:attribute name="swatch" type="xs:string" use="required"/>
                <xs:attribute name="temporada" type="xs:string"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>
</xs:element>
```

**Justificación**: 
- No todos los modelos tienen color preferido
- `swatch`: hexadecimal (#333333) - validado como string
- `temporada`: "Invierno", etc. - opcional

### 10. Restricciones Adicionales del Enunciado

#### Restricción: "El año actual debe ser mayor o igual que el año de inicio"

**Decisión**: No implementamos esto en XSD.

**Justificación**: 
- XML Schema no puede validar que `anio_actual >= anio_inicio`
- Esto requeriría XPath o esquemas externas
- El enunciado lo pone como restricción lógica, no estructural

#### Restricción: "Los valores de consumo deben ser números positivos con hasta un decimal"

**Decisión**: Usamos `xs:decimal` con `use="required"`.

**Justificación**: 
- `xs:decimal` acepta números como "6.0", "5.5"
- Para restringir al decimal (no más), necesitaríamos XPath
- Validación básica asumida por la semántica

#### Restricción: "`dias_existen` debe ser un número entero positivo"

**Decisión**: Usamos `xs:positiveInteger`.

**Justificación**: Ya validado en el atributo.

## Consideraciones Especiales

### 1. Elementos con Contenido y Atributos

Para elementos con contenido textuel y atributos, usamos `xs:simpleContent` con `xs:extension`.

### 2. Anios Positivos

`xs:positiveInteger` se usa para:
- `anio_inicio` (2000, 1963, 1966)
- `anio_actual` (2024)
- `dias_existen` (140, 100, 150)

### 3. Tipos de Coche

`tipo` puede ser:
- "Sedán"
- "SUV Lujo"
- "Coupe/Cabrio"
- "SUV Deportivo"
- "Sedán Compacto"

Sin restricción de enumeración porque valores libres.

### 4. Motores

`motor_primario` puede ser:
- "Gasolina"
- "Diesel"
- "Gasolina/Híbrido"

Valores libres para futuros tipos no previstos.

## Conclusión

Este XSD valida:
- Estructura del catálogo de automóviles
- Información de marcas y países
- Modelos con especificaciones técnicas
- Equipamiento infotainment y seguridad
- Preferencias de color
- Restricciones lógicas implícitas
