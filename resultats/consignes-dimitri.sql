/*
LES JOINTURES EN MYSQL

2019/04/01 DIMITRI

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
SELECT theuser.thelogin, theuser.thename, perm.thename AS pername 
FROM theuser
INNER JOIN perm
ON theuser.idtheuser = perm.idperm;

# 07) Sélectionnez 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', lorsque 'perm.thelevel' vaut 3
SELECT theuser.thelogin, theuser.thename, perm.thename AS permname, perm.thelevel
FROM theuser
INNER JOIN perm
ON theuser.idtheuser = perm.idperm
WHERE perm.thelevel LIKE '%3%';
    
# 08) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', 
# et le 'article.thetitle' pour chaque utilisateur venant de la table (jointure non obligatoire) 'article'
SELECT theuser.idtheuser, theuser.thelogin, theuser.thename, perm.thename AS permname, article.thetitle
FROM theuser
LEFT JOIN perm
ON theuser.idtheuser = perm.idperm
LEFT JOIN article
ON theuser.idtheuser = article.idarticle;

    
# 09) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', 
#et le 'article.thetitle' pour chaque utilisateur venant de la table (jointure obligatoire!) 'article'
SELECT theuser.idtheuser, theuser.thelogin, theuser.thename, perm.thename AS permname, article.thetitle
FROM theuser
INNER JOIN perm
ON theuser.idtheuser = perm.idperm
INNER JOIN article
ON theuser.idtheuser = article.idarticle;
    
# 10) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', 
#et le 'article.idarticle' GROUPE  renommé en 'idarticle' ainsi que le 'article.thetitle' GROUPE avec le séparateur ||| renommé en 'thetitle' par chaque utilisateur venant de la table (jointure obligatoire!) 'article' - ! PAS de doublons d'auteurs !
SELECT theuser.idtheuser, theuser.thelogin, theuser.thename, perm.thename AS permname,
GROUP_CONCAT(article.idarticle) AS idarticle,
GROUP_CONCAT(article.thetitle SEPARATOR ' ||| ') AS thetitle
FROM theuser
INNER JOIN perm
ON perm.idperm = theuser.perm_idperm
INNER JOIN article
ON article.theuser_idtheuser = theuser.perm_idperm
LEFT JOIN categ_has_article
ON categ_has_article.article_idarticle = article.theuser_idtheuser
LEFT JOIN categ
ON categ.idcateg = categ_has_article.categ_idcateg
ORDER BY categ.idcateg;


# 11) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.idarticle' GROUPE   renommé en 'idarticle' ainsi que le 'article.thetitle' GROUPE avec le séparateur ||| renommé en 'thetitle' par chaque utilisateur venant de la table (jointure NON obligatoire) 'article' ordonné par 'theuser.thelogin' descendant - ! PAS de doublons d'auteurs !

    
# 12) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article' avec 'image.theurl' et 'image.thealt' venant de la table (jointure NON obligatoire) 'images' en affichant tous les articles !

    
# 13) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article' avec 'image.theurl' GROUPE avec le séparateur ||| renommé en 'theurl' et 'image.thealt' GROUPE avec le séparateur |$| renommé en 'thealt' venant de la table (jointure NON obligatoire) 'images' en affichant tous les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !

    
# 14) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article'  avec  'categ.idcateg' GROUPE  renommé en 'idcateg' et 'categ.thetitle' GROUPE avec le séparateur _o!o_ renommé 'ctitle' venant de la table (jointure NON obligatoire) 'categ' en affichant tous les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !

    
# 15) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article'  avec  'categ.idcateg' GROUPE  renommé en 'idcateg' et 'categ.thetitle' GROUPE avec le séparateur _o!o_ renommé 'ctitle' venant de la table (jointure obligatoire) 'categ' avec 'theuser.idtheuser' et 'theuser.thelogin' venant de la table (jointure obligatoire) 'user'  en affichant  les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !
