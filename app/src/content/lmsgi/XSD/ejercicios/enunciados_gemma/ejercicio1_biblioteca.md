# Ejercicio 1: Gestión de Biblioteca (`biblioteca_libros.xml`)
**Escenario:** Una biblioteca desea estandarizar su catálogo de libros y autores.
**Requerimientos del XSD:**
1. **Identificadores:** El atributo `tarea_id` y `id_autor` deben ser obligatorios y actuar como identificadores únicos (`ID`).
2. **ISBN:** El atributo `isbn` debe ser obligatorio y seguir el patrón de un ISBN-13 (13 dígitos numéricos, pudiendo contener guiones).
3. **Años:** El año de publicación (`anio`) debe ser un entero positivo comprendido entre el año 1000 y el 2026.
4. **Prioridades:** El atributo `prioridad` de los géneros secundarios solo puede aceptar los valores: `'Alto'`, `'Medio'` y `'Bajo'`.
5. **Tipos Booleanos:** Los atributos `isbn_valido` y `pausas_personales_recomendadas` solo admiten `'si'` o `'no'`.
6. **Cardinalidad:** 
   - Un libro puede tener múltiples `genero_secundario`.
   - Un libro puede tener uno o más `autor`.
7. **Estructura:** El elemento `colaboraciones` es opcional y puede estar vacío.
