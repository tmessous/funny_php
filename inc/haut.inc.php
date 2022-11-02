<!Doctype html>
<html>
    <head>
        <title>FUNI</title>
		<link href="node_modules/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="node_modules/bootstrap-icons/font/bootstrap-icons.css">
        <link rel="stylesheet" href="<?php echo RACINE_SITE; ?>inc/css/style.css" />
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <body>    
        <header>
			<div class="conteneur">                     
				<span>
					<a href="" title="Funi store">Funi store</a>
                </span>
				<nav class="navbar navbar-dark" >
					<?php
					if(internauteEstConnecteEtEstAdmin()) // admin
					{ // BackOffice
						echo '<a href="' . RACINE_SITE . 'admin/gestion_membre.php">Gestion des membres</a>';
						echo '<a href="' . RACINE_SITE . 'admin/gestion_commande.php">Gestion des commandes</a>';
						echo '<a href="' . RACINE_SITE . 'admin/gestion_boutique.php">Gestion de la boutique</a>';
					}
					if(internauteEstConnecte()) // membre et admin
					{
						echo '<a href="' . RACINE_SITE . 'profil.php">Voir votre profil</a>';
						echo '<a href="' . RACINE_SITE . 'boutique.php">Accès à la boutique</a>';
						echo '<a href="' . RACINE_SITE . 'panier.php">Voir votre panier</a>';
						echo '<a href="' . RACINE_SITE . 'connexion.php?action=deconnexion">Se déconnecter</a>';
					}
					else // visiteur
					{
						echo '<a href="' . RACINE_SITE . 'inscription.php">Inscription</a>';
						echo '<a href="' . RACINE_SITE . 'connexion.php">Connexion</a>';
						echo '<a href="' . RACINE_SITE . 'boutique.php">Accès à la boutique</a>';
						echo '<a href="' . RACINE_SITE . 'panier.php">Voir votre panier</a>';
					}
					// visiteur=4 liens - membre=4 liens - admin=7 liens
					?>
					<form class="d-flex" action="" method="GET">
						<input class="form-control me-2" name="search" value="" type="text" placeholder="name or age or category" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</nav>
			</div>
        </header>
        <section>
			<!-- <div class="conteneur">        -->
			<div class="container py-5" id="game-lists">