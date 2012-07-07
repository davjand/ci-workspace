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

<!-- ********************************* -->
<!-- includes -->
<!-- ********************************* -->

<!-- symphony utils -->
<xsl:import href="typography.xsl"/>
<xsl:import href="html-truncate.xsl"/>
<xsl:import href="date-time.xsl"/>

<!--custom utils-->
<xsl:import href="string.xsl"/>
<xsl:import href="image-format.xsl"/>

<xsl:output method="xml"
    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
    omit-xml-declaration="yes"
    encoding="UTF-8"
    indent="yes" />


<!-- ********************************* -->
<!-- global variables -->
<!-- ********************************* -->
<xsl:variable name="settings" select="//data/settings" />
<xsl:variable name="site-title" select="$settings/entry/site-title" />

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
	<meta name="description">
		<xsl:attribute name="content"><xsl:apply-templates select="data"  mode="site-description"/></xsl:attribute>
	</meta>
	
	<meta name="google-site-verification" content="{//data/settings/entry/google-site-verification}" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	
	<!-- Mobile Specific Metas
  	================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
	
	<!-- Favicons
	================================================== -->
	<link rel="shortcut icon" href="{$workspace}/images/favicon.ico"/>
	<link rel="apple-touch-icon" href="{$workspace}/images/apple-touch-icon.png"/>
	<link rel="apple-touch-icon" sizes="72x72" href="{$workspace}/images/apple-touch-icon-72x72.png"/>
	<link rel="apple-touch-icon" sizes="114x114" href="{$workspace}/images/apple-touch-icon-114x114.png"/>
	

	<!-- Skeleton
	================================================== -->
   	<link rel="stylesheet" href="{$workspace}/css/base.css"/>
	<link rel="stylesheet" href="{$workspace}/css/skeleton.css"/>
	<link rel="stylesheet" href="{$workspace}/css/layout.css"/>
	<link rel="stylesheet" href="{$workspace}/css/colorbox.css" type="text/css"/>
    
    <!-- Template CSS
	================================================== -->
    <link rel="stylesheet"  href="{$workspace}/css/typography.css" type="text/css"/>    
	<link rel="stylesheet"  href="{$workspace}/css/main.css" type="text/css"/>
 
 
	<!-- JQuery and JQuery UI bases
	================================================== -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js" type="text/javascript"></script>

</head>

<body class="page-{$current-page}">
	<div id="bg">
		<div id="header">
			<div class="container">
				<div id="header-logo">
					<a href="$root"></a>
				</div>
				<div id="navigation">
				
				</div>			
			</div>
		</div> <!-- #header -->
		
		
		<div id="wrapper">
			<div class="container">						
				<xsl:apply-templates match="data" />
			</div>
		</div>
				
		<div id="footer">		
			<div class="container">
				<div class="sixteen columns">
					<xsl:text>Copyright </xsl:text>
					<xsl:value-of select="$site-title"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="$this-year"/>				
				</div>
			</div>
		</div>	
	</div><!-- #bg -->

    <!-- JS
	================================================== -->
    <script type="text/javascript" src="http://www.google.com/jsapi"></script>    
	<script type="text/javascript">		
		//ANALYTICS
	  	var _gaq = _gaq || [];
	  	_gaq.push(['_setAccount', '<xsl:value-of select='//data/settings/entry/analytics-code'/>']);
	  	_gaq.push(['_trackPageview']);
	  	(function() {
	  	  var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	  	  ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	  	  var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  	})();
	</script> 
	
	<script type="text/javascript" src="{$workspace}/js/modernizr.js"></script>
	<script type="text/javascript" src="{$workspace}/js/jquery.plugins.js"></script>
	<script type="text/javascript" src="{$workspace}/js/javascript.js"></script>

</body>
</html>        	
                
</xsl:template>

<!--site title-->
<xsl:template match="data" mode="site-title" priority="-1">

	<!--see what the page title is-->
	<xsl:choose>
		<xsl:when test="$page-title='Home'">
			<xsl:value-of select="$site-title" />
			<xsl:text> - Homepage </xsl:text>
		</xsl:when>

		
		<!--otherwise nothing found -->		
		<xsl:otherwise>
			<xsl:value-of select="$page-title" />
			<xsl:text> - </xsl:text>		
			<xsl:value-of select="$site-title" />
		</xsl:otherwise>	
	</xsl:choose>
</xsl:template>

<!--meta-->
<xsl:template match="data" mode="site-description" priority="-1">	
	<xsl:value-of select="//data/settings/entry/site-description" />
</xsl:template>

<xsl:template match="data" mode="init-js" priority="-1"></xsl:template>


</xsl:stylesheet>