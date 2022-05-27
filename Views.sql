CREATE VIEW vw_goods AS 
SELECT g.id_goods, g.goods, g.brief_description, g.id_categories
FROM `goods` AS g;

DROP VIEW vw_goods

SELECT g.id_categories AS number_categories, g.goods AS categories, COUNT(*) AS counter
FROM vw_goods AS g
LEFT JOIN goods_categories AS gc
ON g.id_categories = gc.id_categories
GROUP BY g.id_categories;

CREATE VIEW vw_goods_categories AS 
SELECT gc.id_categories, gc.categories_name, gc.categories_description
FROM `goods_categories` AS gc;

DROP VIEW vw_goods_categories

SELECT g.id_categories AS number_categories, gc.categories_name AS categories, COUNT(*) AS counter
FROM vw_goods_categories AS gc
INNER JOIN goods_categories AS g
ON g.id_categories = gc.id_categories
GROUP BY gc.id_categories;