# mysql-estructura

Repository created to deliver the first task of the second sprint of the BackEnd Java Bootcamp at IT-Academy.
<p align="center">
<img src=https://user-images.githubusercontent.com/72571435/179958350-c8db27b9-ada1-45d3-8ab4-6f2dcd31eb30.png width="120" height="120" />
</p>


## n1exercici1 - Òptica

Una òptica, anomenada “Cul d'Ampolla”, vol informatitzar la gestió dels clients/es i vendes d'ulleres.

En primer lloc, l'òptica vol saber quin és el proveïdor de cadascuna de les ulleres. En concret vol saber de cada proveïdor:
El nom
L'adreça (carrer, número, pis, porta, ciutat, codi postal i país)
Telèfon
Fax
NIF.

La política de compres de l'òptica es basa que les ulleres d'una marca es compraran a un únic proveïdor (així en podrà treure més bons preus), però poden comprar ulleres de diverses marques a un proveïdor. De les ulleres vol saber:
La marca.
La graduació de cadascun dels vidres.
El tipus de muntura (flotant, pasta o metàl·lica).
El color de la muntura.
El color de cada vidre.
El preu.

Dels clients/es vol emmagatzemar:
El nom.
L'adreça postal.
El telèfon.
El correu electrònic.
La data de registre.
Quan arriba un/a client/a nou, emmagatzemar el/la client/a que li ha recomanat l'establiment (sempre que algú li hagi recomanat).
El nostre sistema haurà d’indicar qui ha sigut l’empleat/da que ha venut cada ullera.

![image](https://user-images.githubusercontent.com/72571435/180956473-162c6c73-193d-47bb-9aa4-6d924fa9c30f.png)

## n1exercici2 - Pizzeria

T’han contractat per a dissenyar una web que permeti fer comandes de menjar a domicili per Internet.

Tingues en compte les següents indicacions per a modelar com seria la base de dades del projecte:
Per a cada client/a emmagatzemem un identificador únic:
Nom.
Cognoms.
Adreça.
Codi postal.
Localitat.
Província.
Número de telèfon.
Les dades de localitat i província estaran emmagatzemats en taules separades. Sabem que una localitat pertany a una única província, i que una província pot tenir moltes localitats. Per a cada localitat emmagatzemem un identificador únic i un nom. Per a cada província emmagatzemem un identificador únic i un nom.

Una persona pot realitzar moltes comandes, però una única comanda només pot ser realitzat per una única persona. De cada comanda s'emmagatzema un identificador únic:
Data/hora.
Si la comanda és per a repartiment a domicili o per a recollir en botiga.
La quantitat de productes que s'han seleccionat de cada tipus.
El preu total.

Una comanda pot constar d'un o diversos productes.


Els productes poden ser pizzes, hamburgueses i begudes. De cada producte s'emmagatzema un identificador únic:
Nom.
Descripció.
Imatge.
Preu.

En el cas de les pizzes existeixen diverses categories que poden anar canviant de nom al llarg de l'any. Una pizza només pot estar dins d'una categoria, però una categoria pot tenir moltes pizzes.


De cada categoria s'emmagatzema un identificador únic i un nom. Una comanda és gestionada per una única botiga i una botiga pot gestionar moltes comandes. De cada botiga s'emmagatzema un identificador únic:
Adreça.
Codi postal.
Localitat.
Província.


En una botiga poden treballar molts empleats/des i un empleat/da només pot treballar en una botiga. De cada empleat/da, s'emmagatzema un identificador únic:
Nom.
Cognoms.
NIF.
Telèfon.
Si treballa com a cuiner/a o repartidor/a. Per a les comandes de repartiment a domicili interessa guardar qui és el repartidor/a que fa el lliurament de la comanda i la data/hora del moment del lliurament.

![image](https://user-images.githubusercontent.com/72571435/188220159-af1e81dc-c1c0-4588-9c4a-20db3f1a96d2.png)


## util links

The next links helped me a lot to finish this task.

- *Entity Relationship (ER) Diagram Model with DBMS Example:* https://www.guru99.com/er-diagram-tutorial-dbms.html
- *Get current row data on trigger:* https://www.sqlservercentral.com/forums/topic/current-row-in-a-trigger
- *Calculating the SUM of (Quantity*Price) from 2 different tables:* https://stackoverflow.com/questions/3506332/calculating-the-sum-of-quantityprice-from-2-different-tables
