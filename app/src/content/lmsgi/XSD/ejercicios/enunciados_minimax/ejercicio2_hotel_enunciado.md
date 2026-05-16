# Ejercicio 2: Hotel - Sistema de Reservas

## Descripción

Un grupo hotelero utiliza documentos XML para gestionar sus hoteles, servicios, tipos de habitación y reservas. Cada documento puede contener varios hoteles con sus respectivas reservas.

## Requisitos del XSD

1. **Elemento raíz**: `hotel_system` con atributos:
   - `sistema_gestion` (string, obligatorio)
   - `fecha_revision` (date, obligatorio)

2. **Servicios globales** (obligatorio):
   - `servicio`: puede haber varios. Atributos:
     - `id` (string, obligatorio) - identificador único
     - `nombre` (string, obligatorio)
     - `tipo` (string, obligatorio) - valores: "Alimentación", "Servicios Personales", "Conectividad", "Aparcamiento", "Transporte"
     - `coste_unidad` (string, obligatorio)
     - `periodo_servicio` (string, obligatorio)

3. **Hotel**: Puede haber varios. Atributos:
   - `id` (string, obligatorio) - identificador único
   - `nombre` (string, obligatorio)
   - `clasificacion` (string, obligatorio) - valores: "1 Estrellas", "2 Estrellas", "3 Estrellas", "4 Estrellas", "5 Estrellas"
   - `capacidad_maxima_personas` (entero positivo, obligatorio)
   - `ubicacion_ciudad` (string, obligatorio)

4. **Infraestructura** (obligatorio):
   - `departamento`: puede haber varios. Atributos:
     - `nombre` (string, obligatorio)
     - `horario_operativo` (string, obligatorio)
     - `gestionado_por` (string, obligatorio)
     - `personal_recursos` (string, obligatorio)
     - `capacidad_max_mesas` (entero, opcional)
     - `estilo_gastronomico` (string, opcional)
     - `capacidad_max_personas` (entero, opcional)
     - `equipo_audiovisual_disponible` (string, opcional)

5. **Tipos de habitación** (obligatorio):
   - `tipo`: puede haber varios. Atributos:
     - `id` (string, obligatorio)
     - `nombre` (string, obligatorio)
     - `descripcion` (string, obligatorio)
     - `base_familia` (string, obligatorio)
     - `capacidad_maxima` (entero positivo, obligatorio)
     - `tarifa_base_minima` (decimal, obligatorio)
     - `equipamiento_base` (string, opcional)
     - `equipamiento_extra` (string, opcional)
     - `complementos_incluidos` (string, opcional)

6. **Reservas** (opcional):
   - `reserva`: puede haber varias. Atributos:
     - `id` (string, obligatorio)
     - `fecha_checkin` (date, obligatorio)
     - `fecha_checkout` (date, obligatorio)
     - `estado_pago` (string, obligatorio) - valores: "Pagado", "Pendiente", "Cancelado"

7. **Cliente** (obligatorio):
   - Atributos: `id` (string), `nombre` (string), `email` (string), `descripcion_viaje` (string)
   - `datos_registro`: atributos `documento_identidad` (string), `nacionalidad` (string)
     - `direccion` (string)
     - `telefono_contacto` (string)

8. **Detalle de estancia** (obligatorio):
   - `habitacion`: atributos `id_tipo` (string), `num_asignada` (string), `ocupantes_adultos` (entero), `ocupantes_niños` (entero)
     - `tipo_reserva` (string)
     - `servicios_extra_detalles`: contiene `servicio` (ref_id, cantidad, costo_extra) y `concepto_adicional` (nombre, unidad, costo_extra)
   - `resumen_facturacion`:
     - `subtotal_estadia`: atributo `moneda` (string)
     - `impuesto_turistico`: atributos `tipo` (string), `tasa` (string), `monto_impuesto` (string)
     - `coste_total`: atributo `moneda` (string)

## Archivo XML de referencia

Ver: `hotel_reservas.xml`

## Tarea

Crea un archivo XSD que valide este tipo de documentos XML, eligiendo los tipos de datos más apropiados para cada elemento y atributo.