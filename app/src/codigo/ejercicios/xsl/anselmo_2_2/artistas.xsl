<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
  
<html lang="es">
<head>
    <meta charset="UTF-8"/>
    <title>Artistas</title>
        <style>
    table,th,td {
      border: 1px black solid; 
      text-align: center;
    }
    
    th {
    background-color: aquamarine;
    }
    
    main {
      display: flex;
      justify-content:center;
    }
    </style>
  
</head>
<body>
    <main>
      <table>
      <tr>
        <th>Código</th>
        <th>Nombre</th>
        <th>Año de nacimiento</th>
        <th>Año de fallecimiento</th>
        <th>País</th>
        <th>Página web</th>
        </tr>
        <xsl:for-each select="artistas/artista">
        <xsl:sort select="nacimiento" data-type="number" order="ascending"/>
        
        <xsl:if test="nacimiento > 1500">
        <tr>
          <td><xsl:value-of select="@cod"/></td>
          <td><xsl:value-of select="nombreCompleto"/></td>
          <td><xsl:value-of select="nacimiento"/></td>
          <td>
          <xsl:choose>
            <xsl:when test="boolean(fallecimiento)"><xsl:value-of select="fallecimiento"/></xsl:when>
            <xsl:otherwise>Desconocido</xsl:otherwise>
          </xsl:choose></td>
          
          
          <td><xsl:value-of select="pais"/></td>
          <td>
          <a href="{string(fichaCompleta)}">Saber más</a>
          </td>
        </tr>
        
        </xsl:if>
      </xsl:for-each>
      </table>
    </main>
</body>
</html>
    </xsl:template>
</xsl:stylesheet>
