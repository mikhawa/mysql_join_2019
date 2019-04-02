/*
LES JOINTURES EN MYSQL

2019/04/01 Tarik

*/

# 01) Sélectionnez tous les champs de la table 'article'
SELECT * from article;


# 02) Sélectionnez tous les champs de la table 'categ'
 
 SELECT * from categ;

# 03) Sélectionnez tous les champs de la table 'image'

SELECT * from image;


# 04) Sélectionnez tous les champs de la table 'perm'

select * from  perm;


# 05) Sélectionnez tous les champs de la table 'theuser'

SELECT *  FROM theuser;


# 06) Sélectionnez 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm'

SELECT theuser.thelogin, theuser.thename, perm.thename as permname from theuser 
inner join perm
on  theuser.perm_idperm= perm.idperm;


# 07) Sélectionnez 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', lorsque 'perm.thelevel' vaut 3
 SELECT theuser.thelogin, theuser.thename, perm.thename  as permane from theuser
 inner join perm 
 on  theuser.perm_idperm= perm.idperm
 where perm.thelevel=3;
    
# 08) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.thetitle' pour chaque utilisateur venant de la table (jointure non obligatoire) 'article'
SELECT theuser.idtheuser, theuser.thelogin, theuser.thename,perm.thename as permmane, article.thetitle from theuser
INNER join perm
on theuser.perm_idperm=perm.idperm
left join article
on theuser.idtheuser = article.theuser_idtheuser;


    
# 09) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.thetitle' pour chaque utilisateur venant de la table (jointure obligatoire!) 'article'


select theuser.idtheuser,  theuser.thelogin, theuser.thename, perm.thename as permane, article.thetitle from theuser
INNER join perm
on theuser.perm_idperm=perm.idperm
inner join article
on theuser.idtheuser= article.theuser_idtheuser; 

    
# 10) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.idarticle' GROUPE  renommé en 'idarticle' ainsi que le 'article.thetitle' GROUPE avec le séparateur ||| renommé en 'thetitle' par chaque utilisateur venant de la table (jointure obligatoire!) 'article' - ! PAS de doublons d'auteurs !

SELECT theuser.idtheuser,theuser.thelogin,theuser.thename, perm.thename as permnane,
GROUP_CONCAT(article.idarticle) as idarticle,
GROUP_CONCAT(article.thetitle SEPARATOR "|||") as thetitle
from theuser
INNER join perm 
on theuser.perm_idperm=perm.idperm
INNER join article
on theuser.idtheuser= article.theuser_idtheuser
GROUP BY theuser.idtheuser;


# 11) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.idarticle' GROUPE   renommé en 'idarticle' ainsi que le 'article.thetitle' GROUPE avec le séparateur ||| renommé en 'thetitle' par chaque utilisateur venant de la table (jointure NON obligatoire) 'article' ordonné par 'theuser.thelogin' descendant - ! PAS de doublons d'auteurs !
SELECT theuser.idtheuser,theuser.thelogin,theuser.thename, perm.thename as permnane,
GROUP_CONCAT(article.idarticle) as idarticle,
GROUP_CONCAT(article.thetitle SEPARATOR "|||") as thetitle
from theuser
INNER join perm 
on theuser.perm_idperm=perm.idperm
left join article
on theuser.idtheuser= article.theuser_idtheuser
GROUP BY theuser.idtheuser ORDER BY theuser.thelogin DESC;

    
# 12) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article' avec 'image.theurl' et 'image.thealt' venant de la table (jointure NON obligatoire) 'images' en affichant tous les articles !
SELECT article.idarticle, article.thetitle  ,article.thedate, image.theurl,image.thealt  from article
left join image 
on  article.idarticle=image.article_idarticle;

    
# 13) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article' avec 'image.theurl' GROUPE avec le séparateur ||| renommé en 'theurl' et 'image.thealt' GROUPE avec le séparateur |$| renommé en 'thealt' venant de la table (jointure NON obligatoire) 'images' en affichant tous les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !
SELECT article.idarticle, article.thetitle, article.thedate,   
GROUP_concat(image.theurl SEPARATOR "|||") as theurl,
group_concat(image.thealt separator "|$|" ) as thealt
from article
left join image 
on  article.idarticle=image.article_idarticle
GROUP BY article.idarticle 
ORDER BY article.thedate DESC;



    
# 14) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article'  avec  'categ.idcateg' GROUPE  renommé en 'idcateg' et 'categ.thetitle' GROUPE avec le séparateur _o!o_ renommé 'ctitle' venant de la table (jointure NON obligatoire) 'categ' en affichant tous les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !
 SELECT article.idarticle, article.thetitle, article.thedate,
 GROUP_concat(categ.idcateg) as idcateg,
 group_concat(categ.thetitle separator" _o!o_ ") as ctitle
 from article
 left join categ_has_article
  on categ_has_article.article_idarticle= article.idarticle
  LEFT join categ
    on  categ.idcateg = categ_has_article.categ_idcateg
    GROUP BY article.idarticle
     ORDER BY article.thedate  DESC;
 
    
# 15) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article'  avec  'categ.idcateg' GROUPE  renommé en 'idcateg' et 'categ.thetitle' GROUPE avec le séparateur _o!o_ renommé 'ctitle' venant de la table (jointure obligatoire) 'categ' avec 'theuser.idtheuser' et 'theuser.thelogin' venant de la table (jointure obligatoire) 'user'  en affichant  les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !
