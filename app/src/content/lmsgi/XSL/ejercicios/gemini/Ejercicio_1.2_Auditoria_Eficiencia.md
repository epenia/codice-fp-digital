## 1. Bloque: Catálogo de Automoción

**Archivo XML:** `coches_marcas.xml`

### Ejercicio 1.2: Auditoría de Eficiencia Energética

- **Transformación:** Crear `coches_eficiencia.xsl` y `eficiencia.css`.
    
- **Requisitos:**
     
    - **Filtrado:** Modelos cuyo `consumo_combustible/@ciudad_l/100km` sea inferior a 8.0.
         
    - **Funciones:** Utiliza `string-length()` para validar que el nombre del modelo tenga más de 2 caracteres.
         
    - **Lógica:** Si el `motor_primario` contiene "Híbrido", mostrar la entidad `&#9889;` (rayo).
         
    - **Cálculo:** Usa `sum()` para calcular el total de potencia de todos los coches mostrados al final de la tabla.
