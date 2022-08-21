USE `n1exercici1`;

-- Llista el total de factures d'un client/a en un període determinat.
SELECT s.sell_id, s.seller_name, s.sell_date, c.client_id, c.client_name
FROM `sell` AS s
CROSS JOIN `client` AS c
ON s.client_id = c.client_id
WHERE c.client_id = 1;

-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
SELECT g.*, s.seller_name, s.sell_date, s.client_id
FROM `sell` AS s
JOIN `glasses` AS g
ON g.sell_id = s.sell_id
WHERE s.seller_name = 'Sandra Figueres'
AND YEAR(s.sell_date) = 2022;

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT DISTINCT p.*
FROM `provider` AS p
JOIN `tag` AS t
JOIN `glasses` AS g
JOIN `sell` AS s
ON t.provider_id = p.provider_id AND t.tag_name = g.glasses_tag AND g.sell_id = s.sell_id;
