# Ejercicio 4: Automoción - Catálogo de Marcas

## Descripción

Un concesionario utiliza documentos XML para gestionar su catálogo de automóviles por marcas. Cada documento contiene información de marcas, modelos, atributos técnicos, equipamiento y colores preferidos.

## Requisitos del XSD

1. **Elemento raíz**: `catalogo_automocion`

2. **Marcas**: Uno o más elementos `marca`. Atributos:
   - `id` (string, obligatorio) - identificador único
   - `pais` (string, obligatorio)
   - `dias_existen` (entero positivo, obligatorio)
   - `estilo` (string, obligatorio)

3. **Nombre de marca** (obligatorio): String con el nombre de la marca

4. **Logotipos** (obligatorio):
   - `formato`: puede haber varios. Atributos:
     - `formato` (string, obligatorio)
     - `color_primario` (string, obligatorio) - formato hexadecimal: #XXXXXX
     - `historia` (string, obligatorio)

5. **Modelos** (obligatorio):
   - `modelo`: puede haber varios. Atributos:
     - `id` (string, obligatorio)
     - `nombre` (string, obligatorio)
     - `anio_inicio` (entero positivo, obligatorio)
     - `anio_actual` (entero positivo, obligatorio)
     - `tipo` (string, obligatorio)
     - `motor_primario` (string, obligatorio)

6. **Atributos del modelo** (obligatorio):
   - `potencia_cv`: atributo `unidad` (string), contenido (entero positivo)
   - `transmision`: atributo `tipos_compatibles` (string), contenido (string)
   - `consumo_combustible`: atributos `ciudad_l/100km` (decimal), `autopista_l/100km` (decimal)

7. **Equipamiento** (obligatorio):
   - `sistema_infotainment`: atributos `marca_soporte` (string), `conectividad` (string)
   - `tecnologia_seguridad`: atributo `incluye` (string)

8. **Color preferido** (opcional):
   - Atributos: `swatch` (string, formato hexadecimal), `temporada` (string)

## Restricciones adicionales

- El año actual debe ser mayor o igual que el año de inicio
- Los valores de consumo deben ser números positivos con hasta un decimal
- El atributo `dias_existen` debe ser un número entero positivo

## Archivo XML de referencia

Ver: `coches_marcas.xml`

## Tarea

Crea un archivo XSD que valide este tipo de documentos XML, eligiendo los tipos de datos más apropiados para cada elemento y atributo.