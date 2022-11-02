<?php
require_once("inc/init.inc.php");
//--------------------------------- TRAITEMENTS PHP ---------------------------------//
$contenu .= '<div class="row template" id="template">';
if(isset($_GET['search'])) 
{
	$donnees = executeRequete("SELECT id_produit,reference,titre,photo,prix,age FROM produit WHERE categorie LIKE '%$_GET[search]%' OR titre LIKE '%$_GET[search]%' OR age LIKE '%$_GET[search]%'");
} else {
	$donnees = executeRequete("SELECT id_produit,reference,titre,categorie,photo,prix FROM produit");
}

while($produit = $donnees->fetch_assoc())
{
	$contenu .= '<div class="boutique-produit">';
	$contenu .= "<h3>$produit[titre]</h3>";
	$contenu .= "<a href=\"fiche_produit.php?id_produit=$produit[id_produit]\"><img src=\"$produit[photo]\" width=\"230\" height=\"200\" /></a>";
	$contenu .= "<p>$produit[prix] Euros</p>";
	$contenu .= '<a href="fiche_produit.php?id_produit=' . $produit['id_produit'] . '">Voir la fiche</a>';
	$contenu .= '</div>';

}
$contenu .= '</div>';
//--------------------------------- AFFICHAGE HTML ---------------------------------//
require_once("inc/haut.inc.php");
echo $contenu;
require_once("inc/bas.inc.php");