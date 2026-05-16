## 3. Bloque: Biblioteca y Literatura

**Archivo XML:** `biblioteca_libros.xml`

### Ejercicio 3.2: Informe de Metadatos y Cronología

- **Transformación:** Crear `biblioteca_cronos.xsl` y `detalles.css`.
    
- **Requisitos:**
     
    - **Funciones:** Extraer el año de nacimiento del autor usando `substring-before(nacimientos, '-')`.
         
    - **Entidades:** Si `pausas_personales_recomendadas` es "Sí", mostrar `&#9208;`.
         
    - **Cálculo:** `sum()` de la `tirada_estimada` de todos los libros del catálogo.
