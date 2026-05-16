## 1. Bloque: Catálogo de Automoción

**Archivo XML:** `coches_marcas.xml`

### Ejercicio 1.1: Informe de Potencia y Rendimiento

- **Transformación:** Crear `coches_potencia.xsl` y `estilos_coches.css`.
    
- **Requisitos:**
     
    - **Enlace CSS:** El HTML generado debe enlazar `estilos_coches.css`. No se permite estilo inline.
         
    - **Filtrado:** Mostrar solo modelos con `potencia_cv` superior a 150.
         
    - **Ordenación:** Descendente por el año de inicio (`anio_inicio`).
         
    - **Funciones:** Usa `concat()` para unir marca y nombre del modelo, y `translate()` para poner la marca en mayúsculas.
         
    - **Tabla:** Columnas para "Vehículo", "País", "CV" y "Consumo".
         
    - **Símbolo:** Si el modelo es tipo "SUV", añadir `&#128665;` junto al nombre.
