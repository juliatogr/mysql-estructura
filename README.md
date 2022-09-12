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

## n2exercici1 - Youtube
Tractarem de fer un model senzill de com seria la base de dades per a una versió reduïda de YouTube.

De cada usuari/ària guardem un identificador únic:
Email.
Password.
Nom d'usuari/ària.
Data de naixement.
Sexe.
País.
Codi postal.


Un usuari/ària publica vídeos. De cada vídeo guardem un identificador únic:
Un títol.
Una descripció.
Una grandària.
El nom de l'arxiu de vídeo.
Durada del vídeo.
Un thumbnail.
El nombre de reproduccions.
El número de likes.
El número de dislikes.

Un vídeo pot tenir tres estats diferents: públic, ocult i privat. Un vídeo pot tenir moltes etiquetes. Una etiqueta s'identifica per un identificador únic i un nom d'etiqueta. Interessa guardar qui és l'usuari/ària que publica el vídeo i en quina data/hora el fa.


Un usuari/ària pot crear un canal. Un canal té un identificador únic:
Un nom.
Una descripció.
Una data de creació.


Un usuari/ària es pot subscriure als canals d'altres usuaris/es. Un usuari/ària pot donar-li un like o un dislike a un vídeo una única vegada. Caldrà portar un registre dels usuaris/es que li han donat like i dislike a un determinat vídeo i en quina data/hora ho van fer.


Un usuari/ària pot crear playlists amb els vídeos que li agraden. Cada playlist té un identificador únic:
Un nom.
Una data de creació.
Un estat que indica que pot ser pública o privada.


Un usuari/ària pot escriure comentaris en un vídeo determinat. Cada comentari està identificat per un identificador únic:
El text del comentari.
La data/hora en la qual es va realitzar.


Un usuari/ària pot marcar un comentari com m'agrada o no m'agrada. Caldrà portar un registre dels usuaris/es que han marcat un comentari com m'agrada/no m'agrada, i en quina data/hora ho van fer.

## n3exercici1 - Spotify

Tractarem de fer un model senzill de com seria la base de dades necessària per a Spotify.

Existeixen dos tipus d'usuaris/es: free i  prèmium. De cada usuari/ària guardem un identificador únic:
Email.
password.
Nom d'usuari/ària.
Data de naixement.
Sexe.
País.
Codi postal.

Els usuaris/es prèmium fan subscripcions. Les dades necessàries que caldrà guardar per a cada subscripció són:
Data d'inici de la subscripció.
Data de renovació del servei.
Una forma de pagament, que pot ser mitjançant targeta de crèdit o PayPal.

De les targetes de crèdit guardem el número de targeta, mes i any de caducitat i el codi de seguretat. Dels usuaris/es que paguen amb PayPal guardem el nom d'usuari/ària de PayPal. Ens interessa portar un registre de tots els pagaments que un usuari/ària prèmium ha anat realitzant durant el període que està subscrit. De cada pagament es guarda:
La data.
Un número d'ordre (que és únic).
Un total.

Un usuari/ària pot crear moltes playlists. De cada playlist guardem:
Un títol.
El nombre de cançons que conté.
Un identificador únic.
Una data de creació.


Quan un usuari/ària esborra una playlist no s'esborra del sistema, sinó que es marca com que ha estat eliminada. D'aquesta manera l'usuari/ària pot tornar a recuperar les seves playlists en cas que les hagi eliminat per error. És necessari emmagatzemar la data en la qual la playlist ha estat marcada com eliminada.

Podem dir que existeixen dos tipus de playlists: actives i esborrades. Una playlist que està activa pot ser compartida amb altres usuaris/es, això vol dir que altres usuaris/es poden afegir cançons en ella. En una llista compartida ens interessa saber quin usuari/ària ha estat el que ha afegit cada cançó i en quina data ho va fer.
Una cançó només pot pertànyer a un únic àlbum. Un àlbum pot contenir moltes cançons. Un àlbum ha estat publicat per un/a únic/a artista. Un/a artista pot haver publicat molts àlbums. De cada cançó guardem un identificador únic:
Un títol.
Una durada.
El nombre de vegades que ha estat reproduïda pels usuaris/es de Spotify.

De cada àlbum guardem un identificador únic:
Títol.
Any de publicació.
Una imatge amb la portada.
.
De cada artista guardem un identificador únic:
Nom.
Una imatge de l'artista


Un usuari/ària pot seguir a molts/es artistes. Un/a artista pot estar relacionat/da amb altres artistes que facin música semblant. De manera que Spotify pugui mostrar-nos un llistat d'artistes relacionats/des amb els artistes que ens agraden. També ens interessa guardar quins són els àlbums i les cançons favorites d'un usuari/ària. Un usuari/ària pot seleccionar molts àlbums i moltes cançons com a favorites.
## util links

The next links helped me a lot to finish this task.

- *Entity Relationship (ER) Diagram Model with DBMS Example:* https://www.guru99.com/er-diagram-tutorial-dbms.html
- *Get current row data on trigger:* https://www.sqlservercentral.com/forums/topic/current-row-in-a-trigger
- *Calculating the SUM of (Quantity*Price) from 2 different tables:* https://stackoverflow.com/questions/3506332/calculating-the-sum-of-quantityprice-from-2-different-tables
