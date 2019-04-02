-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 28 mars 2019 à 12:53
-- Version du serveur :  5.7.24
-- Version de PHP :  7.3.1

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de données :  `mysqljoin2019`
--

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`idarticle`, `thetitle`, `thetext`, `thedate`, `theuser_idtheuser`) VALUES
(1, 'WebStorm 2019.1 disponible : tour d\'horizon des nouveautés de l\'EDI de JetBrains', 'Une nouvelle version de WebStorm, l\'EDI intelligent conçu par JetBrains pour les développeurs JavaScript, a été publiée cette semaine. Cette mise à jour apporte un bon nombre de nouvelles fonctionnalités qu’on pourra remarquer au niveau des langages JavaScript et TypeScript, des frameworks, de HTML et CSS, des tests, des outils JavaScript et au niveau de l’EDI lui-même.\r\n\r\nJavaScript et TypeScript\r\n\r\nUtilisation de la destructuration JavaScript \r\n\r\nLa destructuration consiste à décomposer les valeurs des tableaux et des objets pour obtenir des variables utilisant une syntaxe très concise. Les nouvelles refactorisations et intentions de WebStorm, accessibles en appuyant sur Alt-Entrée, permettent d\'introduire facilement la destructuration dans votre code JavaScript ou TypeScript.\r\n\r\nConversion de fonction avec Promise pour la structure async/await\r\n\r\nVous pouvez automatiquement modifier une fonction renvoyant un objet Promise avec les appels de fonction asynchrone .then() et .catch() utilisant la syntaxe async/await. Appuyez simplement sur Alt-Entrée sur le nom de la fonction et sélectionnez Convert to async function (Convertir en fonction asynchrone). Cette opération est possible non seulement pour les fichiers TypeScript, mais aussi dans JavaScript et Flow.', '2019-03-28 13:34:12', 1),
(2, 'CSS s\'enrichit du support des fonctions trigonométriques jusqu\'ici accessibles via JavaScript', 'Le langage CSS utile pour la mise en forme et l\'organisation de la façon dont les éléments de page apparaissent sur un site Web s\'enrichit du support des fonctions de trigonométrie telles que sinus, cosinus, tangente, et autres ; c’est le résultat d’une décision que le groupe CSS du World Wide Web Consortium (W3C) a prise à la fin du mois dernier.\r\n\r\nLes nouvelles fonctions approuvées et en voie de rejoindre le standard CSS sont : sinus – sin() ; cosinus – cos() ; tangente – tan() ; arccosinus – acos() ; arcsinus – asin() ; arctangente – atan() ; arctangente (de deux nombres x et y) – atan2() ; racine carrée – sqrt() ; racine carrée de la somme des carrés de ses arguments – hypot() ; puissance – pow(). \r\n\r\nCes fonctions viennent s\'ajouter au support existant de CSS pour les fonctions mathématiques qui inclut déjà : calc() – pour le calcul des expressions de base ; min() – pour obtenir la plus petite valeur au sein d\'une série ; max() – pour obtenir la plus grande valeur au sein d\'une série de nombres ; clamp() – pour déterminer la valeur moyenne de nombres situés entre une limite inférieure et une limite supérieure.\r\n\r\nLe groupe CSS du World Wide Web Consortium a approuvé l\'ajout de ces nouvelles fonctions mathématiques à la demande de plusieurs développeurs web qui ont demandé un moyen simple de contrôler les animations en utilisant la syntaxe CSS native au lieu de JavaScript. Par exemple, l’exercice de l’affichage d’un arbre comme celui de la figure qui suit nécessitait jusqu’à présent de s’appuyer sur le langage JavaScript pour les calculs d’angles. ', '2019-03-28 13:37:14', 2),
(3, 'Python en 2018, les chiffres clés de la communauté', 'À l\'automne 2018, JetBrains et la Python Software Foundation (PSF) ont mené une enquête annuelle officielle sur les développeurs Python, la deuxième enquête de ce genre après celle de l\'année 2017. À l\'instar de l\'enquête précédente, la fondation a cherché à identifier les dernières tendances et à mieux comprendre le monde du développement Python en 2018. Plus de 20 000 développeurs de plus de 150 pays différents ont participé cette année, ce qui a permis de donner une photographie plus ou moins pertinente du paysage actuel de la communauté Python.\r\n\r\nPour en venir aux résultats, l\'enquête révèle que Python est pour 84 % de ses utilisateurs leur langage principal et pour les 16 % restants un langage secondaire. En 2017, c\'était 79 % des répondants qui avaient indiqué utiliser Python comme langage principal, ce qui signifie une hausse de 5 points de pourcentage en un an. La Python Software Foundation (PSF) et JetBrains ont aussi tenté lors de leur enquête de fournir des réponses à des questions comme : pour quels types d\'activités ou tâches Python est-il utilisé ? Quel est l\'état des lieux de l\'adoption de Python 3 ? Quels sont les frameworks et les outils de développement les plus utilisés dans le monde Python ? Etc. Voici ci-après les principaux résultats de cette enquête :\r\n\r\nTypes de développements Python\r\n\r\nIci, l\'enquête a révélé que Python est plus utilisé pour la data science que pour le développement Web. Elle en effet a montré que pour 28 % des membres de la communauté, Python est principalement utilisé pour la data science (17 % pour l\'analyse des données et 11 % pour le machine learning), alors que 27 % des répondants l\'utilisent principalement pour le développement Web.\r\n\r\nMais en 2018, Python était également utilisé principalement :\r\npar 11 % des membres de la communauté pour le DevOps, l\'administration systèmes et l\'écriture de script d\'automatisation ;\r\npar 7 % des membres de la communauté à des fins éducatives ;\r\npar 4 % des membres de la communauté pour le développement d\'applications de bureau ;\r\npar 4 % des membres de la communauté pour le prototypage de logiciels ;\r\npar 4 % des membres de la communauté pour la programmation de crawlers, scrapers et parsers Web (4 %) ;', '2019-03-28 13:41:03', 1),
(4, 'Parmi les sites CMS piratés en 2018, 90 % sont des sites WordPress', 'Et 97 % des sites PrestaShop piratés sont obsolètes, selon un rapport.\r\n\r\nEn 2016, WordPress a été le CMS le plus ciblé par les cyberattaques, selon une étude menée par la société de sécurité Sucuri. En 2018, le CMS a vu le nombre de vulnérabilités qui lui sont liés tripler. Dans l’étude précédente, plusieurs facteurs ont été remis en cause pour leur implication dans la mise à mal de la sécurité, notamment le déploiement, la configuration et la maintenance entreprise par les webmasters ou l’hébergeur. Une récente étude effectuée par Imperva pointe du doigt les plugins comme principale source de vulnérabilités de WordPress. À vrai dire, un CMS maintenu constamment à jour ne constitue pas un problème. C’est quand l’installation est hautement personnalisée qu’il devient difficile de maintenir la sécurité, et en même temps, le risque d’être piraté augmente de façon proportionnelle.\r\n\r\nPour WordPress, le risque est encore plus élevé puisque le CMS propulse près de 30 % des sites de la toile, un pourcentage de taille qui fait qu’il existe un large nombre de victimes potentielles, un facteur important qui attire les hackers de tous poils. En 2018, Imperva a enregistré 542 vulnérabilités associées à WordPress, trois fois plus que le nombre de 2017. Joomla et Drupal combinés ont été affectés par moins de 150 bogues. Un nombre moins élevé de bogues ne reflète pas vraiment le niveau de sécurité d’une plateforme, ça ne veut en aucun cas dire qu’elle est plus sécurisée ou non, la preuve en est les failles importantes qui ont permis aux attaquants de faire des attaques ravageantes contre les sites Drupal, on parle là de Drupalgeddon, Drupalgeddon 2 ou encore Kitty.\r\n\r\nDans un nouveau rapport intitulé « Hacked Website Trend » de l\'\'année 2018, Sucuri a publié les résultats d\'une nouvelle analyse des dernières tendances en matière de logiciels malveillants et de sites Web piratés. Ledit rapport est basé sur les données collectées et analysées par l\'équipe GoDaddy Security / Sucuri et s\'appuient sur les données de l\'année précédente et comprend des données mises à jour de janvier à décembre 2018. Le rapport identifie les tendances et les évaluations des risques pour les applications des systèmes de gestion de contenu (CMS) les plus affectées par les compromis sur les sites Web. Le rapport tient compte d\'un échantillon représentatif du nombre total de sites Web pour lesquels l\'équipe de l\'analyse a fourni des services de sécurité en 2018, soit un total d\'environ 18 302 sites Web infectés sont analysés dans le rapport.\r\n\r\nLes résultats de l\'analyse indiquent une augmentation importante des attaques subies par les sites CMS. Les chiffres parlent d\'eux-mêmes. La mise à mal de la sécurité dans WordPress est passée de 83 % en 2017 à 90 % en 2018. Les taux d\'attaques de Joomla ont chuté de 13,1 % en 2017 à 4,3 % en 2018, tandis que les taux d\'attaque subis par Magento sont passés de 6,5 % en 2017 à 4,6 % en 2018, ceux de Joomla ! de 13,1 % en 2017 à 4,3 % en 2018 et ceux de Drupal ont augmenté de 1,6 % en 2017 à 3,7 % en 2018. ', '2019-03-28 13:43:07', 4),
(5, 'Microsoft lance une nouvelle version de Skype Web', 'Microsoft l’a annoncé hier sur son blog. Il a fait savoir que la toute dernière version Web de son application de messagerie instantanée est maintenant disponible au grand public. Il y a dans cette nouvelle version de Skype Web, environ cinq nouvelles fonctionnalités aussi intuitives qu’attractives et des changements pour le moins restrictifs. La firme annonce également la disponibilité de la version 8 de Skype pour le bureau Windows, une version qu’elle juge beaucoup plus améliorée que la précédente pour offrir encore plus d’expérience utilisateur. Elle avait déjà prévenu en début du mois de février que les utilisateurs de Skype Classic (version 7) doivent faire une mise à jour et passer à Skype 8.\r\n\r\nDans le billet de présentation de Microsoft, il souligne pour cette version de Skype Web de nouvelles fonctionnalités jugées très attractives et plusieurs autres changements notables dont un qui interpelle réellement la communauté : Microsoft a décidé de fournir son service uniquement sous Windows et Mac OS (Windows 10 et Mac OS X 10.12 ou supérieur) et plus stricte encore, seulement les dernières versions des navigateurs Google Chrome et Microsoft Edge sont prises en compte. Il laisse ainsi de côté les nombreux utilisateurs des autres plateformes comme Linux. ', '2019-03-28 13:52:00', 6);

--
-- Déchargement des données de la table `categ`
--

INSERT INTO `categ` (`idcateg`, `thetitle`, `thedesc`) VALUES
(1, 'Python', 'Python est un langage de programmation interprété, multi-paradigme et multiplateformes. Il favorise la programmation impérative structurée, fonctionnelle et orientée objet. Il est doté d\'un typage dynamique fort, d\'une gestion automatique de la mémoire par ramasse-miettes et d\'un système de gestion d\'exceptions ; il est ainsi similaire à Perl, Ruby, Scheme, Smalltalk et Tcl.'),
(2, 'MySQL', 'MySQL est un système de gestion de bases de données relationnelles (SGBDR). Il est distribué sous une double licence GPL et propriétaire. Il fait partie des logiciels de gestion de base de données les plus utilisés au monde, autant par le grand public (applications web principalement) que par des professionnels.'),
(3, 'JavaScript', 'JavaScript est un langage de programmation de scripts principalement employé dans les pages web interactives mais aussi pour les serveurs avec l\'utilisation (par exemple) de Node.js. C\'est un langage orienté objet à prototype, c\'est-à-dire que les bases du langage et ses principales interfaces sont fournies par des objets qui ne sont pas des instances de classes, mais qui sont chacun équipés de constructeurs permettant de créer leurs propriétés.'),
(4, 'PHP', 'PHP: Hypertext Preprocessor, plus connu sous son sigle PHP (acronyme récursif), est un langage de programmation libre, principalement utilisé pour produire des pages Web dynamiques via un serveur HTTP, mais pouvant également fonctionner comme n\'importe quel langage interprété de façon locale. PHP est un langage impératif orienté objet.'),
(5, 'HTML', 'L’HyperText Markup Language, généralement abrégé HTML, est le langage de balisage conçu pour représenter les pages web. C’est un langage permettant d’écrire de l’hypertexte, d’où son nom. HTML permet également de structurer sémantiquement et logiquement et de mettre en forme le contenu des pages, d’inclure des ressources multimédias dont des images, des formulaires de saisie et des programmes informatiques.'),
(6, 'CSS', 'Les feuilles de style en cascade, généralement appelées CSS de l\'anglais Cascading Style Sheets, forment un langage informatique qui décrit la présentation des documents HTML et XML. Les standards définissant CSS sont publiés par le World Wide Web Consortium (W3C).'),
(7, 'Frontend', 'Le développement web frontal (aussi appelé front-end en anglais) correspond aux productions HTML, CSS et JavaScript d’une page internet ou d’une application qu’un utilisateur peut voir et avec lesquelles il peut interagir directement.'),
(8, 'Backend', 'En informatique, un back-end (parfois aussi appelé un arrière-plan) est un terme désignant un étage de sortie d\'un logiciel devant produire un résultat. On l\'oppose au front-end (aussi appelé un frontal) qui lui est la partie visible de l\'iceberg.');

--
-- Déchargement des données de la table `categ_has_article`
--

INSERT INTO `categ_has_article` (`categ_idcateg`, `article_idarticle`) VALUES
(1, 3),
(3, 1),
(3, 2),
(4, 4),
(5, 1),
(6, 1),
(6, 2),
(7, 1),
(7, 2),
(8, 3),
(8, 4);

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`idimage`, `theurl`, `thealt`, `article_idarticle`) VALUES
(1, 'https://www.developpez.com/images/logos/moyen/webstorm.png?1553742015', 'WebStorm 2019.1 disponible', 1),
(2, 'https://www.developpez.com/public/images/news/wb01.png', 'Utilisation de la déstructuration JavaScript ', 1),
(3, 'https://www.developpez.com/images/logos/moyen/css.png?1553742010', 'Le langage CSS', 2),
(4, 'https://www.developpez.com/images/logos/moyen/python.png?1553742013', 'Python en 2018', 3),
(5, 'https://www.developpez.com/public/images/news/jb-webframework.PNG', 'Frameworks Web Python les plus populaires', 3),
(6, 'https://www.developpez.com/public/images/news/jb-os.PNG', 'OS', 3),
(7, 'https://www.developpez.com/images/logos/skype.png', 'Skype', 5);

--
-- Déchargement des données de la table `perm`
--

INSERT INTO `perm` (`idperm`, `thename`, `thelevel`) VALUES
(1, 'Administrateur', 0),
(2, 'Modérateur', 1),
(3, 'Editeur', 2),
(4, 'Rédacteur', 3),
(5, 'Abonné', 4);

--
-- Déchargement des données de la table `theuser`
--

INSERT INTO `theuser` (`idtheuser`, `thelogin`, `thename`, `thepwd`, `themail`, `perm_idperm`) VALUES
(1, 'Mikhawa', 'Pitz Michaël', 'ed0587fb570c9d0ca3b120bb89049afbb263a041da349b8a0be11506aa63bed1', 'michael.pitz@cf2m.be', 1),
(2, 'PitiPierre', 'Sandron Pierre', '336fcc42c0894a7f832a8d560879afdc4fe5dd7838b2f3d14e9a3c4120ef07ba', 'pierre.sandron@cf2m.be', 1),
(3, 'Sylvia1', 'Sylviane Mol', '561df679f45c532739c9309a58958e6bc2c5c4fec1f7a06ce690d6ce686faf5f', 'sylviane.mol@cf2m.be', 2),
(4, 'Tsarim', 'Artem Pgoda', '015768449948dfb8c1521651f2ed1bee075d679867a4815eac954fb2db1b4c61', 'Tsarim@gmail.com', 3),
(5, 'Vendoreum', 'Steve MC Queen', 'd92c87a54c79e85047a06da6a48e00dd044907c2ff8f0baf8d0e2e3acd724530', 'Vendoreum@gmail.com', 4),
(6, 'FlobertS', 'Sarah Flobert', '1e0e58411ae5ea42d113deaaac6b079edd146ed37150c642cdcb99cafda923e5', 'FlobertS@gmail.com', 4),
(7, 'VDBlens', 'Lens Vandenbries', '67e370d50d1c40fe6cee7f21dc9ed2ac3afa13e7a66b4e53072ce3c7beb6a7d5', 'VDBlens@gmail.com', 4),
(8, 'Lecteur1', 'Lecteur Un', '60f093768ae3394cbfef27f2e94bed93d2ca9bbff838f9be3c8583dd14b3782b', 'Lecteur1@gmail.com', 5),
(9, 'Lecteur2', 'Lecteur Deux', 'c6f2c820f00b4e6fd9a7712d838f3d6f539a0953d5a607a557b4356486bd952c', 'Lecteur2@gmail.com', 5),
(10, 'Lecteur3', 'Lecteur Trois', '2d243b2457c567ba682742db629ddbd25b39d8cecf43283ad57399254bf7b200', 'Lecteur3@gmail.com', 5);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;
