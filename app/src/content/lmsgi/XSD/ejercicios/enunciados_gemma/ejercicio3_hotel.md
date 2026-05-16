# Ejercicio 3: Sistema de Reservas de Hotel (`hotel_reservas.xml`)
**Escenario:** Un sistema de gestión hotelera que vincula servicios globales con reservas específicas.
**Requerimientos del XSD:**
1. **Relaciones (ID/IDREF):** 
   - El `id` de los servicios y hoteles debe ser `ID`.
   - El atributo `ref_id` dentro de las reservas debe ser una referencia (`IDREF`) a un servicio global.
2. **Fechas:** Los atributos `fecha_checkin` y `fecha_checkout` deben usar el tipo `date` de XSD.
3. **Precios:** Atributos como `coste_unidad`, `tarifa_base_minima` y `coste_total` deben ser decimales positivos.
4. **Validación de Documentos:** El atributo `documento_identidad` debe seguir el patrón de un DNI español (8 números y una letra mayúscula al final).
5. **Email:** El atributo `email` debe validar que contiene un símbolo `@` y un dominio (usa un patrón regex simple).
6. **Categorías:** La `clasificacion` del hotel solo puede ser: `'1 Estrellas'`, `'2 Estrellas'`, `'3 Estrellas'`, `'4 Estrellas'`, `'5 Estrellas'`.
7. **Cardinalidad:** El hotel debe tener obligatoriamente al menos un `tipo_habitacion`.
