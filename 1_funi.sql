-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 23, 2022 at 06:00 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `funi`
--

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(3) NOT NULL,
  `id_membre` int(3) DEFAULT NULL,
  `montant` int(3) NOT NULL,
  `date_enregistrement` datetime NOT NULL,
  `etat` enum('en cours de traitement','envoyé','livré') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `details_commande`
--

CREATE TABLE `details_commande` (
  `id_details_commande` int(3) NOT NULL,
  `id_commande` int(3) DEFAULT NULL,
  `id_produit` int(3) DEFAULT NULL,
  `quantite` int(3) NOT NULL,
  `prix` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `membre`
--

CREATE TABLE `membre` (
  `id_membre` int(3) NOT NULL,
  `pseudo` varchar(20) NOT NULL,
  `mdp` varchar(32) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `civilite` enum('m','f') NOT NULL,
  `ville` varchar(20) NOT NULL,
  `code_postal` int(5) UNSIGNED ZEROFILL NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `statut` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `membre`
--

INSERT INTO `membre` (`id_membre`, `pseudo`, `mdp`, `nom`, `prenom`, `email`, `civilite`, `ville`, `code_postal`, `adresse`, `statut`) VALUES
(5, 'admin', 'admin', 'admin', 'admin', 'admin@exemple.com', 'm', 'Paris', 75015, '33 rue mademoiselle', 1);

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(3) NOT NULL,
  `reference` varchar(20) NOT NULL,
  `categorie` varchar(20) NOT NULL,
  `titre` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `editeur` varchar(20) NOT NULL,
  `age` int(3) NOT NULL,
  `photo` varchar(250) NOT NULL,
  `prix` int(3) NOT NULL,
  `tva` varchar(20) NOT NULL,
  `stock` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`id_produit`, `reference`, `categorie`, `titre`, `description`, `editeur`, `age`, `photo`, `prix`, `tva`, `stock`) VALUES
(1, '1-im-8', 'immobilier', 'Monopoly', 'Jeu de société où les joueurs doivent acquérir par concurrence des terrains et des immeubles jusqu\'à en obtenir le monopole.', 'Hasbro', 8, './photo/1-im-8_monopoly.jpg', 20, '20%', 53),
(2, '2-ca-7', 'carte', 'Uno', 'Uno est un jeu de cartes associant des chiffres et des couleurs, et contenant d’autres cartes spéciales permettant de pimenter un peu la partie. Le but est de poser une carte (ou plusieurs cartes selon les règles décidées au début du jeu) en lien avec celle qui est sur la table, et de se débarrasser de toutes ses cartes avant les autres joueurs.', 'Mattel', 7, './photo/2-ca-7_uno.jpg', 15, '20%', 230),
(3, '3-ra-8', 'rapiditer', 'Tic Tac boom', 'Dans Tic Tac Boum, les joueurs jouent contre la montre, en espérant pouvoir passer la bombe à leurs voisins avant qu\'elle n\'explose. Au début de chaque tour, une carte son comportant une syllabe (\"ti\", \"un\", \"san\", etc.) est retournée au milieu de la table et le dé est lancé.', 'Asmodée', 8, './photo/3-ra-8_TicTacBoom.jpg', 30, '20%', 63),
(4, '4-me-10', 'mémoire', 'Tamaloo', 'TAMALOO est un jeu de cartes de stratégies, de bluff dans lequel il faut être malin et rapide pour éviter les problèmes et les pièges tendus par les autres.', 'Coucoumba', 10, './photo/4-me-10_tamaloo.jpg', 18, '20%', 3),
(5, '5-pi-7', 'piége', 'Ni oui ni non', 'Le célèbre jeu du \"Ni oui ni non\" mis dans une boîte avec des cartes qui proposent 10 questions tortueuses auxquelles il ne faut répondre \"ni oui ni non\", bien sûr. Fous rire garantis.', 'Megableu', 7, './photo/5-pi-7_NiOuiNiNon.jpg', 19, '20%', 80),
(6, '6-me-5', 'mémoire', 'Lelynx', 'La dernière édition du Lynx ! Le passionnant jeu de compétition de toujours, avec 400 images. Il s’agit de retrouver le plus rapidement possible les images du jeu sur le plateau. Les réflexes et la mémoire visuelle seront les meilleurs atouts du vainqueur. Pour jouer seul ou à plusieurs !', 'Educa', 5, './photo/6-me-5_lelynx.jpg', 25, '20%', 73),
(7, '7-st-7', 'stratégie', 'Stratego original', 'Indémodable Stratego ! Retrouvez le plaisir de jouer à ce jeu mythique de 1947 réédité pour notre plus grand plaisir.Stratego Original est un jeu riche en aventures et en surprises. Vous dirigez une armée dont les éléments ont une valeur différentes.', 'Diset', 7, './photo/7-st-7_stratego.jpg', 38, '20%', 120),
(8, '8-ro-8', 'rôle', 'Azul', 'Azul vous invite à embellir les murs du Palais Royal de Evora en devenant artisan avec un jeu de tuiles très malin et dépaysant.', 'Next Move', 8, './photo/8-ro-8_azul.jpg', 40, '20%', 99);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`);

--
-- Indexes for table `details_commande`
--
ALTER TABLE `details_commande`
  ADD PRIMARY KEY (`id_details_commande`);

--
-- Indexes for table `membre`
--
ALTER TABLE `membre`
  ADD PRIMARY KEY (`id_membre`),
  ADD UNIQUE KEY `pseudo` (`pseudo`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD UNIQUE KEY `reference` (`reference`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `details_commande`
--
ALTER TABLE `details_commande`
  MODIFY `id_details_commande` int(3) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `membre`
--
ALTER TABLE `membre`
  MODIFY `id_membre` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
