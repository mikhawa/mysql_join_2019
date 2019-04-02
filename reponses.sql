/*
LES JOINTURES EN MYSQL
*/

# 01) Sélectionnez tous les champs de la table 'article'
SELECT * FROM article;

# 02) Sélectionnez tous les champs de la table 'categ'
SELECT * FROM categ;

# 03) Sélectionnez tous les champs de la table 'image'
SELECT * FROM image;

# 04) Sélectionnez tous les champs de la table 'perm'
SELECT * FROM perm;

# 05) Sélectionnez tous les champs de la table 'theuser'
SELECT * FROM theuser;

# 06) Sélectionnez 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm'
SELECT theuser.thelogin, theuser.thename, perm.thename AS permname 
	FROM theuser
    INNER JOIN perm
		ON theuser.perm_idperm = perm.idperm
    ;

# 07) Sélectionnez 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', lorsque 'perm.thelevel' vaut 3
SELECT theuser.thelogin, theuser.thename, perm.thename AS permname 
	FROM theuser
    INNER JOIN perm
		ON theuser.perm_idperm = perm.idperm
    WHERE perm.thelevel=3   
    ;
    
# 08) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.thetitle' pour chaque utilisateur venant de la table (jointure non obligatoire) 'article'
SELECT theuser.idtheuser, theuser.thelogin, theuser.thename, perm.thename AS permname, article.thetitle
	FROM theuser
    INNER JOIN perm
		ON theuser.perm_idperm = perm.idperm
    LEFT JOIN article
		ON theuser.idtheuser = article.theuser_idtheuser
    ;    
    
# 09) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.thetitle' pour chaque utilisateur venant de la table (jointure obligatoire!) 'article'
SELECT theuser.idtheuser, theuser.thelogin, theuser.thename, perm.thename AS permname, article.thetitle
	FROM theuser
    INNER JOIN perm
		ON theuser.perm_idperm = perm.idperm
    INNER JOIN article
		ON theuser.idtheuser = article.theuser_idtheuser
    ;     
    
# 10) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.idarticle' GROUPE  renommé en 'idarticle' ainsi que le 'article.thetitle' GROUPE avec le séparateur ||| renommé en 'thetitle' par chaque utilisateur venant de la table (jointure obligatoire!) 'article' - ! PAS de doublons d'auteurs !
SELECT theuser.idtheuser, theuser.thelogin, theuser.thename, perm.thename AS permname,
	GROUP_CONCAT(article.idarticle) AS idarticle, GROUP_CONCAT(article.thetitle SEPARATOR '|||') AS thetitle
	FROM theuser
    INNER JOIN perm
		ON theuser.perm_idperm = perm.idperm
    INNER JOIN article
		ON theuser.idtheuser = article.theuser_idtheuser
    GROUP BY theuser.idtheuser    
    ;     

# 11) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.idarticle' GROUPE   renommé en 'idarticle' ainsi que le 'article.thetitle' GROUPE avec le séparateur ||| renommé en 'thetitle' par chaque utilisateur venant de la table (jointure NON obligatoire) 'article' ordonné par 'theuser.thelogin' descendant - ! PAS de doublons d'auteurs !
SELECT theuser.idtheuser, theuser.thelogin, theuser.thename, perm.thename AS permname,
	GROUP_CONCAT(article.idarticle) AS idarticle, GROUP_CONCAT(article.thetitle SEPARATOR '|||') AS thetitle
	FROM theuser
    INNER JOIN perm
		ON theuser.perm_idperm = perm.idperm
    LEFT JOIN article
		ON theuser.idtheuser = article.theuser_idtheuser
    GROUP BY theuser.idtheuser
    ORDER BY theuser.thelogin DESC
    ; 
    
# 12) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article' avec 'image.theurl' et 'image.thealt' venant de la table (jointure NON obligatoire) 'images' en affichant tous les articles !
SELECT article.idarticle, article.thetitle, article.thedate, image.theurl, image.thealt
	FROM article
    LEFT JOIN image
		ON image.article_idarticle = article.idarticle
	;
    
# 13) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article' avec 'image.theurl' GROUPE avec le séparateur ||| renommé en 'theurl' et 'image.thealt' GROUPE avec le séparateur |$| renommé en 'thealt' venant de la table (jointure NON obligatoire) 'images' en affichant tous les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !
SELECT article.idarticle, article.thetitle, article.thedate, 
	GROUP_CONCAT(image.theurl SEPARATOR '|||') AS theurl, GROUP_CONCAT(image.thealt SEPARATOR '|$|') AS thealt
	FROM article
    LEFT JOIN image
		ON image.article_idarticle = article.idarticle
    GROUP BY article.idarticle    
    ORDER BY article.thedate DESC
	;
    
# 14) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article'  avec  'categ.idcateg' GROUPE  renommé en 'idcateg' et 'categ.thetitle' GROUPE avec le séparateur _o!o_ renommé 'ctitle' venant de la table (jointure NON obligatoire) 'categ' en affichant tous les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !
SELECT article.idarticle, article.thetitle, article.thedate, 
    GROUP_CONCAT(categ.idcateg) AS idcateg, GROUP_CONCAT(categ.thetitle SEPARATOR '_o!o_') AS ctitle
	FROM article
    LEFT JOIN categ_has_article
		ON categ_has_article.article_idarticle = article.idarticle
    LEFT JOIN categ
		ON categ_has_article.categ_idcateg = categ.idcateg
    GROUP BY article.idarticle    
    ORDER BY article.thedate DESC
	;  
    
# 15) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article'  avec  'categ.idcateg' GROUPE  renommé en 'idcateg' et 'categ.thetitle' GROUPE avec le séparateur _o!o_ renommé 'ctitle' venant de la table (jointure obligatoire) 'categ' avec 'theuser.idtheuser' et 'theuser.thelogin' venant de la table (jointure obligatoire) 'user'  en affichant  les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !
SELECT article.idarticle, article.thetitle, article.thedate, 
    GROUP_CONCAT(categ.idcateg) AS idcateg, GROUP_CONCAT(categ.thetitle SEPARATOR '_o!o_') AS ctitle,
    theuser.idtheuser, theuser.thelogin
	FROM article
    INNER JOIN categ_has_article
		ON categ_has_article.article_idarticle = article.idarticle
    INNER JOIN categ
		ON categ_has_article.categ_idcateg = categ.idcateg
	INNER JOIN theuser
		ON theuser.idtheuser = article.theuser_idtheuser
    GROUP BY article.idarticle    
    ORDER BY article.thedate DESC
	;     