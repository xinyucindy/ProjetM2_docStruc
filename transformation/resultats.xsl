<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="UTF-8"/>

<xsl:template match="/">
<html lang="fr">
<head>
<title><xsl:value-of select="//t"/></title>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link href="../web/css/styles/layout.css" rel="stylesheet" type="text/css" media="all"/>
<link rel="stylesheet" href="../web/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="../web/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="../web/css/magnific-popup.css"/>
	<link rel="stylesheet" href="../web/css/templatemo-style.css"/>
	<link rel="icon" href="../web/img/icone.png" type="image/x-icon"/>
</head>

<body>
<div class="container-fluid">
<section id="welcome" class="tm-content-box tm-banner margin-b-10">
            <div class="tm-banner-inner">
                    <h1 class="tm-banner-title">Document Structuré</h1>
					<p>Xin YU | Emilie XIA</p>		
            </div>                    
        </section>
</div>
<div class="container-fluid">

<div class="wrapper row4">
  <nav id="mainav" class="hoc clear">
    <ul class="clear">
      <li ><a href="accueil.xml">Accueil</a></li>
	  <li><a href="../web/html/resultat.html">Présentation</a></li>
      <li><a href="repartition_graphique.xml">Résultat - Graphiques</a></li>
      <li><a href="classement.xml">Résultat - Tableaux</a></li>
    </ul>
  </nav>
</div>

<div class="tm-body">
<div id="services" class="tm-content-box tm-gray-bg tm-services">
<div class="tm-box-pad">
<h2 class="tm-section-title"><xsl:value-of select="//titre"/></h2>
<xsl:apply-templates select="//contenu"/>
</div>
</div>
</div>

<div class="wrapper row5">
<div id="copyright" class="hoc clear"> 
<p class="fl_left">Master PluriTAL - Xin YU - Emilie XIA - 2019/2020</p>
</div>
</div>
</div>
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="css/scripts/jquery.min.js"></script>
<script src="css/scripts/jquery.backtotop.js"></script>
<script src="css/scripts/jquery.mobilemenu.js"></script>
</body>
</html>
</xsl:template>

<xsl:template match="//partie">
	<xsl:for-each select="./presentation">
		<p><xsl:value-of select="."/></p>
	</xsl:for-each>
	<xsl:if test='.//pp'>
		<br/><div><b><xsl:apply-templates select="pp"/></b></div><br/>
	</xsl:if>
</xsl:template>

<xsl:template match='//image'>
<div><img src="{.}"/></div><br/>
</xsl:template>

<xsl:template match='//code'>
<iframe src="{.}" width="600" height="300"></iframe><br/><br/>
</xsl:template>

<xsl:template match="//texte">
<p class="tm-section-description"><xsl:apply-templates/></p><br/>
</xsl:template>

<xsl:template match="//telechargement">
	<div>
		<xsl:for-each select="./fichier">
			<xsl:if test="./texte">
				<a href="{lien}" target="_blank"><i><xsl:value-of select="texte"/></i></a><br/>				
			</xsl:if>
		</xsl:for-each>
	</div>
</xsl:template>

<xsl:template match="list">
<ul><li><xsl:apply-templates/></li></ul><br/>
</xsl:template>

</xsl:stylesheet>