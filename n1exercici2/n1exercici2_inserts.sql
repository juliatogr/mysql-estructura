USE `n1exercici2`;


# Inserts PROVINCIA

INSERT INTO `provincia`(provincia_nom) VALUES 
    ('Barcelonès'),
    ('Maresme'),
    ('Tarragonès'),
    ('Gironès'),
    ('Pallars Jussà'),
    ('Anoia'),
    ('Garrigues'),
    ('Selva'),
    ('Alt Empordà'),
    ('Baix Empordà');

SELECT * FROM `provincia`; # Confirmem que les dades s'han pujat correctament

# Inserts LOCALITAT

INSERT INTO `localitat`(localitat_nom, provincia_provincia_id) VALUES 
    ('Badalona', 1),
    ('Barcelona', 1),
    ('Terrassa', 1),
    ('Hospitalet de Llobregat', 1),
    ('Esplugues', 1),
    ('Mataró', 2),
    ('El Masnou', 2),
    ('Premià de Mar', 2),
    ('Vilassar de Mar', 2),
    ('Tarragona', 3),
    ('Girona', 4);

SELECT * FROM `localitat`; # Confirmem que les dades s'han pujat correctament

# Inserts CLIENT

INSERT INTO `client`(client_nom, client_cognoms, adreça, codi_postal, localitat, client_tel) VALUES 
    ('Júlia', 'Tortosa Grau', 'Carrer de les Tres Creus, 2 Baixos', '08030', 2, '673564257'),
    ('Marta', 'Rodríguez Selva', 'Gran Via de les Corts Catalanes 140, 10 D', '08010', 2, '650035027'),
    ('Pau', 'Cosí Martínez', 'Travessera de Gràcia 130, 4 3', '08014', 2, '624060492'),
    ('Rubén', 'Prat Danubi', 'Carrer Numància 50, 1 B', '08012', 2, '645672547'),
    ('Laura', 'Soler Muntanya', 'Passatge dels Horts 5, Casa', '08320', 7, '721041940'),
    ('Àlex', 'Cardona Follit', 'Carrer Rosa Sensat 30, 5 4', '08320', 7, '692041518');

SELECT * FROM `client`; # Confirmem que les dades s'han pujat correctament

# Inserts BOTIGA

INSERT INTO `botiga`(botiga_nom, botiga_adreça, botiga_codi_postal, botiga_localitat) VALUES 
    ('Mario e Luigi', 'Plaça de les Palmeres 2, Local', '08030', 2),
    ('Napoli', 'Carrer de Sants 30, Local', '08010', 2),
    ('Pomodoro', 'Rambla de poblenou 53, Local', '08020', 2),
    ('Tartufo', 'Carrer Vallespir 24, Local', '08012', 2),
    ('Turino', 'Carrer Alella 4, Local', '08320', 7);

SELECT * FROM `botiga`; # Confirmem que les dades s'han pujat correctament

# Inserts EMPLEAT

INSERT INTO `empleat`(nif, empleat_nom, empleat_cognoms, empleat_tel, empleat_tipus, botiga_botiga_id) VALUES 
    ('41829498R', 'Joan', 'Serrano', '732044205', 'Repartidor/a', 3),
    ('32049502Z', 'Oriol', 'Tinoco', '619485194', 'Cuiner/a', 2),
    ('37495029T', 'Sonia', 'Martínez', '647950395', 'Cuiner/a', 5),
    ('40134953A', 'Jessica', 'Carmín', '718239142', 'Repartidor/a', 5);

SELECT * FROM `empleat`; # Confirmem que les dades s'han pujat correctament

# Inserts COMANDA

INSERT INTO `comanda`(comanda_data, comanda_tipus, client_client_id, botiga_botiga_id, comanda_repartidor, comanda_data_entrega) VALUES 
    ('2022-06-21 10:04:31', 'repartiment', 1, 3, '41829498R', '2022-06-21 13:56:23'),
    ('2022-06-30 12:32:45', 'repartiment', 6, 1, '40134953A', '2022-06-30 15:05:16'),
    ('2022-07-05 13:04:52', 'botiga', 4, 2, NULL, NULL),
    ('2022-07-13 14:26:03', 'botiga', 2, 4, NULL, NULL),
    ('2022-07-24 15:01:47', 'botiga', 5, 5, NULL, NULL);

SELECT * FROM `comanda`; # Confirmem que les dades s'han pujat correctament

-- Disparador per tal de calcular el preu total d'una comanda de forma automàtica cada cop que s'insereix un producte a una comanda
DROP TRIGGER IF EXISTS comanda_preu_total;

DELIMITER \\

CREATE TRIGGER comanda_preu_total 
AFTER INSERT ON comanda_producte
FOR EACH ROW
BEGIN 
    
    # Calculem la suma total per la comanda en la que s'ha efectuat el canvi
    SELECT SUM(p.preu*cp.producte_quantitat) INTO @total FROM comanda as c JOIN comanda_producte as cp JOIN producte as p 
    ON c.comanda_id = cp.comanda_id AND p.producte_id = cp.producte_id WHERE c.comanda_id = NEW.comanda_id;

    # Actualitzem el preu segons el càlcul fet
    UPDATE comanda SET 
        comanda_preu = @total
    WHERE comanda_id = NEW.comanda_id;
END; \\

DELIMITER ;

# Inserts CATEGORIA

INSERT INTO `categoria`(categoria_nom, categoria_pare) VALUES 
    ('Pizza', DEFAULT),
    ('Hamburguesa', DEFAULT),
    ('Beguda', DEFAULT),
    ('Pizza Caprese', 'Pizza'),
    ('Pizza Pepperoni', 'Pizza');

SELECT * FROM `categoria`; # Confirmem que les dades s'han pujat correctament

# Inserts PRODUCTE

INSERT INTO `producte`(producte_nom, categoria, producte_descripcio, imatge, preu) VALUES 
    ('La donna', 'Pizza Caprese', 'Ingredients: Farina, Tomàquet, Formatge, Oli, Sal, Rúcula', 'https://www.comedera.com/wp-content/uploads/2022/03/pizza-caprese.jpg', 14.2),
    ('Nella Roma', 'Pizza Pepperoni', 'Ingredients: Farina, Tomàquet, Formatge, Oli, Sal, Pepperoni', 'https://placeralplato.com/files/2016/01/Pizza-con-pepperoni-640x480.jpg?width=1200&enable=upscale', 13.6),
    ('Capra', 'Hamburguesa', 'Ingredients: Carn de Porc, Rúcula, formatge de cabra, tomàquet, ceba caramenlitzada', 'https://cdn.elcocinerocasero.com/imagen/receta/1000/2018-01-15-13-15-07/hamburguesa-con-queso-de-cabra-y-cebolla-caramelizada.jpeg', 12.5),
    ('Acqua S. Pellegrino', 'Beguda', 'Aigua Embotellada Provinent d`Itàlia', 'https://lafuente.es/wp-content/uploads/2019/10/AGUA-SAN-PELLEGRINO-75CL.jpg', 2.3),
    ('Limoncello', 'Beguda', 'Chupito de Licor de llimona Italià de 30% vol', 'https://images-na.ssl-images-amazon.com/images/I/81096ASjbnL._SL1500_.jpg', 4.1);

SELECT * FROM `producte`; # Confirmem que les dades s'han pujat correctament

# Inserts COMANDA_PRODUCTE

INSERT INTO `comanda_producte`(comanda_id, producte_id, producte_quantitat) VALUES
(1, 1, 2),
(1, 3, 1),
(1, 4, 1),
(1, 5, 2),
(2, 1, 3),
(2, 2, 1),
(3, 2, 2),
(3, 3, 1),
(3, 4, 2),
(3, 5, 4),
(4, 1, 1),
(4, 3, 2),
(4, 4, 3),
(5, 1, 3),
(5, 3, 2),
(5, 4, 6);

SELECT * FROM `comanda_producte`;

SELECT * FROM `comanda`; # Comprovem que el disparador hagi funcionat i ha calculat cadascún dels preus totals
