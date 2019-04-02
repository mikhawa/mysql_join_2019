/*
LES JOINTURES EN MYSQL

2019/04/01 BOGDAN

*/

# 01) Sélectionnez tous les champs de la table 'article'
SELECT * from article;

# 02) Sélectionnez tous les champs de la table 'categ'
SELECT * from categ;

# 03) Sélectionnez tous les champs de la table 'image'
SELECT * from image;

# 04) Sélectionnez tous les champs de la table 'perm'
SELECT * from perm;

# 05) Sélectionnez tous les champs de la table 'theuser'
SELECT * from theuser;

# 06) Sélectionnez 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm'
SELECT u.thelogin,u.thename,p.thename AS perm
FROM theuser u
INNER JOIN perm p ON p.idperm= u.perm_idperm;

# 07) Sélectionnez 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', lorsque 'perm.thelevel' vaut 3
SELECT u.thelogin,u.thename,p.thename AS perm
FROM theuser u
INNER JOIN perm p ON p.idperm= u.perm_idperm
WHERE p.thelevel=3;
    
# 08) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.thetitle' pour chaque utilisateur venant de la table (jointure non obligatoire) 'article'
SELECT u.idtheuser,u.thelogin,u.thename,p.thename AS permname,a.thetitle
FROM theuser u
LEFT JOIN article a ON a.theuser_idtheuser=u.idtheuser
LEFT JOIN perm p ON p.idperm= u.perm_idperm;

    
# 09) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.thetitle' pour chaque utilisateur venant de la table (jointure obligatoire!) 'article'
SELECT u.idtheuser,u.thelogin,u.thename,p.thename AS permname,a.thetitle
FROM theuser u
INNER JOIN article a ON a.theuser_idtheuser=u.idtheuser
INNER JOIN perm p ON p.idperm= u.perm_idperm;
    
# 10) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.idarticle' GROUPE  renommé en 'idarticle' ainsi que le 'article.thetitle' GROUPE avec le séparateur ||| renommé en 'thetitle' par chaque utilisateur venant de la table (jointure obligatoire!) 'article' - ! PAS de doublons d'auteurs !
SELECT u.idtheuser,u.thelogin,u.thename,p.thename AS permname,
GROUP_CONCAT(a.thetitle SEPARATOR '|||') AS thetitle, 
GROUP_CONCAT(a.idarticle ) AS idarticle
FROM theuser u
INNER JOIN article a ON a.theuser_idtheuser=u.idtheuser
INNER JOIN perm p ON p.idperm= u.perm_idperm
GROUP BY u.idtheuser;

# 11) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.idarticle' GROUPE   renommé en 'idarticle' ainsi que le 'article.thetitle' GROUPE avec le séparateur ||| renommé en 'thetitle' par chaque utilisateur venant de la table (jointure NON obligatoire) 'article' ordonné par 'theuser.thelogin' descendant - ! PAS de doublons d'auteurs !
SELECT u.idtheuser,u.thelogin,u.thename,p.thename AS permname,
GROUP_CONCAT(a.thetitle SEPARATOR '|||') AS thetitle, 
GROUP_CONCAT(a.idarticle ) AS idarticle
FROM theuser u
LEFT JOIN article a ON a.theuser_idtheuser=u.idtheuser
LEFT JOIN perm p ON p.idperm= u.perm_idperm
GROUP BY u.idtheuser
ORDER BY u.thelogin DESC ;
    
# 12) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article' avec 'image.theurl' et 'image.thealt' venant de la table (jointure NON obligatoire) 'images' en affichant tous les articles !
SELECT a.idarticle,a.thetitle,a.thedate,i.theurl,i.thealt
FROM article a
LEFT JOIN image i ON i.article_idarticle= a.idarticle;
    
# 13) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article' avec 'image.theurl' GROUPE avec le séparateur ||| renommé en 'theurl' et 'image.thealt' GROUPE avec le séparateur |$| renommé en 'thealt' venant de la table (jointure NON obligatoire) 'images' en affichant tous les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !
SELECT a.idarticle,a.thetitle,a.thedate,GROUP_CONCAT(i.theurl SEPARATOR '|||') AS theurl ,GROUP_CONCAT(i.thealt SEPARATOR '$') AS thealt
FROM article a
LEFT JOIN image i ON i.article_idarticle= a.idarticle
GROUP BY a.idarticle
ORDER BY a.thedate DESC ;
    
# 14) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article'  avec  'categ.idcateg' GROUPE  renommé en 'idcateg' et 'categ.thetitle' GROUPE avec le séparateur _o!o_ renommé 'ctitle' venant de la table (jointure NON obligatoire) 'categ' en affichant tous les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !
SELECT a.idarticle,a.thetitle,a.thedate,GROUP_CONCAT(c.idcateg ) AS idcateg ,GROUP_CONCAT(c.thetitle SEPARATOR '_o!o_') AS categ
FROM article a
LEFT JOIN  categ_has_article cat ON cat.article_idarticle=a.idarticle
LEFT JOIN categ c ON c.idcateg=cat.categ_idcateg
GROUP BY a.idarticle
ORDER BY a.thedate DESC ;
    
# 15) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article'  avec  'categ.idcateg' GROUPE  renommé en 'idcateg' et 'categ.thetitle' GROUPE avec le séparateur _o!o_ renommé 'ctitle' venant de la table (jointure obligatoire) 'categ' avec 'theuser.idtheuser' et 'theuser.thelogin' venant de la table (jointure obligatoire) 'user'  en affichant  les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !
SELECT a.idarticle,a.thetitle,a.thedate,GROUP_CONCAT(c.idcateg ) AS idcateg ,GROUP_CONCAT(c.thetitle SEPARATOR '_o!o_') AS ctitle,u.idtheuser,u.thelogin
FROM article a
INNER JOIN theuser u ON u.idtheuser=a.theuser_idtheuser
INNER JOIN  categ_has_article cat ON cat.article_idarticle=a.idarticle
INNER JOIN categ c ON c.idcateg=cat.categ_idcateg
GROUP BY a.idarticle
ORDER BY a.thedate DESC  ;
    