# Ejercicio 2: Catálogo de Automoción (`coches_marcas.xml`)
**Escenario:** Una base de datos de marcas y modelos de coches para una web de comparativas.
**Requerimientos del XSD:**
1. **Identificadores:** Los atributos `id` de marca y modelo deben ser `ID`.
2. **Colores:** El atributo `color_primario` debe seguir el patrón de un color hexadecimal (ej: `#FFFFFF` o `#ABCDEF`).
3. **Potencia:** El elemento `potencia_cv` debe ser un entero positivo.
4. **Consumos:** Los atributos `ciudad_l/100km` y `autopista_l/100km` deben ser números decimales positivos con un máximo de 2 decimales.
5. **Enumeraciones:** 
   - El atributo `motor_primario` solo acepta: `'Gasolina'`, `'Diesel'`, `'Híbrido'`, `'Eléctrico'`.
   - El atributo `tipo` de modelo solo acepta: `'Sedán'`, `'SUV'`, `'Coupe'`, `'Cabrio'`.
6. **Rango:** El atributo `dias_existen` debe ser un entero positivo.
7. ** cardinalidad:** Una marca puede tener cero o más modelos.
