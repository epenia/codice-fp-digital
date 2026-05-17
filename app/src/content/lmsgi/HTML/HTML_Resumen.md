# Resumen de HTML para Principiantes

## ¿Qué es HTML?

HTML (**HyperText Markup Language**) es el lenguaje que se usa para crear páginas web. No es un lenguaje de programación, sino un lenguaje de **marcas** que utiliza **etiquetas** para indicar al navegador cómo debe mostrar el contenido.

---

## Estructura básica de un documento HTML

Todo documento HTML sigue esta estructura:

```html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mi primera página</title>
</head>
<body>
    <!-- Aquí va el contenido visible -->
</body>
</html>
```

| Elemento | Descripción |
|---|---|
| `<!DOCTYPE html>` | Indica al navegador que es un documento HTML5 |
| `<html>` | Elemento raíz que envuelve todo el documento |
| `<head>` | Contiene metadatos (charset, título, enlaces a CSS...) |
| `<meta charset="UTF-8">` | Define la codificación de caracteres (acentos, ñ, etc.) |
| `<meta name="viewport">` | Hace que la página se adapte a móviles |
| `<title>` | Título que aparece en la pestaña del navegador |
| `<body>` | Contiene todo lo que el usuario ve en la página |
| `lang="es"` | Indica el idioma del documento (accesibilidad) |

> `lang="es"` se usa en `artistas.html:1` (xsl/anselmo_2_2), `coches_1_1/index.html:2`, `biblioteca_3_1/index.html:2`, `hotel_4_1/index.html:2`, etc.

> Algunos archivos generados por XSL no usan `<!DOCTYPE html>` ni `<meta>`, como `anselmo_1_1/index.html` que empieza con `<?xml version="1.0"?>`

---

## Etiquetas de texto

### Títulos (headings)

Hay 6 niveles de títulos, del más grande (`h1`) al más pequeño (`h6`):

```html
<h1>Título principal</h1>
<h2>Subtítulo</h2>
<h3>Sub-subtítulo</h3>
<h4>Título pequeño</h4>
```

<div style="font-size:1.5em;font-weight:bold">Título principal</div>
<div style="font-size:1.3em;font-weight:bold">Subtítulo</div>
<div style="font-size:1.1em;font-weight:bold">Sub-subtítulo</div>
<div style="font-size:1em;font-weight:bold">Título pequeño</div>

> Se usan en los exámenes: `ra2.html:13` (`<h1>STAR WARS</h1>`), `ra2.html:14` (`<h2>Las aventuras...</h2>`), `ra2.html:38` (`<h3>REPARTO y PERSONAJES</h3>`)
>
> En XSL: `Bailes.html:19` (`<h1>BAILES DE SALÓN</h1>`), `Bailes.html:84` (`<h4>Ordenado en descendente...</h4>`), `musica_2_2/index.html:15` (`<h1>&#9835; Bandas Activas</h1>`), `musica_2_2/index.html:35` (`<h2>Canciones de The Rolling Stones</h2>`)

### Párrafos

La etiqueta `<p>` define un párrafo de texto:

```html
<p>Este es un párrafo de texto normal.</p>
<p>Este es otro párrafo separado del anterior.</p>
```

<p>Este es un párrafo de texto normal.</p>
<p>Este es otro párrafo separado del anterior.</p>

> Se usan en todos los exámenes, por ejemplo `index.html:22` (examen 2023)
>
> En XSL: `biblioteca_3_1/index.html:15` (`<p>Total de libros en español: 2</p>`), `biblioteca_3_2/index.html:50`

### Texto en negrita

`<strong>` marca texto importante (se muestra en negrita):

```html
<p><strong>Autor:</strong> Gabriel García Márquez</p>
```

<p><strong>Autor:</strong> Gabriel García Márquez</p>

> Se usa en `biblioteca_3_1/index.html:18-20`, `biblioteca_3_2/index.html:50`, `coches_1_2/index.html:46`

### Saltos de línea

`<br>` produce un salto de línea sin crear un nuevo párrafo:

```html
Roberto García<br>
```

Roberto García<br>

> Se usa en `ra3.html:15` como `<br><br>` para separar elementos del formulario
>
> En XSL: `Bailes.html:29-30` (`Roberto García<br/>`) para poner nombres de profesores en varias líneas dentro de una celda

### Comentarios

Los comentarios no se muestran en el navegador:

```html
<!-- Esto es un comentario, no se ve -->
```

> Se usan en `ra3.html:7` y `ra2.html:7`
>
> En XSL: `discos1.html:35` (`<!-- Enlace externo del CSS -->`), `discos2.html:46`

---

## Enlaces (hipervínculos)

La etiqueta `<a>` crea enlaces a otras páginas o recursos:

```html
<a href="https://es.wikipedia.org" target="_blank">Visitar Wikipedia</a>
```

<a href="https://es.wikipedia.org" target="_blank">Visitar Wikipedia</a>

| Atributo | Descripción |
|---|---|
| `href` | URL de destino |
| `target="_blank"` | Abre el enlace en una nueva pestaña |
| `rel="noopener noreferrer"` | Seguridad al usar `target="_blank"` |

> Se usa en `index.html:18` (examen 2023) enlazando a Wikipedia y en `ejercicio1.html:35` enlazando a `ejercicio2.html`
>
> En XSL: `artistas.html:39` (`<a href="https://es.wikipedia.org/wiki/Caravaggio">Saber más</a>`), `musica_2_1/index.html:34` (`<a href="https://www.google.com/search?q=Brown+Sugar">Buscar</a>`), `discos2.html:250` (`<a href="https://www.flaticon.es">Iconos creados por Freepik - Flaticon</a>`)

### Enlace para enviar email

```html
<a href="mailto:recepcion@hotel.com">Reservar ahora</a>
```

> Se usa en `hotel_4_2/index.html:34`

### Imagen dentro de un enlace

Se puede envolver una imagen con `<a>` para que sea clicable:

```html
<a href="https://es.wikipedia.org" target="_blank">
    <img src="cartel.jpg" alt="Cartel">
</a>
```

> Se usa en `index.html:18-19` y `ejercicio2.html:14-16`

---

## Imágenes

La etiqueta `<img>` inserta imágenes. **No tiene etiqueta de cierre**:

```html
<img src="cartel.jpg" alt="Descripción de la imagen">
```

<img src="https://via.placeholder.com/200x120/1a1a2e/ffffff?text=Cartel+Star+Wars" alt="Cartel de Star Wars" style="border-radius:10px;border:2px solid darkgreen;padding:5px;">

| Atributo | Descripción |
|---|---|
| `src` | Ruta o URL de la imagen |
| `alt` | Texto alternativo (importante para accesibilidad) |

> Se usan en todos los exámenes: `index.html:19` (examen 2023), `ejercicio1.html:14`, `ejercicio1.html:24`, `ejercicio2.html:15`, `ra2.html:21`, `ra2.html:28`

### Imágenes con clases para diferentes tamaños

En XSL se usan clases para controlar el tamaño de imágenes según su función:

```html
<img src="imagenes/cd.png" class="soporte" />
<img src="imagenes/usa.png" class="nacionalidad" />
```

> Se usa en `discos2.html:65` (icono de CD), `discos2.html:70` (bandera de nacionalidad)

---

## Entidades HTML (caracteres especiales)

Cuando necesitas mostrar caracteres que el HTML interpreta de forma especial (como `<`, `>`, `&`) o emojis, se usan **entidades HTML**:

```html
&#128665;    → 🚙 (emoji de coche/SUV)
&#9889;      → ⚡ (rayo)
&#9835;      → ♫ (nota musical)
&#9208;      → ⏰ (reloj)
&lt;          → <
&gt;          → >
&amp;         → &
&euro;       → €
&pound;      → £
```

> Se usan en XSL: `coches_1_1/index.html:33` (`&#128665;`), `coches_1_2/index.html:34` (`&#9889;`), `musica_2_2/index.html:15` (`&#9835;`), `biblioteca_3_2/index.html:31` (`&#9208;`)
>
> También se ven símbolos de moneda directamente: `anselmo_1_1/index.html:44` (€), `anselmo_1_1/index.html:52` (£), `anselmo_1_1/index.html:60` ($)

---

## Listas

### Lista desordenada (viñetas)

Se usa `<ul>` (unordered list) y cada elemento va dentro de `<li>` (list item):

```html
<ul>
    <li>Diego Luna como Cassian Andor</li>
    <li>Stellan Skarsgård como Luthen Rael</li>
</ul>
```

<ul>
    <li>Diego Luna como Cassian Andor</li>
    <li>Stellan Skarsgård como Luthen Rael</li>
</ul>

> Se usa en `index.html:32-35` (examen 2023), `ejercicio2.html:21-35`, `ra2.html:40-47`

### Lista ordenada (numerada)

Se usa `<ol>` (ordered list). Los elementos también van con `<li>`:

```html
<ol>
    <li>Primer paso</li>
    <li>Segundo paso</li>
    <li>Tercer paso</li>
</ol>
```

<ol>
    <li>Primer paso</li>
    <li>Segundo paso</li>
    <li>Tercer paso</li>
</ol>

---

## Tablas

Las tablas se construyen con varias etiquetas:

| Etiqueta | Descripción |
|---|---|
| `<table>` | Contenedor de la tabla |
| `<tr>` | Fila (table row) |
| `<th>` | Celda de cabecera (negrita y centrada) |
| `<td>` | Celda de datos normal |
| `<thead>` | Agrupa las filas de cabecera |
| `<tbody>` | Agrupa las filas del cuerpo |

### Tabla básica

```html
<table border="1">
    <thead>
        <tr>
            <th>Nombre</th>
            <th>Personaje</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Diego Luna</td>
            <td>Cassian Andor</td>
        </tr>
        <tr>
            <td>Stellan Skarsgård</td>
            <td>Luthen Rael</td>
        </tr>
    </tbody>
</table>
```

<table border="1" style="border-collapse:collapse;width:80%">
    <thead>
        <tr style="background-color:#333;color:white">
            <th style="padding:8px">Nombre</th>
            <th style="padding:8px">Personaje</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="padding:8px">Diego Luna</td>
            <td style="padding:8px">Cassian Andor</td>
        </tr>
        <tr>
            <td style="padding:8px">Stellan Skarsgård</td>
            <td style="padding:8px">Luthen Rael</td>
        </tr>
    </tbody>
</table>

### Tabla con imágenes dentro de celdas

Las celdas (`<td>`) pueden contener cualquier elemento, incluidas imágenes:

```html
<table>
    <tr>
        <th>Título</th>
        <th>Soporte</th>
        <th>Género</th>
    </tr>
    <tr>
        <td>Thriller</td>
        <td><img src="imagenes/vinilo.png" class="soporte" /></td>
        <td>Pop</td>
    </tr>
</table>
```

<table border="1" style="border-collapse:collapse;width:80%">
    <thead>
        <tr style="background-color:blue;color:aqua">
            <th style="padding:8px">Título</th>
            <th style="padding:8px">Soporte</th>
            <th style="padding:8px">Género</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td style="padding:8px">Thriller</td>
            <td style="padding:8px"><img src="https://via.placeholder.com/40x40/333/fff?text=CD" alt="vinilo" style="max-width:40px"></td>
            <td style="padding:8px">Pop</td>
        </tr>
        <tr>
            <td style="padding:8px">Abbey Road</td>
            <td style="padding:8px"><img src="https://via.placeholder.com/40x40/666/fff?text=Cinta" alt="cinta" style="max-width:40px"></td>
            <td style="padding:8px">Rock</td>
        </tr>
    </tbody>
</table>

> Se usa en `discos2.html:52-248` con iconos de CD, vinilo y cinta como soporte, y banderas como nacionalidad

### Tabla con `<div>` dentro de celdas

Dentro de una celda puedes poner varios `<div>` para organizar contenido:

```html
<td>
    <div>Octopus's Garden - 171</div>
    <div>Something - 183</div>
    <div>Oh! Darling - 206</div>
</td>
```

> Se usa en `discos1.html:49-54` y `discos2.html:74-87` para listar canciones dentro de una celda

### Tabla con celda vacía

Una celda puede estar vacía o con etiqueta autocerrada:

```html
<td/>          <!-- celda vacía autocerrada -->
<td></td>      <!-- celda vacía normal -->
```

> `anselmo_1_1/index.html:113` usa `<td/>` para artista vacío
> `hotel_4_2/index.html:33` usa `<td></td>` para lujo vacío

---

## Etiquetas semánticas (estructura de la página)

HTML5 ofrece etiquetas que dan significado a las distintas zonas de la página:

```html
<header>   <!-- Cabecera de la página o sección -->
<main>     <!-- Contenido principal -->
<section>  <!-- Sección temática del contenido -->
<article>  <!-- Contenido independiente (noticia, post...) -->
<footer>   <!-- Pie de página -->
```

Ejemplo de estructura completa:

```html
<header>
    <h1>STAR WARS</h1>
    <h2>Andor</h2>
</header>

<main>
    <section class="reparto">
        <ul>
            <li>Diego Luna como Cassian Andor</li>
        </ul>
    </section>
</main>

<footer>
    <p>Pie de página</p>
</footer>
```

> Se usan en todos los exámenes: `ra2.html:12` (`<header>`), `ra2.html:17` (`<main>`), `ra2.html:18` (`<section>`), `ra2.html:19` (`<article>`), `ra2.html:59` (`<footer>`)
>
> En XSL: `artistas.html:22` (`<main>`), `discos2.html:249` (`<div class="footer">`)

### `<center>` (obsoleta pero usada)

La etiqueta `<center>` centra todo su contenido. **Está obsoleta en HTML5** pero aparece en algunos archivos:

```html
<center>
    <h1>Título centrado</h1>
    <table>...</table>
</center>
```

> Se usa en `Bailes.html:18-85`. Lo correcto hoy sería usar CSS: `text-align: center` o `margin: 0 auto`

---

## Formularios

Los formularios permiten recoger datos del usuario:

```html
<form action="mailto:ejemplo@correo.org" method="post" enctype="text/plain">
    <label for="usuario">Usuario:</label>
    <input type="text" id="usuario" name="usuario" required>

    <label for="contrasena">Contraseña:</label>
    <input type="password" id="contrasena" name="contrasena" required>

    <input type="reset" value="Limpiar">
    <input type="submit" value="Enviar">
</form>
```

<form style="background-color:#f0f0f0;border:1px solid #ccc;padding:15px;display:inline-block">
    <div style="margin-bottom:10px">
        <label for="demo_usuario">Usuario:</label>
        <input type="text" id="demo_usuario" style="width:200px;padding:3px">
    </div>
    <div style="margin-bottom:10px">
        <label for="demo_contrasena">Contraseña:</label>
        <input type="password" id="demo_contrasena" style="width:200px;padding:3px">
    </div>
    <div>
        <input type="reset" value="Limpiar" style="padding:5px 15px">
        <input type="submit" value="Enviar" style="padding:5px 15px">
    </div>
</form>

| Etiqueta/Atributo | Descripción |
|---|---|
| `<form>` | Contenedor del formulario |
| `action` | A dónde se envían los datos |
| `method` | Método HTTP (`get` o `post`) |
| `<label>` | Etiqueta descriptiva de un campo |
| `for` | Vincula el label con el `id` del input |
| `<input>` | Campo de entrada |
| `type="text"` | Campo de texto normal |
| `type="password"` | Campo que oculta lo que escribes |
| `type="number"` | Campo solo para números |
| `type="submit"` | Botón para enviar |
| `type="reset"` | Botón para limpiar el formulario |
| `required` | El campo es obligatorio |

> Se usa en `ejercicio3.html:70-85` (examen 2025) y `ra3.html:12-22` (examen 2026)

### Botón independiente

También existe la etiqueta `<button>`:

```html
<button id="calcular">Calcular el perímetro</button>
```

<button id="demo_calcular" style="padding:5px 15px">Calcular el perímetro</button>

> Se usa en `ra3.html:22`

---

## Otras etiquetas usadas en los exámenes y XSL

### `<div>` y `<span>`

Son contenedores genéricos sin significado semántico:

- `<div>` → contenedor de bloque (ocupa toda la línea)
- `<span>` → contenedor en línea (solo ocupa su contenido)

```html
<div class="logo-container">
    <img src="Logo.png" alt="Logo">
</div>

<span>Reparto:</span>
```

> `<div>` se usa en `ejercicio1.html:13`, `ra2.html:20`, `ra2.html:27`. `<span>` se usa en `index.html:33` (examen 2023)
>
> En XSL: `discos1.html:49` (`<div>Octopus's Garden - 171</div>`), `biblioteca_3_1/index.html:16` (`<div class="libro">`), `coches_1_1/index.html:27` (`<span class="suv-icon">`)

### Múltiples clases en un elemento

Un elemento puede tener varias clases separadas por espacio:

```html
<div class="libro destacado">
    <h2>El amor en los tiempos del cólera</h2>
</div>
```

> Se usa en `biblioteca_3_1/index.html:23` con `class="libro destacado"` para aplicar estilos de `.libro` y `.destacado` a la vez

### `<fieldset>` y `<legend>`

Agrupan elementos de formulario con un título:

```html
<fieldset>
    <legend>STAR WARS</legend>
    <h1>Tripulación Perdida</h1>
</fieldset>
```

<fieldset style="border:8px solid white;border-radius:20px;padding:15px 40px;text-align:center">
    <legend style="padding:0 10px;font-weight:bold">STAR WARS</legend>
    <div style="font-size:1.5em;font-weight:bold">Tripulación Perdida</div>
</fieldset>

> Se usa en `ejercicio1.html:16-19`

### `<script>`

Enlaza un archivo JavaScript externo:

```html
<script src="ra3.js"></script>
```

> Se usa en `ra3.html:24`

### `<link>`

Enlaza una hoja de estilos CSS externa (va dentro del `<head>`):

```html
<link rel="stylesheet" href="style.css">
```

> Se usa en `index.html:8` (examen 2023), `ejercicio1.html:8`, `ejercicio2.html:8`, `ra2.html:8`
>
> En XSL: `discos1.html:36`, `discos2.html:47`

---

## CSS Básico

CSS (**Cascading Style Sheets**) controla la apariencia visual de la página: colores, tamaños, posiciones, etc.

### 3 formas de incluir CSS

**1. CSS externo** (recomendado) — archivo `.css` separado:

```html
<link rel="stylesheet" href="style.css">
```

> Se usa en `index.html:8` (examen 2023), `ejercicio1.html:8`, `ejercicio2.html:8`, `ra2.html:8`
>
> En XSL: `discos1.html:36`, `discos2.html:47`

**2. CSS interno** — dentro de `<style>` en el `<head>`:

```html
<head>
    <style>
        body {
            background-color: #E6E6FA;
            font-family: 'Times New Roman', Times, serif;
        }
    </style>
</head>
```

> Se usa en `ejercicio3.html:8-64`
>
> En XSL: `anselmo_1_1/index.html:5-28`, `discos1.html:5-34`, `Bailes.html:3-15`, `artistas.html:5-19`, `coches_1_1/index.html:6-12`, `biblioteca_3_1/index.html:6-11`, `hotel_4_1/index.html:6-12`, etc.

**3. CSS en línea** — atributo `style` directamente en la etiqueta (no recomendado):

```html
<p style="color: red; font-size: 20px;">Texto rojo</p>
```

---

### Selectores CSS

| Selector | Ejemplo | Descripción |
|---|---|---|
| Etiqueta | `body { }` | Selecciona todas las etiquetas `<body>` |
| Clase | `.cabecera-principal { }` | Selecciona elementos con `class="cabecera-principal"` |
| ID | `#calcular { }` | Selecciona el elemento con `id="calcular"` |
| Descendiente | `.bloque-reparto h3 { }` | Selecciona `<h3>` dentro de `.bloque-reparto` |
| Pseudo-clase | `.boton-reparto:hover { }` | Se aplica al pasar el ratón |
| Múltiples selectores | `th, td { }` | Aplica los mismos estilos a `th` y `td` |
| Pseudo-clase `:nth-child` | `tr:nth-child(even) { }` | Selecciona filas pares |
| `:nth-child` con columna | `td:nth-child(4) { }` | Selecciona la 4ª columna |
| Selector combinado | `.libro.destacado { }` | Elemento con AMBAS clases |
| Selector por etiqueta con clase | `img.soporte { }` | Solo `<img>` con clase `soporte` |

---

### Propiedades CSS más usadas en los exámenes y XSL

#### Colores y fondo

**Colores con nombre:**

```css
body {
    background-color: lightblue;    /* Color de fondo */
    color: black;                    /* Color del texto */
}
```

> `ra2.css:10` → `background-color: lightblue`
> `style.css:10` (2025) → `background-color: lightgreen`
> `style.css:7` (2023) → `background-color: Aqua; color: Navy`
> `discos1.css:16` → `background-color: gold`
> `artistas.html:12` → `background-color: aquamarine`
> `Bailes.html:8` → `background-color: gold`

**Colores hexadecimales:**

```css
h1 {
    color: #1a3a5c;                  /* Azul oscuro */
    border-bottom: 2px solid #1a3a5c;
}
```

> `coches_1_1/index.html:7` → `#1a3a5c` (azul)
> `coches_1_2/index.html:7` → `#2e7d32` (verde)
> `musica_2_1/index.html:7` → `#b71c1c` (rojo)
> `musica_2_2/index.html:7` → `#4a148c` (púrpura)
> `biblioteca_3_1/index.html:7` → `#e65100` (naranja)
> `biblioteca_3_2/index.html:7` → `#01579b` (azul)
> `hotel_4_1/index.html:7` → `#004d40` (verde azulado)
> `hotel_4_2/index.html:7` → `#311b92` (índigo)

**Colores con transparencia (rgba):**

```css
.libro.destacado {
    box-shadow: 0 2px 8px rgba(230, 81, 0, 0.15);
}
```

> `biblioteca_3_1/index.html:10` → sombra naranja semitransparente

#### Tipografía

```css
body {
    font-family: Helvetica, Arial, sans-serif;
    font-size: 140%;
}
```

> `ra2.css:12-13`, `style.css:11` (2025), `style.css:9-10` (2023)
>
> En XSL: `coches_1_1/index.html:6` → `font-family: Arial, sans-serif`, `discos1.css:4` → `font-family: Arial`

**Peso de fuente:**

```css
.footer {
    font-weight: bold;
}
```

> `discos1.css:26`, `hotel_4_2/index.html:12` → `font-weight: bold` en enlaces

#### Fuente personalizada con `@font-face`

```css
@font-face {
    font-family: 'StarWars';
    src: url('Starwars.ttf') format('truetype');
}

h1 {
    font-family: 'StarWars', sans-serif;
}
```

> Se usa en los 3 archivos CSS de exámenes: `ra2.css:1-4`, `style.css:1-4` (2025), `style.css:1-4` (2023)

#### Bordes y bordes redondeados

```css
.cabecera-principal {
    border: 8px solid white;
    border-radius: 20px;    /* Esquinas redondeadas */
}
```

> `ra2.css:22-23`, `style.css:34-35` (2025), `style.css:16-17` (2023)
>
> En XSL: `biblioteca_3_1/index.html:8` → `border-radius: 8px` en `.libro`

**Borde inferior como separador:**

```css
h1 {
    border-bottom: 2px solid #1a3a5c;
    padding-bottom: 0.5rem;
}
```

> Se usa en todos los archivos XSL: `coches_1_1/index.html:7`, `coches_1_2/index.html:7`, `musica_2_1/index.html:7`, `musica_2_2/index.html:7`, `biblioteca_3_1/index.html:7`, `biblioteca_3_2/index.html:7`, `hotel_4_1/index.html:7`, `hotel_4_2/index.html:7`

#### Bordes en tablas

```css
table, th, td {
    border: 1px black solid;
}
```

> `Bailes.html:4-5`, `artistas.html:6-7`
>
> `discos1.css:9` → `border: 4px solid black` (borde más grueso)
>
> `coches_1_1/index.html:9` → `border: 1px solid #ccc` (gris suave)

#### Sombra de texto

```css
h1 {
    text-shadow: 3px 3px 5px black;
}
```

> `ra2.css:35`, `style.css:49` (2025), `style.css:29` (2023)

#### Sombra de caja (box-shadow)

```css
img {
    box-shadow: 5px 5px 10px darkblue;
}
```

> `ra2.css:88`, `style.css:68` (2025), `style.css:59` (2023)
>
> En XSL: `biblioteca_3_1/index.html:10` → `box-shadow: 0 2px 8px rgba(230,81,0,0.15)` en `.libro.destacado`

#### Márgenes y relleno

```css
body {
    margin: 0;          /* Sin margen exterior */
    padding: 20px;      /* Relleno interior de 20px */
}
```

> `ra2.css:14-15`, `style.css:12-13` (2025), `style.css:11-12` (2023)
>
> En XSL: `coches_1_1/index.html:6` → `margin: 2rem`, `biblioteca_3_1/index.html:8` → `margin: 1rem 0`

#### Centrar un elemento

```css
main {
    max-width: 1200px;
    margin: 0 auto;     /* Centrado horizontal */
}
```

> `ra2.css:52-53`, `style.css:56-57` (2025), `style.css:43-44` (2023)
>
> En XSL: `anselmo_1_1/index.html:12` → `margin: auto` en `table`

#### Alineación de texto

```css
h2 {
    text-align: center;     /* Centrado */
}

p {
    text-align: justify;    /* Justificado */
}

td {
    text-align: center;     /* Centrado en celdas */
}
```

> `anselmo_1_1/index.html:7` → `text-align: center` en `h2`
> `ra2.css:101` → `text-align: justify` en `p`
> `Bailes.html:12` → `text-align: center` en `td`

#### Flexbox (distribución en fila/columna)

```css
.fila-superior {
    display: flex;       /* Activa flexbox */
    gap: 20px;           /* Espacio entre elementos */
    flex-wrap: wrap;     /* Permite saltar de línea */
}
```

> `ra2.css:57-60`, `style.css:20-25` (2025), `style.css:68-72` (2023)
>
> En XSL: `artistas.html:16-17` → `display: flex; justify-content: center` para centrar la tabla

#### Grid (rejilla)

```css
ul {
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;    /* 3 columnas iguales */
    gap: 10px;
}
```

> `style.css:140-143` (2025)

#### Imágenes flotantes

```css
.contenido img {
    float: right;              /* Flota a la derecha */
    width: 180px;
    height: auto;              /* Mantiene proporción */
    margin: 0 0 15px 15px;
    border-radius: 10px;
}
```

> `style.css:61-68` (2025), `style.css:53-60` (2023), `ra2.css:76-95`

**Imágenes con tamaño máximo:**

```css
img.soporte {
    max-width: 50px;
    height: auto;
}

img.nacionalidad {
    max-width: 100px;
    height: auto;
}
```

> `discos2.css:15-22` — controla el tamaño de iconos de soporte y banderas

#### Tablas con filas alternas (cebra)

```css
tr:nth-child(even) {
    background-color: #f5f8fa;
}
```

> `coches_1_1/index.html:11` → `#f5f8fa` (gris azulado claro)
> `coches_1_2/index.html:11` → `#e8f5e9` (verde claro)
> `musica_2_1/index.html:11` → `#fbe9e7` (rojo claro)
> `musica_2_2/index.html:12` → `#f3e5f5` (púrpura claro)
> `biblioteca_3_2/index.html:11` → `#e1f5fe` (azul claro)
> `hotel_4_1/index.html:11` → `#e0f2f1` (verde azulado claro)
> `hotel_4_2/index.html:11` → `#ede7f6` (índigo claro)

#### Alinear columnas numéricas a la derecha

```css
td:nth-child(4), td:nth-child(5), td:nth-child(6) {
    text-align: right;
}
```

> `hotel_4_1/index.html:12` — alinea las columnas de Subtotal, Extras y Coste total a la derecha

#### Transiciones y efectos hover

```css
img {
    transition: transform 0.3s;    /* Animación suave */
}

img:hover {
    transform: scale(1.02);        /* Crece un 2% al pasar el ratón */
}
```

> `style.css:61-64` (2023), `style.css:119-121` (2025)

#### Fondo semitransparente con imagen

```css
.bloque-reparto::before {
    content: '';
    position: absolute;
    background-image: url('Logo.png');
    opacity: 0.15;          /* 15% de opacidad */
    pointer-events: none;   /* No interacciona con el ratón */
}
```

> `ra2.css:132-148`

#### Icono con SVG inline como fondo

```css
.suv-icon {
    display: inline-block;
    width: 16px;
    height: 16px;
    background: url('data:image/svg+xml;utf8,<svg ...>') no-repeat center;
    background-size: contain;
}
```

> `coches_1_1/index.html:12` — inserta un icono de coche SUV sin necesidad de archivo externo

#### Listas sin viñetas

```css
ul {
    list-style: none;       /* Quita los puntos */
}
```

> `style.css:137` (2025)

#### Lista con imagen como viñeta

```css
ul {
    list-style-image: url('icono.png');
}
```

> `style.css:81` (2023)

#### Alineación vertical en celdas

```css
th, td {
    vertical-align: center;
}
```

> `discos1.css:11`, `discos2.css:11`

#### Espaciado entre secciones

```css
h2 {
    margin-top: 2rem;
}
```

> `musica_2_2/index.html:8` — separa el segundo título del primero

#### Colores de enlace

```css
a {
    color: #b71c1c;
}
```

> `musica_2_1/index.html:12` → enlaces rojos
> `hotel_4_2/index.html:12` → `color: #311b92; font-weight: bold` (índigo y negrita)

---

## Resumen rápido de etiquetas HTML vistas

| Etiqueta | Para qué sirve |
|---|---|
| `<!DOCTYPE html>` | Declara el tipo de documento |
| `<html>` | Raíz del documento |
| `<head>` | Metadatos |
| `<body>` | Contenido visible |
| `<h1>` a `<h6>` | Títulos |
| `<p>` | Párrafos |
| `<br>` | Salto de línea |
| `<strong>` | Texto en negrita (semántico) |
| `<a>` | Enlaces |
| `<img>` | Imágenes |
| `<ul>` / `<ol>` | Listas |
| `<li>` | Elementos de lista |
| `<table>` / `<tr>` / `<th>` / `<td>` | Tablas |
| `<thead>` | Cabecera de tabla |
| `<tbody>` | Cuerpo de tabla |
| `<header>` | Cabecera |
| `<main>` | Contenido principal |
| `<section>` | Sección temática |
| `<article>` | Contenido independiente |
| `<footer>` | Pie de página |
| `<div>` | Contenedor de bloque |
| `<span>` | Contenedor en línea |
| `<center>` | Centrar contenido (obsoleto) |
| `<form>` | Formulario |
| `<input>` | Campo de entrada |
| `<label>` | Etiqueta de campo |
| `<button>` | Botón |
| `<fieldset>` / `<legend>` | Agrupación con título |
| `<style>` | CSS interno |
| `<link>` | Enlace a CSS externo |
| `<script>` | Enlace a JavaScript |
| `<!-- -->` | Comentarios |
