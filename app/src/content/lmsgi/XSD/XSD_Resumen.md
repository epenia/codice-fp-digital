Base XML

> `<!-- Esto es un comentario -->`

> Control + F para buscar palabras en los archivos usando el programa XML Copy Editor


![base_xml](./images/xml-base.png)

---

![crear_xsd_1](./images/crear_xsd_1.png)

---

![crear_xsd_2](./images/crear_xsd_2.png)

---

Guardar documento

![guardar_xsd_1](./images/guardar_xsd_1.png)

---

![guardar_xsd_2](./images/guardar_xsd_2.png)

---

![asociar_xsd_1](./images/asociar_xsd_1.png)

---

![asociar_xsd_2](./images/asociar_xsd_2.png)

### XSD

### Base del Esquema

- **Archivo**: Se definen en ficheros planos con extensión `.xsd`.
- **Raíz**: El elemento raíz es siempre `<xs:schema>`.
- **Espacio de nombres**: Debe utilizarse `http://www.w3.org/2001/XMLSchema`.
- **Asociación**: Se realiza en el ejemplar del documento XML mediante un espacio de nombres con el prefijo `xsi:`.

---

## Elementos del Lenguaje (`<xs:element>`)

Definen los componentes del documento, diferenciando entre datos simples y estructuras complejas anidadas.

| **Categoría**         | **Ejemplo de Código XSD**                      | **Descripción**                                                                             |
| --------------------- | ---------------------------------------------- | ------------------------------------------------------------------------------------------- |
| **Simple (Terminal)** | `<xs:element name="alumno" type="xs:string"/>` | Elementos que corresponden a las hojas del árbol; solo contienen datos, no otros elementos. |
| **Simple**            | `<xs:simpleType>`                              | Lo hacemos sobre una etiqueta XML que no contiene otras etiquetas XML ni atributos          |
| **Complejo (Rama)**   | `<xs:complexType>`                             | Se emplea sobre una etiqueta XML que si contiene otras etiquetas XML o atributos            |

### Indicadores de Orden y Agrupación

Determinan la jerarquía y el orden de aparición de los elementos hijos.

| **Elemento**        | **Ejemplo de Código**                                                                                    | **Explicación**                                                                       |
| ------------------- | -------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------- |
| **`<xs:sequence>`** | `<xs:sequence>`<br>`<xs:element name="nombre"/>`<br>`<xs:element name="apellidos"/>`<br>`</xs:sequence>` | Los elementos deben aparecer en el **orden exacto** en que han sido enumerados.       |
| **`<xs:choice>`**   | `<xs:choice>`<br>`<xs:element name="cp"/>`<br>`<xs:element name="ciudad"/>`<br>`</xs:choice>`            | Representa una alternativa **o-exclusiva**: se debe elegir solo uno de los elementos. |
| **`<xs:all>`**      | `<xs:all>`<br>`<xs:element name="dni"/>`<br>`<xs:element name="nombre"/>`<br>`</xs:all>`                 | Permite que aparezcan todos los elementos definidos, pero en **cualquier orden**.     |

---

### Indicadores de aparición

Es usado para indicar cuantas veces como mínimo o máximo debe aparecer una etiqueta XML

>**NOTA:**  Aun que no se ponga nada en minOccur o maxOccur tiene un valor por defecto que es 1 equivalente a `<xs:element name="nombre" minOccurs="1" maxOccurs="1"/>`

> **NOTA:** Si queremos que aparezca un numero indefinido de veces se emplea el valor `unbounded`.  ejemplo: `<xs:element name="nombre" maxOccurs="unbounded"/>`


| **Elemento**          | **Ejemplo de Código**                                      | **Explicación**                                                     |
| --------------------- | ---------------------------------------------------------- | ------------------------------------------------------------------- |
| **minOccurs**         | `<xs:element name="nombre" minOccurs="0"/>`                | Especifica cuantas veces como mínimo debe aparecer esa etiqueta XML |
| **maxOccurs**         | `<xs:element name="nombre" maxOccurs="1"/>`                | Especifica cuantas veces como máximo debe aparecer esa etiqueta XML |
| **Ejemplo con ambos** | `<xs:element name="nombre" minOccurs="1" maxOccurs="10"/>` | Especifica que como mínimo debe aparecer una vez y como máximo 10   |


---

## Tipos de Datos (`type=`)

XSD ofrece una amplia gama de tipos integrados para validar el contenido de los elementos y atributos.

|**Tipo de Dato**|**Ejemplo de Valor en XML**|**Descripción**|
|---|---|---|
|**`xs:string`**|`Olga Velarde Cobo`|Cadena de caracteres UNICODE.|
|**`xs:integer`**|`15`|Número entero positivo o negativo.|
|**`xs:date`**|`2026-05-11`|Fecha en formato `CCYY-MM-DD`.|
|**`xs:dateTime`**|`2011-12-01T10:00:00`|Representa una fecha y hora absolutas.|
|**`xs:duration`**|`P2Y4M3DT5H6M10S`|Duración expresada en años, meses, días, horas, minutos y segundos.|
|**`xs:boolean`**|`true`|Representa valores lógicos: `true` o `false`.|
|**`xs:positiveInteger`**|`42`|Número entero estrictamente mayor que cero (positivo).|
|**`xs:negativeInteger`**|`-18`|Número entero estrictamente menor que cero (negativo).|
|**`xs:decimal`**|`8.97`|Número decimal (utiliza el punto como separador).|
|**`xs:time`**|`14:30:00`|Hora en formato de 24 horas `hh:mm:ss`.|
|**`xs:gYearMonth`**|`2026-05`|Representa un mes específico de un año determinado (`CCYY-MM`).|
|**`xs:gYear`**|`2026`|Indica un año gregoriano específico en formato `CCYY`.|
|**`xs:gMonthDay`**|`--05-16`|Representa un día de un mes recurrente mediante el formato `--MM-DD`.|
|**`xs:gDay`**|`---16`|Indica el ordinal del día del mes de forma recurrente mediante el formato `---DD`.|
|**`xs:gMonth`**|`--02`|Representa un mes recurrente del año mediante el formato `--MM`.|
|**`xs:anyURI`**|`[https://www.w3.org](https://www.w3.org)`|Representa un identificador de recurso uniforme (URI/URL).|
|**`xs:language`**|`es-ES`|Representa identificadores de lenguaje válidos según la norma RFC 1766.|
|**`xs:ID`**|`user123`|Identificador único para un elemento dentro del documento XML.|
|**`xs:IDREF`**|`user123`|Referencia de enlace hacia el valor de un atributo de tipo `ID` existente.|
|**`xs:ENTITY`**|`portada_libro`|Referencia a una entidad externa no analizada declarada en el documento.|
|**`xs:NOTATION`**|`jpeg`|Especifica el formato o la aplicación destinada a procesar un tipo de datos.|
|**`xs:NMTOKEN`**|`Segunda_Edición`|Cadena de texto restringida en formato de palabra clave (sin espacios en blanco).|

---

## Facetas de Restricción (`<xs:restriction>`)

Permiten aplicar restricciones adicionales sobre tipos simples para limitar su rango de valores.

| **Faceta**           | **Ejemplo de Código XSD**                                                                                                             | **Descripción**                                                         |
| -------------------- | ------------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- |
| **length**           | `<xs:restriction base="xs:string">`<br>`<xs:length value="8"/>`<br>`</xs:restriction>`                                                | Define la longitud exacta (número de caracteres) del dato.              |
| **`minLength`**      | `<xs:restriction base="xs:string">`<br>`<xs:minLength value="1"/>`<br>`</xs:restriction>`                                             | Define la longitud mínima permitida.                                    |
| **`maxLength`**      | `<xs:restriction base="xs:string">`<br>`<xs:maxLength value="9"/>`<br>`</xs:restriction>`                                             | Define la longitud máxima permitida.                                    |
| **`totalDigits`**    | `<xs:restriction base="xs:decimal">`<br>`<xs:totalDigits value="5"/>`<br>`</xs:restriction>`                                          | Indica el número máximo de dígitos totales en un número.                |
| **`fractionDigits`** | `<xs:restriction base="xs:decimal">`<br>`<xs:fractionDigits value="2"/>`<br>`</xs:restriction>`                                       | Indica el número máximo de dígitos en la parte decimal.                 |
| **`minInclusive`**   | `<xs:restriction base="xs:integer">`<br>`<xs:minInclusive value="1"/>`<br>`</xs:restriction>`                                         | Límite inferior que **incluye** el valor dado.                          |
| **`maxInclusive`**   | `<xs:restriction base="xs:integer">`<br>`<xs:maxInclusive value="10"/>`<br>`</xs:restriction>`                                        | Límite superior que **incluye** el valor dado.                          |
| **`minExclusive`**   | `<xs:restriction base="xs:integer">`<br>`<xs:minExclusive value="11"/>`<br>`</xs:restriction>`                                        | Límite inferior que **no incluye** el valor dado.                       |
| **`maxExclusive`**   | `<xs:restriction base="xs:integer">`<br>`<xs:maxExclusive value="19"/>`<br>`</xs:restriction>`                                        | Límite superior que **no incluye** el valor dado.                       |
| **`enumeration`**    | `<xs:restriction base="xs:string">`<br>`<xs:enumeration value="lunes"/>`<br>`<xs:enumeration value="martes"/>`<br>`</xs:restriction>` | Restringe el valor a una lista cerrada de opciones.                     |
| **`pattern`**        | `<xs:restriction base="xs:string">`<br>`<xs:pattern value="[0-9]{8}[A-Z]"/>`<br>`</xs:restriction>`                                   | Define una máscara o formato específico mediante expresiones regulares. |

---

## Atributos (`<xs:attribute>`)

Se declaran para asociar propiedades a los elementos. Se sitúan dentro de la definición del tipo complejo.

| **Modificador** | **Ejemplo de Código**                        | **Descripción**                                                 |
| --------------- | -------------------------------------------- | --------------------------------------------------------------- |
| **`required`**  | `<xs:attribute name="edad" use="required"/>` | El atributo debe aparecer obligatoriamente en el elemento.      |
| **`optional`**  | `<xs:attribute name="href" use="optional"/>` | El atributo es opcional (comportamiento por defecto `implied`). |
| **`fixed`**     | `<xs:attribute name="pais" fixed="España"/>` | Define un valor constante que no puede cambiarse en el XML.     |

<br>
<br>
<br>
<br>

## XML de ejemplo

### XML

```xml
<?xml version="1.0" encoding="UTF-8"?>
<expediente curso="2025-2026" estado="activo"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:noNamespaceSchemaLocation="expediente.xsd">

  <dni>12345678Z</dni>

  <usuario>pepe_garcia</usuario>

  <dia_tutoria>Lunes</dia_tutoria>

  <nota_media>08.75</nota_media>

  <creditos_extra>12</creditos_extra>

  <codigo_centro>ABC12345</codigo_centro>

</expediente>
```

### XML Schema

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">


  <xs:element name="expediente">
    <xs:complexType>
      <xs:sequence>

        <xs:element name="dni">
          <xs:simpleType>
            <xs:restriction base="xs:string">
              <xs:pattern value="[0-9]{8}[A-Z]"/>
            </xs:restriction>
          </xs:simpleType>
        </xs:element>

        <xs:element name="usuario">
          <xs:simpleType>
            <xs:restriction base="xs:string">
              <xs:minLength value="5"/>
              <xs:maxLength value="15"/>
            </xs:restriction>
          </xs:simpleType>
        </xs:element>

        <xs:element name="dia_tutoria">
          <xs:simpleType>
            <xs:restriction base="xs:string">
              <xs:enumeration value="Lunes"/>
              <xs:enumeration value="Miércoles"/>
              <xs:enumeration value="Viernes"/>
            </xs:restriction>
          </xs:simpleType>
        </xs:element>

        <xs:element name="nota_media">
          <xs:simpleType>
            <xs:restriction base="xs:decimal">
              <xs:totalDigits value="4"/>
              <xs:fractionDigits value="2"/>
              <xs:minInclusive value="0"/>
              <xs:maxInclusive value="10"/>
            </xs:restriction>
          </xs:simpleType>
        </xs:element>

        <xs:element name="creditos_extra">
          <xs:simpleType>
            <xs:restriction base="xs:integer">
              <xs:minExclusive value="0"/>
              <xs:maxExclusive value="100"/>
            </xs:restriction>
          </xs:simpleType>
        </xs:element>

        <xs:element name="codigo_centro">
          <xs:simpleType>
            <xs:restriction base="xs:string">
              <xs:length value="8"/>
            </xs:restriction>
          </xs:simpleType>
        </xs:element>

      </xs:sequence>

      <xs:attribute name="curso" type="xs:string" use="required"/>

      <xs:attribute name="estado" type="xs:string" fixed="activo"/>

    </xs:complexType>
  </xs:element>

</xs:schema>
```
