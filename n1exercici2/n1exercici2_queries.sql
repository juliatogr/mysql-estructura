USE `n1exercici2`;

-- Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.

SELECT DISTINCT p.*, l.localitat_nom AS localitat_venda
FROM comanda AS c JOIN comanda_producte AS cp JOIN producte AS p JOIN `client` JOIN localitat AS l
ON c.comanda_id = cp.comanda_id AND p.producte_id = cp.producte_id AND c.client_client_id = `client`.client_id AND `client`.localitat = l.localitat_id
WHERE p.categoria LIKE 'Beguda' AND l.localitat_nom LIKE 'Barcelona';

-- Llista quantes comandes ha efectuat un determinat empleat/da.
SELECT e.nif, e.empleat_nom, e.empleat_cognoms, COUNT(c.comanda_id) as `# comandes`
FROM comanda AS c JOIN empleat as e
ON c.comanda_repartidor = e.nif
GROUP BY e.nif;