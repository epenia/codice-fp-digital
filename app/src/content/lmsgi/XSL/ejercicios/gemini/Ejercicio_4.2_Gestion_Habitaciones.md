## 4. Bloque: Sistema de Reservas de Hotel

**Archivo XML:** `hotel_reservas.xml`

### Ejercicio 4.2: Gestión de Habitaciones y Servicios

- **Transformación:** Crear `hotel_habitaciones.xsl` y `habitaciones.css`.
    
- **Requisitos:**
     
    - **Filtro dinámico:** Mostrar solo habitaciones cuya `tarifa_base_minima` sea superior a 200.
         
    - **Tratamiento de Nulos:** Si no hay `complementos_incluidos`, mostrar "Sin servicios adicionales".
         
    - **Funciones:** `contains()` para identificar si la descripción incluye la palabra "Lujo".
         
    - **Vínculo:** Enlace "Reservar ahora" que apunte a `mailto:recepcion@hotel.com`.
