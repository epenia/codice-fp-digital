# Solución: Ejercicio Hotel - Sistema de Reservas

## Análisis del Enunciado

El sistema de gestión hotelera requiere un XSD que valide la estructura de un documento que contiene:
- Servicios globales (comunes a todos los hoteles)
- Múltiples hoteles con sus reservas
- Infraestructura y tipos de habitación por hotel

### Estructura Principal
- Elemento raíz: `hotel_system` con atributos de control
- `servicios_globales`: servicios compartidos
- `hotel*`: múltiples hoteles con sus datos
- `reservas` dentro de cada hotel (opcionales según XML)

## Decisiones de Diseño del XSD

### 1. Elemento Raíz hotel_system

**Decisión**: Los atributos del elemento raíz deben ser obligatorios.

```xml
<xs:attribute name="sistema_gestion" type="xs:string" use="required"/>
<xs:attribute name="fecha_revision" type="xs:date" use="required"/>
```

**Justificación**: Son metadatos esenciales sobre el documento. Usamos `xs:date` para la fecha, que requiere formato YYYY-MM-DD.

### 2. Servicios Globales

**Decisión**: Crear un `simpleType` para el `tipo` de servicio.

```xml
<xs:simpleType name="TipoServicio">
    <xs:restriction base="xs:string">
        <xs:enumeration value="Alimentación"/>
        <xs:enumeration value="Servicios Personales"/>
        <xs:enumeration value="Conectividad"/>
        <xs:enumeration value="Aparcamiento"/>
        <xs:enumeration value="Transporte"/>
    </xs:restriction>
</xs:simpleType>
```

**Justificación**: Restringe los valores a los permitidos por el negocio y previene errores tipográficos.

### 3. Elementos Hotel

**Decisión**: Clase `hotel` con atributos obligatorios.

```xml
<xs:element name="hotel" minOccurs="0" maxOccurs="unbounded">
    <xs:complexType>
        <xs:sequence>
            <xs:element name="infraestructura">...</xs:element>
            <xs:element name="tipos_habitacion">...</xs:element>
            <xs:element name="reservas">...</xs:element>
        </xs:sequence>
        <xs:attribute name="id" use="required"/>
        <xs:attribute name="nombre" use="required"/>
        <xs:attribute name="clasificacion" use="required"/>
        ...
    </xs:complexType>
</xs:element>
```

**Justificación**: `minOccurs="0"` porque en el XML el contenido de `reservas` es opcional, aunque `hotel` mismo siempre aparece.

### 4. Clasificación del Hotel

**Decisión**: Validar los valores de `clasificacion`.

```xml
<xs:simpleType name="ClasificacionHotel">
    <xs:restriction base="xs:string">
        <xs:enumeration value="1 Estrellas"/>
        <xs:enumeration value="2 Estrellas"/>
        <xs:enumeration value="3 Estrellas"/>
        <xs:enumeration value="4 Estrellas"/>
        <xs:enumeration value="5 Estrellas"/>
    </xs:restriction>
</xs:simpleType>
```

**Justificación**: Los hoteles están clasificados en una escala estándar 1-5 estrellas.

### 5. Infraestructura y Departamentos

**Decisión**: Hacer elementos opcionales dentro de los departamentos usando `simpleContent`.

```xml
<xs:element name="departamento">
    <xs:complexType>
        <xs:sequence>...</xs:sequence>
        <!-- Atributos obligatorios -->
        <xs:attribute name="nombre" use="required"/>
        <xs:attribute name="horario_operativo" use="required"/>
        <!-- Atributos opcionales sin use="required" -->
        <xs:attribute name="capacidad_max_mesas"/>
        <xs:attribute name="estilo_gastronomico"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: No todos los departamentos tienen mesas, estilo gastronómico, etc.

### 6. Tipos de Habitación

**Decisión**: Usar `xs:positiveInteger` para `capacidad_maxima`.

```xml
<xs:attribute name="capacidad_maxima" type="xs:positiveInteger"/>
```

**Justificación**: La capacidad nunca puede ser 0 o negativa.

### 7. Tarifas y Precios

**Decisión**: Usar `xs:decimal` para `tarifa_base_minima`.

```xml
<xs:attribute name="tarifa_base_minima" type="xs:decimal" use="required"/>
```

**Justificación**: Los precios necesitan decimales (120.00, 280.00, etc.).

### 8. Reservas y Estados

**Decisión**: Validar `estado_pago` del cliente.

```xml
<xs:simpleType name="EstadoPago">
    <xs:restriction base="xs:string">
        <xs:enumeration value="Pagado"/>
        <xs:enumeration value="Pendiente"/>
        <xs:enumeration value="Cancelado"/>
    </xs:restriction>
</xs:simpleType>
```

**Justificación**: Solo estos tres estados son válidos en el sistema.

### 9. Elementos Facturación

**Decisión**: Usar `xs:string` como tipo base para los valores monetarios.

```xml
<xs:element name="subtotal_estadia">
    <xs:complexType>
        <xs:simpleContent>
            <xs:extension base="xs:string">
                <xs:attribute name="moneda"/>
            </xs:extension>
        </xs:simpleContent>
    </xs:complexType>
</xs:element>
```

**Justificación**: Los valores de precio pueden ser "1350.00", "550.00", etc. Usamos `string` porque pueden tener decimales y se guardan como texto. Añadimos `moneda` como atributo.

### 10. Cliente

**Decisión**: El `id` del cliente es opcional en el esquema, aunque siempre parece estar presente en el XML.

```xml
<xs:attribute name="id" type="xs:string"/>
<xs:attribute name="nombre" type="xs:string" use="required"/>
<xs:attribute name="email" type="xs:string" use="required"/>
```

**Justificación**: En base al XML, `id` siempre está presente, pero podría ser opcional para mantener flexibilidad (quizás clientes anónimos).

### 11. Datos de Registro

**Decisión**: `datos_registro` contiene elementos hijos opcionales.

```xml
<xs:element name="datos_registro">
    <xs:complexType>
        <xs:attribute name="documento_identidad"/>
        <xs:attribute name="nacionalidad"/>
        <xs:sequence>
            <xs:element name="direccion"/>
            <xs:element name="telefono_contacto"/>
        </xs:sequence>
    </xs:complexType>
</xs:element>
```

**Justificación**: Todos estos datos son opcionales según el negocio.

### 12. Servicios Extra en Detalle de Estancia

**Decisión**: Validar `ref_id` como referencia al servicio base.

```xml
<xs:element name="servicio">
    <xs:complexType>
        <xs:attribute name="ref_id" type="xs:string"/>
        <xs:attribute name="cantidad" type="xs:positiveInteger"/>
        <xs:attribute name="costo_extra" use="required"/>
    </xs:complexType>
</xs:element>
```

**Justificación**: `ref_id` debe coincidir con un `id` de servicio en `servicios_globales`.

## Consideraciones Especiales

### 1. Orden de los Elementos
El XSD define el orden: primero infraestructura, luego tipos de habitación, finalmente reservas (opcionales).

### 2. Referencias Cruzadas
Los elementos `servicio` dentro de `detalles_estancia` deben referenciar servicios definidos globalmente. Esto es validación semántica básica (el XSD no verifica referencias cruzadas directamente).

### 3. Tipos de Habitación
`base_familia` define si es Individual, Pareja, Familia, etc.

### 4. Elementos con solo atributos
Algunos elementos como `subtotal_estadia` no tienen elementos hijos, solo atributos (`moneda`).

## Conclusión

El XSD para el sistema de reservas define:
- Estructura jerárquica completa
- Validación de tipos y valores
- Servicios globales y específicos por hotel
- Informes de facturación con monedas
- Información de clientes y estancias
