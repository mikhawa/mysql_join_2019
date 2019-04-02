/*
LES JOINTURES EN MYSQL

2019/04/01 Jillian

*/

# 01) Sélectionnez tous les champs de la table 'article'
Select * from article;

# 02) Sélectionnez tous les champs de la table 'categ'
Select * from categ;

# 03) Sélectionnez tous les champs de la table 'image'
Select * from image;

# 04) Sélectionnez tous les champs de la table 'perm'
Select * from perm;		

# 05) Sélectionnez tous les champs de la table 'theuser'
Select * from theuser;

# 06) Sélectionnez 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm'
Select theuser.thelogin,theuser.thename,perm.thename as permname from theuser join perm on perm.idperm=theuser.perm_idperm;

# 07) Sélectionnez 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', lorsque 'perm.thelevel' vaut 3
Select theuser.thelogin,theuser.thename,perm.thename as permname from theuser join perm on perm.idperm=theuser.perm_idperm where perm.thelevel = 3; 

    
# 08) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.thetitle' pour chaque utilisateur venant de la table (jointure non obligatoire) 'article'
select theuser.idtheuser,theuser.thelogin,theuser.thename,perm.thename as pername,article.thetitle from theuser 
join perm on perm.idperm=theuser.perm_idperm
left join article on theuser.idtheuser=article.theuser_idtheuser;
    
# 09) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.thetitle' pour chaque utilisateur venant de la table (jointure obligatoire!) 'article'
select theuser.idtheuser,theuser.thelogin,theuser.thename,perm.thename as pername,article.thetitle from theuser 
join perm on perm.idperm=theuser.perm_idperm
join article on theuser.idtheuser=article.theuser_idtheuser;
    
# 10) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.idarticle' GROUPE  renommé en 'idarticle' ainsi que le 'article.thetitle' GROUPE avec le séparateur ||| renommé en 'thetitle' par chaque utilisateur venant de la table (jointure obligatoire!) 'article' - ! PAS de doublons d'auteurs' !
select theuser.idtheuser,theuser.thelogin,theuser.thename,perm.thename as pername,
GROUP_CONCAT(article.idarticle SEPARATOR ',')as idarticle,
GROUP_CONCAT(article.thetitle SEPARATOR '|||')as thetitle from theuser 
join perm on perm.idperm=theuser.perm_idperm
join article on theuser.idtheuser=article.theuser_idtheuser
group by theuser.thelogin
order by pername asc;

# 11) Sélectionnez 'theuser.idtheuser', 'theuser.thelogin', 'theuser.thename' de la table 'theuser' avec 'perm.thename' renommé 'permname' venant de la table (jointure obligatoire) 'perm', et le 'article.idarticle' GROUPE   renommé en 'idarticle' ainsi que le 'article.thetitle' GROUPE avec le séparateur ||| renommé en 'thetitle' par chaque utilisateur venant de la table (jointure NON obligatoire) 'article' ordonné par 'theuser.thelogin' descendant - ! PAS de doublons d'auteurs' !
select theuser.idtheuser,theuser.thelogin,theuser.thename,perm.thename as pername,
GROUP_CONCAT(article.idarticle SEPARATOR ',')as idarticle,
GROUP_CONCAT(article.thetitle SEPARATOR '|||')as thetitle from theuser 
join perm on perm.idperm=theuser.perm_idperm
left join article on theuser.idtheuser=article.theuser_idtheuser
group by theuser.thelogin
order by theuser.thelogin desc;
    
# 12) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article' avec 'image.theurl' et 'image.thealt' venant de la table (jointure NON obligatoire) 'images' en affichant tous les articles !
select article.idarticle,article.thetitle,article.thedate,image.theurl,image.thealt from article
left join image on article.idarticle=image.article_idarticle;
    
# 13) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article' avec 'image.theurl' GROUPE avec le séparateur ||| renommé en 'theurl' et 'image.thealt' GROUPE avec le séparateur |$| renommé en 'thealt' venant de la table (jointure NON obligatoire) 'images' en affichant tous les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles' !
select article.idarticle,article.thetitle,article.thedate,
GROUP_CONCAT(image.theurl SEPARATOR '|||')as theurl,
GROUP_CONCAT(image.thealt SEPARATOR '$')as thealt from article
left join image on image.article_idarticle=article.idarticle
group by idarticle
order by article.thedate desc;
    
# 14) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article'  avec  'categ.idcateg' GROUPE  renommé en 'idcateg' et 'categ.thetitle' GROUPE avec le séparateur _o!o_ renommé 'ctitle' venant de la table (jointure NON obligatoire) 'categ' en affichant tous les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles' !
select article.idarticle,article.thetitle,article.thedate,
GROUP_CONCAT(categ.idcateg)as idcateg,
GROUP_CONCAT(categ.thetitle SEPARATOR '_o!o_')as ctitle from article,categ_has_article
left join categ on categ_has_article.categ_idcateg=categ.idcateg
where article.idarticle=categ_has_article.article_idarticle
group by idarticle
order by article.thedate desc;
    
# 15) Sélectionnez 'article.idarticle', 'article.thetitle' et 'article.thedate' de la table 'article'  avec  'categ.idcateg' GROUPE  renommé en 'idcateg' et 'categ.thetitle' GROUPE avec le séparateur _o!o_ renommé 'ctitle' venant de la table (jointure obligatoire) 'categ' avec 'theuser.idtheuser' et 'theuser.thelogin' venant de la table (jointure obligatoire) 'user'  en affichant  les articles ordonnés par 'article.thedate' descendante ! - ! PAS de doublons d'articles !
