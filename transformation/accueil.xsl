<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>

<xsl:template match="/">
<html>
<head>
	<meta charset="utf-8"></meta>
    <meta name="viewport" content="width=device-width, initial-scale=1"></meta>
    <title>Accueil - Xin YU - Emilie XIA</title>
    <link rel="stylesheet" href="../web/css/font-awesome.min.css"></link>
    <link rel="stylesheet" href="../web/css/bootstrap.min.css"></link>
    <link rel="stylesheet" href="../web/css/magnific-popup.css"></link>
    <link rel="stylesheet" href="../web/css/templatemo-style.css"></link>
	<link rel="icon" href="../web/img/icone.png" type="image/x-icon"></link>
</head>
<body>
	<div class="container-fluid">
		<section id="welcome" class="tm-content-box tm-banner margin-b-10">
            <div class="tm-banner-inner">
				<h1 class="tm-banner-title"><xsl:value-of select="//entete/cours"/></h1>
				<p><a href="http://www.tal.univ-paris3.fr/plurital/" target="_blank"><xsl:value-of select="//entete/parcours"/></a> - <a href="#about"><xsl:value-of select="//entete/auteur"/></a></p>
			 </div>                    
        </section>
		<div class="tm-body">
            <div class="tm-sidebar">
                <nav class="tm-main-nav">
                    <ul class="tm-main-nav-ul">
                        <li class="tm-nav-item">
						<a href="#welcome" class="tm-nav-item-link tm-button"><i class="fa fa-smile-o tm-nav-fa"></i>Introduction</a>
                        </li>
						<li class="tm-nav-item">
						<a href="#gallery" class="tm-nav-item-link tm-button"><i class="fa fa-tasks tm-nav-fa"></i>Résultats</a>
						</li>
                        <li class="tm-nav-item"><a href="#about" class="tm-nav-item-link tm-button"><i class="fa fa-envelope-o tm-nav-fa"></i>A propos</a>
                        </li>
                    </ul>
                </nav>
            </div>
			<div class="tm-main-content">   
				<div id="services" class="tm-content-box tm-gray-bg tm-services">
					<div class="tm-box-pad ">
					<h2 class="tm-section-title"><xsl:value-of select="//contenu/description/titre"/></h2>
					<xsl:apply-templates select="//description"/><br/>
					<h2 class="tm-section-title"><xsl:value-of select="//contenu/problematique/titre"/></h2>
					<xsl:apply-templates select="//problematique"/>			
					</div>                                              
                </div>	
				<div id="gallery" class="tm-content-box">                        
					<div class="grid tm-gallery">
                          <xsl:apply-templates select="//pages"/>
                     </div>
                </div>
					
				<div id="about" class="tm-content-box">
				   <div class="tm-box-pad tm-bordered-box">
				       <xsl:apply-templates select="//presentation"/>
                    </div>
					<div class="tm-flex">
                            <div class="tm-purple-bg tm-box-pad tm-bordered-box tm-no-border-top">
                                <h2 class="tm-section-title">Nos autres projets</h2>
                                <p><a href="http://www.tal.univ-paris3.fr/plurital/travaux-2018-2019/ppe-s1/07/SITE/index.html" target="_blank"><xsl:value-of select="//projet1"/> </a></p>
								<p><a href="http://www.tal.univ-paris3.fr/plurital/travaux-2018-2019/ppe-s2/8/YuXin_XiaEmilie/" target="_blank"><xsl:value-of select="//projet2"/></a></p>
                            </div>
                        </div> 
					</div>			   
                    <footer class="tm-footer">
                        <p class="text-xs-center"><xsl:value-of select="//foot"/></p>
                    </footer>
                </div>
            </div>             
        </div>      
        <script src="js/jquery-1.11.3.min.js"></script>
        <script src="https://www.atlasestateagents.co.uk/javascript/tether.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/jquery.singlePageNav.min.js"></script>
				   
</body>
</html>
</xsl:template>
<xsl:template match="description">
<xsl:for-each select="./p">
<p class="tm-section-description"><xsl:value-of select="."/></p>
</xsl:for-each>
<xsl:if test=".//lien">
<a href="{lien}"><xsl:value-of select="lien"/></a> <br/>
</xsl:if>
</xsl:template>


<xsl:template match="problematique">
<xsl:for-each select="./p">
<p class="tm-section-description"><xsl:value-of select="."/></p>
</xsl:for-each>
</xsl:template>

<xsl:template match="presentation">
<xsl:for-each select="./auteur">
<h2 class="tm-section-title"><xsl:value-of select="./titre"/></h2>
<h4><xsl:value-of select="./nom"/></h4>
<p><xsl:value-of select="./mail"/></p>
<p><xsl:value-of select="./intro"/></p>
</xsl:for-each>
</xsl:template>
    
<xsl:template match="pages">
<xsl:for-each select="./page">
<figure class="effect-bubba">
<img src="../web/img/poke_1.jpg" class="img-fluid"></img>
<figcaption>
<h2><xsl:value-of select="./idno"/></h2>
<p><xsl:value-of select="./descExo"/></p>
<a href="{lien}"></a>
 </figcaption>
</figure>  
</xsl:for-each>
</xsl:template>
</xsl:stylesheet>