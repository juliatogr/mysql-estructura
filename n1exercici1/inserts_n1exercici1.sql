USE `n1exercici1`;


# Inserts ADDRESS

INSERT INTO `address`(address_street, address_house, address_entrance, address_appartment, address_zip, address_city, address_state) VALUES 
    ('Carrer Gran de Sant Andreu', '245', '3', '2', '08012', 'Barcelona', 'ES'),
    ('Carrer Puig-garí', '19', '2', '3', '08014', 'Barcelona', 'ES'),
    ('Carrer Numància', '250', '3', 'D', '08016', 'Barcelona', 'ES'),
    ('Gran Via de les Corts Catalanes', '480', '5', 'A', '08010', 'Barcelona', 'ES');

SELECT * FROM `address`; # Confirmem que les dades s'han pujat correctament

# Inserts CLIENT

INSERT INTO `client`(client_name, people_tel, client_email, client_recommendation_id, client_address_id) VALUES 
    ('Anna Puigvert', '628491402', 'anna.pv@gmail.com', NULL, 2),
    ('Paula Cantó', '694819456', 'p.canto@gmail.com', 1, 3);

SELECT * FROM `client`; # Confirmem que les dades s'han pujat correctament

# Inserts PROVIDER

INSERT INTO `provider`(provider_name, provider_tel, provider_fax, provider_address_id) VALUES 
    ('Joan Serrano', '635029453', '934561561', 1),
    ('Oriol Tinoco', '604859025', '959356302', 4);

SELECT * FROM `provider`; # Confirmem que les dades s'han pujat correctament

# Inserts TAG

INSERT INTO `tag`(tag_name, provider_id) VALUES 
    ('Alain Afflelou', 1),
    ('Boss', 1),
    ('Ray-Ban', 1),
    ('Gucci', 2);

SELECT * FROM `tag`; # Confirmem que les dades s'han pujat correctament

# Inserts SELL

INSERT INTO `sell`(client_id, seller_name, sell_date) VALUES 
    (1, 'Marcos Palacios', '2022-06-21 10:04:31'),
    (1, 'Sandra Figueres', '2022-07-3 16:32:40'),
    (2, 'Sandra Figueres', '2022-07-18 12:23:52');

SELECT * FROM `sell`; # Confirmem que les dades s'han pujat correctament

# Inserts GLASSES

INSERT INTO `glasses`(glasses_tag, glasses_prescription_left, glasses_prescription_right, glasses_frame_type, glasses_frame_color,
    glasses_color_left, glasses_color_right, glasses_price, sell_id) VALUES 
    ('Alain Afflelou', 1.2, 1.8, 'plastic', 'silver', 'blue', 'blue', 30.5, 1),
    ('Gucci', 0.5, 1.1, 'metal', 'red', 'black', 'black', 80.3, 2),
    ('Ray-Ban', 1.4, 0.9, 'wood', 'gold', 'yellow', 'yellow', 125.6, 3);
    
SELECT * FROM `glasses`; # Confirmem que les dades s'han pujat correctament
    
