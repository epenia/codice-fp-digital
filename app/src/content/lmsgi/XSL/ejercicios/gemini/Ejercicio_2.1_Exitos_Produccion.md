## 2. Bloque: Archivo Histórico del Rock

**Archivo XML:** `musica_rock.xml`

### Ejercicio 2.1: Éxitos y Producción Musical

- **Transformación:** Crear `rock_exitos.xsl` y `musica.css`.
    
- **Requisitos:**
     
    - **Lógica de Datos:** Si el atributo `hit_single` es "si", mostrar "¡Éxito!"; si no, dejar vacío.
         
    - **Tratamiento de Nulos:** Si `productor` es "N/A", mostrar **"Producción Propia"** mediante `xsl:choose`.
         
    - **Funciones:** Usa `substring()` para limitar las `notas_destacadas` a los primeros 30 caracteres.
         
    - **Vínculo:** Columna "Info" con enlace dinámico usando `concat()` hacia Google Search con el nombre de la canción.
