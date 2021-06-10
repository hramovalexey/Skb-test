<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template name="copyAttrs">
        <xsl:for-each select="@*">
            <xsl:attribute name="{name(.)}">
                <xsl:value-of select="."></xsl:value-of>
            </xsl:attribute>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="/">
        <xsl:for-each select="*[local-name() = 'input']">
            <output>
                <xsl:for-each select="*">
                    <xsl:element name="{local-name()}">
                        <xsl:call-template name="copyAttrs"></xsl:call-template>
                        <xsl:for-each select="*">
                            <xsl:element name="{local-name()}">
                            <xsl:call-template name="copyAttrs"></xsl:call-template>
                                <xsl:attribute name="element_id">
                                    <xsl:value-of select="../@id"></xsl:value-of>
                                </xsl:attribute>
                                <xsl:value-of select="."></xsl:value-of>
                            </xsl:element>
                        </xsl:for-each>
                    </xsl:element>
                </xsl:for-each>
            </output>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>