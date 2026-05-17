<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Mi Discoteca</title>
                
                <link rel="stylesheet" href="discos1.css" />                
            </head>
            <body>
                <h2>Mi Discoteca (discos anteriores a 1975)</h2>
                <table>
                    <tr>
                        <th>Título</th>
                        <th>Canciones (menos de 300 segundos y ordenadas por duración)</th>
                    </tr>
                    <!-- Ordenar discos por título -->
                    <xsl:for-each select="Discoteca/disco[año &lt; 1975]">
                        <xsl:sort select="titulo" />
                        <tr>
                            <td>
                                <xsl:value-of select="titulo" />
                            </td>
                            <td>
                                <xsl:for-each select="cancion[number(@tiempo) &lt; 300]">
                                    <xsl:sort select="@tiempo" data-type="number" />
                                    <div>
                                        <xsl:value-of select="." /> - <xsl:value-of select="@tiempo" />
                                    </div>
                                </xsl:for-each>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
                <div class="footer">Está ordenado por título.</div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>