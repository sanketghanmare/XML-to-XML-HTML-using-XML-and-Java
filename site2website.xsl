<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <xsl:key name="component" match="component" use="@id"/>

    <xsl:template match="/site">
        <website>
            <xsl:copy-of select="@id | @name"/>
            <description>
                <xsl:value-of select="@description"/>
            </description>
            <xsl:apply-templates select="views/view"/>
        </website>
    </xsl:template>

    <xsl:template match="view">
        <page>
            <xsl:copy-of select="@id | @name | description"/>
            <xsl:apply-templates select="component"/>
        </page>
    </xsl:template>

    <xsl:template match="component">
        <xsl:variable name="component" select="key('component', @ref)"/>
        <widget>
            <xsl:copy-of
                    select="$component/@id | $component/@type | $component/@src | $component/@url | $component/@label | $component/text"/>
        </widget>
    </xsl:template>

</xsl:stylesheet>

<!-- <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="site">
        <website>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:attribute name="name">
                <xsl:value-of select="@name"/>
            </xsl:attribute>
            <description>
                <xsl:value-of select="@description"/>
            </description>
            <xsl:apply-templates select="views/view"/>
        </website>
    </xsl:template>
    <xsl:template match="views/view">
        <page>
            <xsl:attribute name="id">
                <xsl:value-of select="@id"/>
            </xsl:attribute>
            <xsl:attribute name="name">
                <xsl:value-of select="@name"/>
            </xsl:attribute>
            <description>
                <xsl:value-of select="description"/>
            </description>
            <xsl:for-each select="component">
                <widget>
                    <xsl:attribute name="id">
                        <xsl:value-of select="@ref"/>
                    </xsl:attribute>
                    <xsl:attribute name="type">
                      <xsl:value-of select="/site/components/component[@id=current()/@ref]/@type"/>
                    </xsl:attribute>
                </widget>
            </xsl:for-each>

        </page>
    </xsl:template>
</xsl:stylesheet> -->