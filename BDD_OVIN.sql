/*Table ressencent les différentes bêtes. Et les différents éléments les rendant uniques.*/
CREATE TABLE Bete(
  numBete int NOT NULL PRIMARY KEY, /*40056: (5 chiffres) Identifiant unique de la bête.*/
  numPere int,
  numMere int,
  sexe boolean, /* True Male // False Femmelle */
  nom varchar(25), /*Optionel*/
  dateNaissance date,
  numEleveur int,
  paysOrigine varchar(5) NOT NULL, /*Le Pays d'Origine de la bête sera notifier en suivant la "norme ISO 3166" de l'OIN (L'Organisation Internationale de Normalisation)*/
  statusActifs boolean
);

CREATE TABLE Carnet_de_Sante(
  numBete int NOT NULL PRIMARY KEY,

  typage varchar(5),

  poids3j float,
  poids10j float,
  poids30j float,

  dateTVer date, /*Date traitement Vermifuge*/
  dateTDou date, /*Date traitement Douve*/
  dateTEnt date /*Date traitement Entérotoxémie*/
);

/*table historique des traitements Inopinnés*/
CREATE TABLE  Historique_Des_TIno(
  numBete int NOT NULL,
  dateTIno date,
  descriptifTIno varchar(2555)
);

CREATE TABLE Historique_Des_Poids(
  numBete int NOT NULL,
  poids float,
  datePesee date

);

CREATE TABLE Bete_Vendue(
  numBete int NOT NULL PRIMARY KEY,
  numAcheteur int,
  dateVente date
);

CREATE TABLE Bete_Morte(
  numBete int NOT NULL PRIMARY KEY,
  dateMort date
);

/*Table optionnnelle*/
CREATE TABLE Acheteur(
  numAcheteur int NOT NULL PRIMARY KEY,
  nom varchar(64),
  prenom varchar(64),
  mail varchar(255),
  numTel varchar(64),
  address varchar(1024)
);

/*Table optionnnelle*/
CREATE TABLE Eleveur(
  numEleveur int NOT NULL PRIMARY KEY, /*101252: (6 chiffres) Identifiant unique de l’éleveur.*/
  nom varchar(64),
  prenom varchar(64),
  mail varchar(255),
  numTel varchar(64),
  address varchar(1024)
);

/*Definition des clefs étrangères*/
ALTER TABLE Bete
ADD FOREIGN KEY (numEleveur) REFERENCES Eleveur(numEleveur);
ALTER TABLE Bete
ADD FOREIGN KEY (numMere) REFERENCES Bete(numBete);
ALTER TABLE Bete
ADD FOREIGN KEY (numPere) REFERENCES Bete(numBete);
ALTER TABLE Carnet_de_Sante
ADD FOREIGN KEY (numBete) REFERENCES Bete(numBete);
ALTER TABLE Historique_Des_Poids
ADD FOREIGN KEY (numBete) REFERENCES Bete(numBete);
ALTER TABLE Bete_Vendue
ADD FOREIGN KEY (numBete) REFERENCES Bete(numBete);
ALTER TABLE Bete_Vendue
ADD FOREIGN KEY (numAcheteur) REFERENCES Acheteur(numAcheteur);
ALTER TABLE Bete_Morte
ADD FOREIGN KEY (numBete) REFERENCES Bete(numBete);
ALTER TABLE Historique_Des_TIno
ADD FOREIGN KEY (numBete) REFERENCES Bete(numBete);


INSERT INTO Eleveur VALUES (101252, "Dugalle", "Bérangère", "berangere.dugalle@gmail.com", "07/49/77/27/40", "Beergerie du Lac de l'Oule, St-Lary-Soulan, 65170");
INSERT INTO Eleveur VALUES (102254, "Yamaha", "Galicéna","BergerieDeLaBouyeroune@laposte.net", "06/23/41/41/50", "Bouyerounne, Gars, 06850");
INSERT INTO Eleveur VALUES (111000, "Guiliot", "Martin", "MatinDu06@outlook.fr", "07/56/27/78/00", "Bergerie de la Croix-Sur Roudoule, la Croix-Sur Roudoule, 06260");
INSERT INTO Eleveur VALUES (201457, "De Bourboule", "Régis", "rem2bour@orange.fr","06/85/47/33/22", "La Bergerie du soleil, La Bourboule, 63150");

INSERT INTO Bete VALUES (39999, null, null, FALSE, "Elisabeth_I","1996-08-08", 101252, "FR", 0);
INSERT INTO Bete VALUES (40000, null, null, TRUE, "Tom", "1997-03-01", 111000, "FR", 0);
INSERT INTO Bete VALUES (40001,39999,40000, TRUE, "Robert_1er","2001-04-12", 101252,"FR", 1);


INSERT INTO Carnet_de_Sante VALUES (40001, "AVR",500, 1000, 2500, "2021-01-24","2021-01-24","2021-01-24");
INSERT INTO Carnet_de_Sante VALUES (40000, "AVR",450, 900, 2450, "2021-01-24","2021-01-24","2021-01-24");
INSERT INTO Carnet_de_Sante VALUES (39999, null,520, 1200, 2600, "2021-01-24","2021-01-24","2021-01-24");

INSERT INTO Historique_Des_Poids VALUES (40001, 55.2, "2021-01-24");
INSERT INTO Historique_Des_Poids VALUES (40001, 55.1, "2021-01-22");
INSERT INTO Historique_Des_Poids VALUES (40001, 55, "2021-01-11");



/*
--Debug full wipe--

DROP TABLE Carnet_de_Sante;
DROP TABLE Bete_Morte;
DROP TABLE Bete_Vendue;
DROP TABLE Historique_Des_TIno;
DROP TABLE Historique_Des_Poids;
DROP TABLE Acheteur;
DROP TABLE Bete;
DROP TABLE Eleveur;

*/
