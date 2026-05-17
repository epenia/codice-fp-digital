<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html>
      <head>
          <style>
      table, th, td {
        border: 1px black solid;
      }
      th {
     background-color: gold; 
      }
      
      td {
      text-align: center;
      }
      
    </style>
  </head>
      <body>
      <center>
      <h1>BAILES DE SALÓN</h1>
        <table>
          <tr>
            <th>Nombre</th>
            <th>Profesor</th>
            <th>Plazas</th>
            <th>Precio</th>
          </tr>
          <xsl:for-each select="Bailes/baile">
          <xsl:sort select="plazas" data-type="number" order="descending"/>
                    <xsl:if test="plazas >= 10">

            <tr>
              <td>
                <xsl:value-of select="nombre"/>
              </td>
              <td>
               <xsl:for-each select="profesor">
                <xsl:value-of select="."/><br/>
                                </xsl:for-each>
              </td>
              <td>
                <xsl:value-of select="plazas"/>
              </td>
              <td>
                <xsl:value-of select="precio"/>
                <xsl:choose>
                  <xsl:when test="precio/@moneda eq 'euro'"> &#8364;</xsl:when>
                  <xsl:when test="precio/@moneda eq 'dolares'"> &#36;</xsl:when>
                  <xsl:when test="precio/@moneda eq 'libras'"> &#xA3;</xsl:when>
                  <xsl:otherwise > &#8364;</xsl:otherwise>
                </xsl:choose>
              </td>
            </tr>
            </xsl:if>
          </xsl:for-each>
        </table>
        <h4>Ordenado en descendente por plazas superior o igual a 10.</h4>
      </center>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
