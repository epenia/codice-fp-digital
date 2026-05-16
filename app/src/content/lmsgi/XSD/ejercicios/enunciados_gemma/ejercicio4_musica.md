# Ejercicio 4: Catálogo de Música Rock (`musica_rock.xml`)
**Escenario:** Archivo histórico de bandas, álbumes y canciones de rock.
**Requerimientos del XSD:**
1. **Identificadores:** Los `id` de banda, álbum y canción deben ser `ID`.
2. **Tiempos:** 
   - La `duracion_min` de las canciones debe ser un decimal positivo (máx 2 decimales).
   - El `tiempo_bpm` debe ser un entero entre 40 y 300.
3. **Estado:** El atributo `activo` de las bandas y miembros solo admite `'si'` o `'no'`.
4. **Formatos:** El atributo `formato_original` del álbum solo acepta: `'Vinyl LP'`, `'CD'`, `'Digital Audio'`, `'Cassette'`.
5. **Patrones:** El atributo `id` de los miembros debe empezar por 'M' seguido de 3 números (ej: M001).
6. **Cardinalidad:** 
   - Una banda debe tener obligatoriamente una lista de `membreros`.
   - El elemento `gira_destacada` es opcional (0 o 1).
7. **Contenido:** El elemento `nota_histórica` es opcional y debe ser una cadena de texto.
