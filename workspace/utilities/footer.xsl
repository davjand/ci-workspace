<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
<xsl:template name="footer">

	
	<div id="footer">		
		<div class="container">
			<div class="sixteen columns">
				<xsl:text>Copyright </xsl:text>
				<xsl:value-of select="$site-title"/>
				<xsl:text> </xsl:text>
				<xsl:value-of select="$this-year"/>
				
				<div id="veo">
					<a href="http://veodesign.co.uk" title="Veo Design">
						<img src="{$workspace}/images/main/veo_footer.png" title="Veo Design" alt="Veo Design"/>
					</a>
				</div>					
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript"> 
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
		try {
		var pageTracker = _gat._getTracker("<xsl:value-of select='//data/settings/entry/analytics-code'/>");
		pageTracker._trackPageview();
		} catch(err) {}
	</script> 	

</xsl:template>	
	
</xsl:stylesheet>