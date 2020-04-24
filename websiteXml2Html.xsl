<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:strip-space elements="*"/>
    <xsl:output method="html"/>
    <xsl:key name="widgetId" match="/website/page/widget" use="@id"/>
    <xsl:template match="/website">
        <html>
            <head>
                <h1>Website</h1>
            </head>
            <body>
                <h2>Pages</h2>
                <xsl:for-each select="page">
                    <xsl:variable name="i" select="position()"/>
                    <p>
                        <xsl:copy>
                            <xsl:value-of select="concat($i , '.  ')"/>
                        </xsl:copy>
                        <xsl:value-of select="@name"/>,<xsl:value-of select="description"/>
                    </p>
                </xsl:for-each>

                <h2>Widgets</h2>

                <table border="1" cellpadding="2">
                    <tr>
                        <th>id</th>
                        <th>type</th>
                        <th>text</th>
                        <th>src</th>
                        <th>url</th>
                        <th>label</th>
                    </tr>

                    <xsl:for-each select="//*[generate-id() = generate-id(key('widgetId',@id)[1])]">
                        <tr>
                            <td>
                                <xsl:value-of select="@id"/>
                            </td>

                            <td>
                                <xsl:value-of select="@type"/>
                            </td>

                            <td>
                                <xsl:value-of select="text"/>
                            </td>

                            <td>
                                <xsl:value-of select="@src"/>
                            </td>

                            <td>
                                <xsl:value-of select="@url"/>
                            </td>

                            <td>
                                <xsl:value-of select="@label"/>
                            </td>

                        </tr>

                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>