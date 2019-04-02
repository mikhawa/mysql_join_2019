/*
LES JOINTURES EN MYSQL

2019/04/01 Jean-Baptiste

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
SELECT t.thelogin, t.thename, p.thename as permname FROM theuser t  INNER JOIN perm p  ON p.idperm = t.perm_idperm ;

# 07) Sélectionnez 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', lorsque 'perm.thelevel' vaut 3
SELECT t.thelogin, t.thename, p.thename as permname FROM theuser t  INNER JOIN perm p  ON p.idperm = t.perm_idperm WHERE p.thelevel=3; 
    
# 08) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.thetitle' pour chaque utilisateur venant de la table (jointure non obligatoire) 'article'
SELECT t.thelogin, t.idtheuser, t.thename, p.thename as permname, a.thetitle FROM theuser t LEFT JOIN perm p  ON p.idperm = t.perm_idperm LEFT JOIN article a ON t.idtheuser = a.theuser_idtheuser ; 
    
# 09) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.thetitle' pour chaque utilisateur venant de la table (jointure obligatoire!) 'article'
SELECT t.thelogin, t.idtheuser, t.thename, p.thename as permname, a.thetitle FROM theuser t INNER JOIN perm p  ON p.idperm = t.perm_idperm INNER JOIN article a ON t.idtheuser = a.theuser_idtheuser ; 
    
# 10) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.idarticle' GROUPE  renommé en 'idarticle' ainsi que le 'article.thetitle' GROUPE avec le séparateur ||| renommé en 'thetitle' par chaque utilisateur venant de la table (jointure obligatoire!) 'article' - ! PAS de doublons d'auteurs !

SELECT t.thelogin, t.idtheuser, t.thename, p.thename as permname, GROUP_CONCAT(a.idarticle) as idarticle, GROUP_CONCAT(a.thetitle SEPARATOR "|||") as thetitle FROM theuser t INNER JOIN perm p  ON p.idperm = t.perm_idperm INNER JOIN article a ON t.idtheuser = a.theuser_idtheuser GROUP BY t.idtheuser;

# 11) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.idarticle' GROUPE   renommé en 'idarticle' ainsi que le 'article.thetitle' GROUPE avec le séparateur ||| renommé en 'thetitle' par chaque utilisateur venant de la table (jointure NON obligatoire) 'article' ordonné par 'theuser.thelogin' descendant - ! PAS de doublons d'auteurs !
SELECT t.idtheuser, t.thelogin, t.thename, p.thename as permname, GROUP_CONCAT(a.idarticle) as idarticle, GROUP_CONCAT(a.thetitle SEPARATOR "|||") as thetitle FROM theuser t INNER JOIN perm p  ON p.idperm = t.perm_idperm LEFT JOIN article a ON t.idtheuser = a.theuser_idtheuser GROUP BY t.idtheuser ORDER BY t.thelogin DESC;
    
# 12) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article' avec 'image.theurl' et 'image.thealt' venant de la table (jointure NON obligatoire) 'images' en affichant tous les articles !
SELECT a.idarticle, a.thetitle, a.thedate, i.theurl, i.thealt FROM article a LEFT JOIN image i ON a.idarticle = i.article_idarticle;
    
# 13) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article' avec 'image.theurl' GROUPE avec le séparateur ||| renommé en 'theurl' et 'image.thealt' GROUPE avec le séparateur |$| renommé en 'thealt' venant de la table (jointure NON obligatoire) 'images' en affichant tous les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !
SELECT a.idarticle, a.thetitle, a.thedate, i.theurl, i.thealt, GROUP_CONCAT(i.theurl SEPARATOR '|||' ) AS theurl, GROUP_CONCAT(i.thealt SEPARATOR '$') AS thealt FROM article a LEFT JOIN image i ON a.idarticle = i.article_idarticle GROUP BY a.thedate ORDER BY a.thedate DESC;
    
# 14) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article'  avec  'categ.idcateg' GROUPE  renommé en 'idcateg' et 'categ.thetitle' GROUPE avec le séparateur _o!o_ renommé 'ctitle' venant de la table (jointure NON obligatoire) 'categ' en affichant tous les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !
SELECT a.idarticle, a.thetitle, a.thedate, GROUP_CONCAT(c.idcateg) AS idcateg, GROUP_CONCAT(c.thetitle SEPARATOR '_o!o_') AS ctitle FROM article a LEFT JOIN categ_has_article ca ON ca.article_idarticle = a.idarticle LEFT JOIN  categ c ON ca.categ_idcateg = c.idcateg
GROUP BY a.thedate ORDER BY a.thedate DESC;
    
# 15) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article'  avec  'categ.idcateg' GROUPE  renommé en 'idcateg' et 'categ.thetitle' GROUPE avec le séparateur _o!o_ renommé 'ctitle' venant de la table (jointure obligatoire) 'categ' avec 'theuser.idtheuser' et 'theuser.thelogin' venant de la table (jointure obligatoire) 'user'  en affichant  les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !
