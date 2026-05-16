## 3. Bloque: Biblioteca y Literatura

**Archivo XML:** `biblioteca_libros.xml`

### Ejercicio 3.1: Catálogo de Autores en Español

- **Transformación:** Crear `biblioteca_es.xsl` y `biblioteca.css`.
    
- **Requisitos:**
     
    - **Filtrado:** Libros donde `idioma_original` sea "Español".
         
    - **Ordenación:** Ascendente por año de publicación (`anio`).
         
    - **Funciones:** Usa `upper-case()` para el nombre del autor y `count()` para los géneros secundarios.
         
    - **Formato:** Si el libro tiene más de 500 páginas, aplicar una clase CSS "destacado".
