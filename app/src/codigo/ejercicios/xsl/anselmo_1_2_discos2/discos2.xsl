<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Mi Discoteca</title>
                
                <link rel="stylesheet" href="discos2.css" />                
            </head>
            <body>
                <h2>Mi Discoteca (ordenada en descendente por año)</h2>
                <table>
                    <tr>
                        <th>Título</th>
                        <th>Soporte</th>
                        <th>Género</th>
                        <th>Artista</th>
                        <th>Nacionalidad</th>
                        <th>Año</th>
                        <th>Canciones</th>
                    </tr>
                    <!-- Ordenar discos por año -->
                    <xsl:for-each select="Discoteca/disco">
                        <xsl:sort select="año" order="descending"/>
                        <tr>
                            <td>
                                <xsl:value-of select="titulo" />
                            </td>
                            <td>
                                <img src="{concat('imagenes/', lower-case(soporte), '.png')}" class="soporte"/>
                            </td>
                            <td>
                                <xsl:value-of select="./@género" />
                            </td>
                            <td>
                                <xsl:value-of select="artista" />
                            </td>
                            <td>
                                <xsl:call-template name="reemplazar-nacionalidad">
                                    <xsl:with-param name="texto" select="lower-case(artista/@nacionalidad)"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:value-of select="año" />
                            </td>
                            <td>
                                <xsl:for-each select="cancion">
                                    <div>
                                        <xsl:value-of select="." />
                                    </div>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <div class="footer"><a href="https://www.flaticon.es">Iconos creados por Freepik - Flaticon</a></div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template name="reemplazar-nacionalidad">
        <xsl:param name="texto" />
        <xsl:choose>
            <xsl:when test="contains($texto, 'estados unidos')">
                <img src="imagenes/usa.png" class="nacionalidad"/>
            </xsl:when>
            <xsl:when test="contains($texto, 'reino unido')">
                <img src="imagenes/uk.png" class="nacionalidad"/>
            </xsl:when>
            <xsl:otherwise>
                <img src="{concat('imagenes/', $texto, '.png')}" class="nacionalidad"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
