<?xml version="1.0" encoding="UTF-8"?>
<!-- master.xsl
 * Master xsl file for Symphony template 	
 * Author: David Anderson 2011
 * dave@veodesign.co.uk
-->
<xsl:stylesheet version="1.0"
		xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
		xmlns:date="http://exslt.org/dates-and-times"
		xmlns:exsl="http://exslt.org/common"
		xmlns:form="http://nick-dunn.co.uk/xslt/form-controls"
		extension-element-prefixes="exsl form date">

<xsl:output method="xml"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="yes"
    encoding="UTF-8"
    indent="yes" />

<!-- ********************************* -->
<!-- includes -->
<!-- ********************************* -->

<!-- symphony utils -->
<xsl:import href="typography.xsl"/>
<xsl:import href="html-truncate.xsl"/>
<xsl:import href="date-time.xsl"/>
<xsl:import href="nl2br.xsl"/>

<!--custom utils-->
<xsl:import href="header.xsl"/>
<xsl:import href="footer.xsl"/>
<xsl:import href="page-title.xsl"/>
<xsl:import href="image-format.xsl"/>
<xsl:import href="navigation.xsl"/>



<!-- ********************************* -->
<!-- global variables -->
<!-- ********************************* -->
<xsl:variable name="site-title" select="//data/settings/entry/site-title" />


<!-- ********************************* -->
<!-- root template -->
<!-- ********************************* -->

<xsl:template match="/">
	
<xsl:comment><![CDATA[[if lt IE 7 ]><html xmlns:fb="http://ogp.me/ns/fb#" lang="en" class="no-js ie6 ]]><xsl:value-of select="concat('page-',$current-page)"/><![CDATA["><![endif]]]></xsl:comment>
		<xsl:comment><![CDATA[[if IE 7 ]><html xmlns:fb="http://ogp.me/ns/fb#" lang="en" class="no-js ie7 ]]><xsl:value-of select="concat('page-',$current-page)"/><![CDATA["><![endif]]]></xsl:comment>
		<xsl:comment><![CDATA[[if IE 8 ]><html xmlns:fb="http://ogp.me/ns/fb#" lang="en" class="no-js ie8 ]]><xsl:value-of select="concat('page-',$current-page)"/><![CDATA["><![endif]]]></xsl:comment>
		<xsl:comment><![CDATA[[if IE 9 ]><html xmlns:fb="http://ogp.me/ns/fb#" lang="en" class="no-js ie9 ]]><xsl:value-of select="concat('page-',$current-page)"/><![CDATA["><![endif]]]></xsl:comment>
		<xsl:comment><![CDATA[[if (gt IE 9)|!(IE)]><!]]></xsl:comment><html lang="en" xmlns:fb="http://ogp.me/ns/fb#" class="no-js page-{$current-page}"><xsl:comment><![CDATA[<![endif]]]></xsl:comment>
<head>
	
	<!-- Basic Page Needs
  	================================================== -->
  	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title><xsl:apply-templates select="data"  mode="site-title"/></title>
	
	<!-- Meta
  	================================================== -->
	<meta name="robots" content="index, follow" />
	<meta name="description" content="{//data/settings/entry/site-description}"/>
	
	<meta name="google-site-verification" content="{//data/settings/entry/google-site-verification}" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	
	<!-- Mobile Specific Metas
  	================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	
	<!-- Favicons
	================================================== -->
	<link rel="shortcut icon" href="{$workspace}/images/favicon.ico">
	<link rel="apple-touch-icon" href="{$workspace}/images/apple-touch-icon.png">
	<link rel="apple-touch-icon" sizes="72x72" href="{$workspace}/images/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="{$workspace}/images/apple-touch-icon-114x114.png">
	

	<!-- Skeleton
	================================================== -->
   	<link rel="stylesheet" href="{$workspace}/css/base.css">
	<link rel="stylesheet" href="{$workspace}/css/skeleton.css">
	<link rel="stylesheet" href="{$workspace}/css/layout.css">
	<link rel="stylesheet" href="{$workspace}/css/colorbox.css" type="text/css"/>
    
    <!-- Template CSS
	================================================== -->
    <link rel="stylesheet"  href="{$workspace}/css/typography.css" type="text/css"/>    
	<link rel="stylesheet"  href="{$workspace}/css/main.css" type="text/css"/>
 

</head>

<body class="page-{$current-page}">
	<div id="bg">
		<xsl:call-template name="header" />
		
		<div id="wrapper">
			<div class="container">						
				<xsl:apply-templates match="data" />
			</div>
		</div>
				
		<xsl:call-template name="footer" />		
	</div><!-- #bg -->

    <!-- JS
	================================================== -->
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>    
	<script type="text/javascript">
		//GOOGLE JSAPI LOADING OF JQUERY, JQUERY UI AND MAPS
		google.load("jquery", "1.7.0");
		google.load("jqueryui", "1.8.16");
		google.load('maps', '3', {other_params:'sensor=false'}); 
	 	google.setOnLoadCallback(function() {<xsl:apply-templates select="//data" mode="init-js" />});
		
		//ANALYTICS
		var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
		document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
		try {
		var pageTracker = _gat._getTracker("<xsl:value-of select='//data/settings/entry/analytics-code'/>");
		pageTracker._trackPageview();
		} catch(err) {}
	</script> 
	
	<script type="text/javascript" src="{$workspace}/js/modernizr.js"></script>
	<script type="text/javascript" src="{$workspace}/js/jquery.plugins.js"></script>
	<script type="text/javascript" src="{$workspace}/js/tabs.js"></script>	
	<script type="text/javascript" src="{$workspace}/js/javascript.js"></script>

</body>
</html>        	
                
</xsl:template>


</xsl:stylesheet>