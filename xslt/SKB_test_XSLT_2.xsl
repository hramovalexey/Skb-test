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
            <ns1:output xmlns:ns1="ns1:test" xmlns:ns2="ns2:test" xmlns:ns3="ns3:test">
                <xsl:for-each select="*">
                    <xsl:copy>
                        <xsl:call-template name="copyAttrs"></xsl:call-template>
                        <xsl:element name="ns3:concat">
                            <xsl:for-each select="*">
                                <xsl:value-of select="."></xsl:value-of>
                            </xsl:for-each>
                            <xsl:value-of select="@id"></xsl:value-of>
                        </xsl:element>
                    </xsl:copy>
                </xsl:for-each>
            </ns1:output>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>