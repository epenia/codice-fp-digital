## Introducción a XQuery

Base XML

<!-- ![base_xml](./images/xml-base.png) -->

---

## ¿Qué es XQuery?

**XQuery** es un lenguaje de consulta diseñado para extraer y manipular datos de documentos XML. Es al XML lo que SQL es a las bases de datos relacionales.

| **Característica**    | **Descripción**                                    |
| --------------------- | -------------------------------------------------- |
| **Función principal** | Consultar y transformar documentos XML             |
| **Sintaxis**          | Similar a SQL, basada en expresiones FLWOR         |
| **Estándar**          | W3C Recommendation                                 |
| **Motor**             | eXist-db, BaseX, Saxon, MarkLogic                  |
| **XPath integrado**   | XQuery utiliza XPath para navegar por el árbol XML |

---

## Crear archivo XQuery

<!-- ![crear_xquery_1](./images/crear_xquery_1.png) -->

---

<!-- ![crear_xquery_2](./images/crear_xquery_2.png) -->

---

<!-- ![guardar_xquery_1](./images/guardar_xquery_1.png) -->

---

## Expresiones FLWOR

FLWOR es el acrónimo de **For-Let-Where-Order-Return**, la estructura principal de XQuery.

| **Cláusula** | **Descripción**                            | **Ejemplo**                         |
| ------------ | ------------------------------------------ | ----------------------------------- |
| **FOR**      | Bucle sobre una secuencia de nodos         | `for $alumno in /escuela/alumno`    |
| **LET**      | Declara variables para almacenar valores   | `let $total := count($alumno)`      |
| **WHERE**    | Filtra los resultados según una condición  | `where $alumno/edad > 18`           |
| **ORDER BY** | Ordena los resultados                      | `order by $alumno/nombre ascending` |
| **RETURN**   | Especifica qué devolver por cada iteración | `return $alumno/nombre`             |

### Ejemplo básico FLWOR

```xquery
for $alumno in /escuela/alumnos/alumno
where $alumno/nota >= 5
order by $alumno/nombre ascending
return $alumno/nombre
```

---

## Sintaxis básica de XQuery

### Comparación con XPath

| **XPath**      | **XQuery equivalente**     | **Descripción**           |
| -------------- | -------------------------- | ------------------------- |
| `/empresa/*`   | `doc("empresa.xml")/*`     | Selección desde documento |
| `//alumno`     | `doc("datos.xml")//alumno` | Nodos descendientes       |
| `alumno/@dni`  | `$alumno/@dni`             | Acceso a atributos        |
| `alumno[1]`    | `($alumno)[1]`             | Selección por posición    |
| `alumno[@dni]` | `$alumno[@dni]`            | Filtrado por atributo     |

---

## Variables y tipos de datos

### Declaración de variables

```xquery
-- Variables con $nombre
let $nombre := "Ana García"
let $edad := 25
let $alumnos := /escuela/alumnos/alumno
let $total := count($alumnos)
```

### Tipos de datos XQuery

| **Tipo**             | **Ejemplo**                          | **Descripción**   |
| -------------------- | ------------------------------------ | ----------------- |
| **xs:string**        | `"Hola mundo"`                       | Cadena de texto   |
| **xs:integer**       | `42`, `-7`                           | Números enteros   |
| **xs:decimal**       | `3.14159`                            | Números decimales |
| **xs:boolean**       | `true()`, `false()`                  | Valores booleanos |
| **xs:date**          | `xs:date("2026-05-12")`              | Fechas            |
| **xs:dateTime**      | `xs:dateTime("2026-05-12T10:30:00")` | Fecha y hora      |
| **node()**           | `$alumno`                            | Nodos XML         |
| **empty-sequence()** | `()`                                 | Secuencia vacía   |

---

## Operadores en XQuery

### Operadores de comparación

| **Operador**    | **Descripción**                  | **Ejemplo**                    |
| --------------- | -------------------------------- | ------------------------------ |
| **`=`**         | Igual                            | `$alumno/nombre = "Ana"`       |
| **`!=`**        | Distinto                         | `$alumno/estado != "baja"`     |
| **`<` , `>`**   | Menor, mayor                     | `$alumno/edad > 18`            |
| **`<=` , `>=`** | Menor/mayor o igual              | `$nota >= 5`                   |
| **`eq`**        | Comparación de identidad         | `$a eq $b` (valores atómicos)  |
| **`ne`**        | Distinto (Value comparison)      | `$empleado/nombre ne "Carlos"` |
| **`lt`**        | Menor que (Value comparison)     | `$salario lt 40000`            |
| **`le`**        | Menor o igual (Value comparison) | `$edad le 65`                  |
| **`gt`**        | Mayor que (Value comparison)     | `$nota gt 9`                   |
| **`ge`**        | Mayor o igual (Value comparison) | `$horas ge 40`                 |

### Operadores lógicos

| **Operador** | **Descripción** | **Ejemplo**                                   |
| ------------ | --------------- | --------------------------------------------- |
| `and`        | Conjunción      | `$edad > 18 and $nota >= 5`                   |
| `or`         | Disyunción      | `$ciudad = "Madrid" or $ciudad = "Barcelona"` |
| `not()`      | Negación        | `not($activo)`                                |

---

## Funciones XQuery integradas

### Funciones de cadena

| **Función**                             | **Descripción**                | **Ejemplo**                                      |
| --------------------------------------- | ------------------------------ | ------------------------------------------------ |
| `upper-case($str)`                      | Convierte a mayúsculas         | `upper-case("hola")` → `"HOLA"`                  |
| `lower-case($str)`                      | Convierte a minúsculas         | `lower-case("HOLA")` → `"hola"`                  |
| `string-length($str)`                   | Longitud de cadena             | `string-length("Hola")` → `4`                    |
| `concat($str1, $str2)`                  | Concatena cadenas              | `concat("Hola", " Mundo")` → `"Hola Mundo"`      |
| `substring($str, $inicio, $long?)`      | Extrae subcadena               | `substring("HolaMundo", 1, 4)` → `"Hola"`        |
| `contains($str1, $str2)`                | Comprueba si contiene          | `contains("HolaMundo", "Mundo")` → `true()`      |
| `starts-with($str1, $str2)`             | Comprueba si empieza con       | `starts-with("HolaMundo", "Hola")` → `true()`    |
| `ends-with($str1, $str2)`               | Comprueba si termina con       | `ends-with("archivo.xml", ".xml")` → `true()`    |
| `normalize-space($str)`                 | Elimina espacios               | `normalize-space("  hola  ")` → `"hola"`         |
| `translate($str, $from, $to)`           | Reemplaza caracteres           | `translate("hola", "aeiou", "AEIOU")` → `"hOlA"` |
| `matches($str, $pattern)`               | Coincide con expresión regular | `matches("abc123", "^[a-z]+[0-9]+$")` → `true()` |
| `replace($str, $pattern, $replacement)` | Reemplaza según patrón         | `replace("abc", "b", "X")` → `"aXc"`             |

### Funciones numéricas

| **Función**         | **Descripción**                | **Ejemplo**              |
| ------------------- | ------------------------------ | ------------------------ |
| `sum($secuencia)`   | Suma de valores                | `sum(/notas/nota)`       |
| `avg($secuencia)`   | Media aritmética               | `avg(/notas/nota)`       |
| `min($secuencia)`   | Valor mínimo                   | `min(/notas/nota)`       |
| `max($secuencia)`   | Valor máximo                   | `max(/notas/nota)`       |
| `count($secuencia)` | Cuenta elementos               | `count(/alumnos/alumno)` |
| `round($num)`       | Redondea al entero más cercano | `round(3.7)` → `4`       |
| `floor($num)`       | Redondea hacia abajo           | `floor(3.7)` → `3`       |
| `ceiling($num)`     | Redondea hacia arriba          | `ceiling(3.2)` → `4`     |
| `abs($num)`         | Valor absoluto                 | `abs(-5)` → `5`          |

### Funciones de fecha y hora

| **Función**                | **Descripción**      | **Ejemplo**                                           |
| -------------------------- | -------------------- | ----------------------------------------------------- |
| `current-date()`           | Fecha actual         | `current-date()` → `2026-05-12`                       |
| `current-time()`           | Hora actual          | `current-time()` → `14:30:00`                         |
| `current-dateTime()`       | Fecha y hora actual  | `current-dateTime()`                                  |
| `year-from-date($date)`    | Extrae año           | `year-from-date(xs:date("2026-05-12"))` → `2026`      |
| `month-from-date($date)`   | Extrae mes           | `month-from-date(xs:date("2026-05-12"))` → `5`        |
| `day-from-date($date)`     | Extrae día           | `day-from-date(xs:date("2026-05-12"))` → `12`         |
| `days-from-duration($dur)` | Días de una duración | `days-from-duration(xs:dayTimeDuration("P5D"))` → `5` |

### Funciones de nodo

| **Función**            | **Descripción**          | **Ejemplo**                  |
| ---------------------- | ------------------------ | ---------------------------- |
| `name($node)`          | Nombre del nodo          | `name($alumno)` → `"alumno"` |
| `local-name($node)`    | Nombre local sin prefijo | `local-name($alumno)`        |
| `namespace-uri($node)` | URI del namespace        | `namespace-uri($alumno)`     |
| `base-uri($node)`      | URI base del nodo        | `base-uri($alumno)`          |
| `node-name($node)`     | Nombre completo del nodo | `node-name($alumno)`         |
| `root($node)`          | Raíz del documento       | `root($alumno)`              |

---

## Filtrado con predicados

```xquery
-- Por posición
(//alumno)[1]                    (: Primer alumno :)
(//alumno)[last()]               (: Último alumno :)

//alumno[position() <= 3]         (: Tres primeros :)

-- Por valor
//alumno[nota >= 5]              (: Aprobados :)
//alumno[nota > 7 and nota < 9]  (: Notas entre 7 y 9 :)

//alumno[nombre = "Ana"]          (: Por nombre exacto :)

//alumno[contains(nombre, "Ana")] (: Nombre contiene "Ana" :)

-- Por atributo
//alumno[@tipo = "interno"]       (: Con atributo tipo :)
//alumno[@dni]                     (: Que tenga atributo dni :)
```

---

## Constructores en XQuery

### Constructores directos

```xquery
-- Elementos literales
<alumno>
  <nombre>Ana García</nombre>
  <edad>22</edad>
</alumno>

-- Con variables
for $alumno in /escuela/alumnos/alumno
return
  <resultado nombre="{$alumno/nombre}" nota="{$alumno/nota}"/>

-- Con expresiones
<total>{count(/alumnos/alumno)}</total>
```

### Constructores computados

```xquery
-- Elemento dinámico
element alumno {
  attribute dni { "12345678A" },
  element nombre { "Ana García" }
}

-- Atributo dinámico
attribute activo { if ($condicion) then "si" else "no" }
```

---

## Ejemplos prácticos de XQuery

### Ejemplo 1: Consulta básica de alumnos

**XML de entrada:**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<escuela>
  <alumnos>
    <alumno>
      <nombre>Ana García</nombre>
      <apellidos>López Pérez</apellidos>
      <edad>22</edad>
      <nota>8.5</nota>
      <curso>DAM</curso>
    </alumno>
    <alumno>
      <nombre>Carlos Martínez</nombre>
      <apellidos>Ruiz Sánchez</apellidos>
      <edad>19</edad>
      <nota>4.5</nota>
      <curso>DAW</curso>
    </alumno>
    <alumno>
      <nombre>María López</nombre>
      <apellidos>García Torres</apellidos>
      <edad>24</edad>
      <nota>9.2</nota>
      <curso>DAM</curso>
    </alumno>
  </alumnos>
</escuela>
```

**XQuery:**

```xquery
(: Listar nombres de alumnos aprobados :)
for $alumno in doc("escuela.xml")/escuela/alumnos/alumno
where $alumno/nota >= 5
order by $alumno/nota descending
return <aprobado>{$alumno/nombre}</aprobado>
```

**Resultado:**

```xml
<aprobado>María López</aprobado>
<aprobado>Ana García</aprobado>
```

---

### Ejemplo 2: Estadísticas con FLWOR

```xquery
let $alumnos := doc("escuela.xml")/escuela/alumnos/alumno
let $total := count($alumnos)
let $aprobados := count($alumnos[nota >= 5])
let $suspensos := $total - $aprobados
let $media := avg($alumnos/nota)

return
  <estadisticas>
    <total_alumnos>{$total}</total_alumnos>
    <aprobados>{$aprobados}</aprobados>
    <suspensos>{$suspensos}</suspensos>
    <porcentaje_aprobados>{$aprobados div $total * 100}</porcentaje_aprobados>
    <nota_media>{round($media, 2)}</nota_media>
    <nota_maxima>{max($alumnos/nota)}</nota_maxima>
    <nota_minima>{min($alumnos/nota)}</nota_minima>
  </estadisticas>
```

---

### Ejemplo 3: Agrupación y resumen

```xquery
(: Alumnos por curso con count y promedio :)
for $curso in distinct-values(doc("escuela.xml")/escuela/alumnos/alumno/curso)
let $alumnos := doc("escuela.xml")/escuela/alumnos/alumno[curso = $curso]
order by $curso
return
  <curso nombre="{$curso}">
    <numero_alumnos>{count($alumnos)}</numero_alumnos>
    <nota_media>{round(avg($alumnos/nota), 2)}</nota_media>
    {
      for $alumno in $alumnos
      order by $alumno/nota descending
      return <alumno nombre="{$alumno/nombre}" nota="{$alumno/nota}"/>
    }
  </curso>
```

---

### Ejemplo 4: Búsqueda con funciones de texto

```xquery
(: Buscar alumnos por nombre o apellidos :)
for $alumno in doc("escuela.xml")/escuela/alumnos/alumno
where contains(upper-case($alumno/nombre), "ANA") or
      contains(upper-case($alumno/apellidos), "GARCIA")
return
  <resultado>
    <nombre>{concat($alumno/nombre, " ", $alumno/apellidos)}</nombre>
    <edad>{$alumno/edad}</edad>
  </resultado>
```

---

### Ejemplo 5: Join entre documentos

```xquery
(: Combinar datos de alumnos con sus calificaciones :)
for $alumno in doc("alumnos.xml")/alumnos/alumno
let $calif := doc("calificaciones.xml")/calificaciones/calificacion[@id = $alumno/@id]
where exists($calif)
return
  <resultado>
    {$alumno/nombre}
    <calificacion_final>{$calif/nota_final}</calificacion_final>
    <observaciones>{$calif/observaciones/text()}</observaciones>
  </resultado>
```

---

## Funciones definidas por el usuario

### Sintaxis

```xquery
declare function local:nombre_funcion($param1 as tipo1, $param2 as tipo2) as tipo_retorno
{
  (: cuerpo de la función :)
  let $resultado := $param1 + $param2
  return $resultado
};
```

### Ejemplo práctico

```xquery
(: Función para calcular si un alumno aprueba :)
declare function local:estado_aprobado($nota as xs:decimal) as xs:string
{
  if ($nota >= 9) then "Sobresaliente"
  else if ($nota >= 7) then "Notable"
  else if ($nota >= 5) then "Aprobado"
  else "Suspenso"
};

(: Usar la función :)
for $alumno in doc("escuela.xml")/escuela/alumnos/alumno
return
  <resultado>
    <nombre>{$alumno/nombre}</nombre>
    <nota>{$alumno/nota}</nota>
    <estado>{local:estado_aprobado($alumno/nota)}</estado>
  </resultado>
```

### Funciones recursivas

```xquery
(: Función recursiva para factorial :)
declare function local:factorial($n as xs:integer) as xs:integer
{
  if ($n <= 1) then 1
  else $n * local:factorial($n - 1)
};

(: Función recursiva para fibonacci :)
declare function local:fibonacci($n as xs:integer) as xs:integer
{
  if ($n <= 1) then $n
  else local:fibonacci($n - 1) + local:fibonacci($n - 2)
};
```

---

## Módulos XQuery

### Importar módulos

```xquery
import module namespace funcs = "http://example.com/funciones";

(: Usar función del módulo :)
funcs:formatearFecha(current-date())
```

### Declarar módulo

```xquery
(: En archivo modulos/fechas.xqm :)
module namespace fechas = "http://example.com/funciones";

declare function fechas:formatearFecha($fecha as xs:date) as xs:string
{
  concat(day-from-date($fecha), "/",
         month-from-date($fecha), "/",
         year-from-date($fecha))
};

declare function fechas:diasEntre($fecha1 as xs:date, $fecha2 as xs:date) as xs:integer
{
  days-from-duration($fecha2 - $fecha1)
};
```

---

## Expresiones condicionales

### IF-THEN-ELSE

```xquery
for $alumno in doc("escuela.xml")/escuela/alumnos/alumno
return
  if ($alumno/nota >= 9) then
    <excelente>{$alumno/nombre}</excelente>
  else if ($alumno/nota >= 7) then
    <notable>{$alumno/nombre}</notable>
  else if ($alumno/nota >= 5) then
    <aprobado>{$alumno/nombre}</aprobado>
  else
    <suspenso>{$alumno/nombre}</suspenso>
```

### SWITCH

```xquery
for $alumno in doc("escuela.xml")/escuela/alumnos/alumno
return
  switch ($alumno/curso)
    case "DAM" return <dam>{$alumno/nombre}</dam>
    case "DAW" return <daw>{$alumno/nombre}</daw>
    case "ASIR" return <asir>{$alumno/nombre}</asir>
    default return <otro>{$alumno/nombre}</otro>
```

---

## Cuantificadores

| **Cuantificador**                   | **Descripción**       | **Ejemplo**                                       |
| ----------------------------------- | --------------------- | ------------------------------------------------- |
| `some $var in expr satisfies cond`  | Algún elemento cumple | `some $n in (1,2,3) satisfies $n > 2` → `true()`  |
| `every $var in expr satisfies cond` | Todos cumplen         | `every $n in (1,2,3) satisfies $n > 0` → `true()` |

```xquery
(: Verificar si algún alumno tiene beca :)
if (some $alumno in doc("escuela.xml")//alumno satisfies $alumno/@beca = "si")
then <hay_becados/>
else <no_hay_becados/>

(: Verificar si todos los alumnos aprobaron :)
if (every $alumno in doc("escuela.xml")//alumno satisfies $alumno/nota >= 5)
then <todo_aprobado/>
else <hay_suspensos/>
```
