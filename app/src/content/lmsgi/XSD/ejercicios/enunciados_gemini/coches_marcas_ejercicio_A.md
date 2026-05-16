### Ejercicio A: Especificaciones Técnicas del Motor

**Basado en:** `coches_marcas.xml`

Crea un esquema para el elemento `<atributos>` de los modelos:

- **Patrones (Regex):** El elemento `<potencia_cv>` debe ser un número positivo y su atributo `unidad` debe ser obligatoriamente "CaballosVapor".

- **Listas y Restricciones:** El elemento `<transmision>` tiene un atributo `tipos_compatibles`. Define este atributo para que solo acepte una lista de valores: 'Automática' y/o 'Manual'.

- **Decimales:** El elemento `<consumo_combustible>` tiene atributos `ciudad_l/100km` y `autopista_l/100km`. Ambos deben ser números positivos con un máximo de dos decimales.