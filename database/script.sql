CREATE TABLE Auteur(
   idAuteur SERIAL,
   Nom VARCHAR(100)  NOT NULL,
   PRIMARY KEY(idAuteur)
);

INSERT INTO Auteur (Nom) VALUES
('Victor Hugo'),
('Albert Einstein'),
('Platon'),
('Arthur Schopenhauer'),
('George Orwell');


CREATE TABLE Categorie(
   idCategorie SERIAL,
   Nom VARCHAR(100)  NOT NULL,
   PRIMARY KEY(idCategorie)
);

INSERT INTO Categorie (Nom) VALUES
('Roman'),
('Science'),
('Philosophie'),
('Politique'),
('Fantastique');


CREATE TABLE Role(
   idRole SERIAL,
   Nom VARCHAR(50)  NOT NULL,
   PRIMARY KEY(idRole)
);

CREATE TABLE TypeAdherent(
   idTypeAdherent SERIAL,
   Nom VARCHAR(50)  NOT NULL,
   NbJourPret INTEGER NOT NULL,
   Quota INTEGER NOT NULL,
   PRIMARY KEY(idTypeAdherent)
);

INSERT INTO TypeAdherent (Nom, NbJourPret, Quota) VALUES
('Etudiant', 15, 3),
('Professeur', 30, 5),
('Anonyme', 7, 1);


CREATE TABLE TypePret(
   idTypePret SERIAL,
   Nom VARCHAR(100)  NOT NULL,
   PRIMARY KEY(idTypePret)
);

INSERT INTO TypePret VALUES 
(default,"A domicile"),
(default,"Sur place");

CREATE TABLE TypeMouvement(
   idTypeMouvement SERIAL,
   Nom VARCHAR(100)  NOT NULL,
   PRIMARY KEY(idTypeMouvement)
);

CREATE TABLE JourFerie(
   idJourFerie SERIAL,
   DateFerie DATE NOT NULL,
   Nom VARCHAR(100)  NOT NULL,
   PRIMARY KEY(idJourFerie)
);

CREATE TABLE TypePenalite(
   idTypePenalite SERIAL,
   Nom VARCHAR(50)  NOT NULL,
   PRIMARY KEY(idTypePenalite)
);

CREATE TABLE Livre(
   idLivre SERIAL,
   Titre VARCHAR(100)  NOT NULL,
   DateSortie DATE NOT NULL,
   Edition VARCHAR(50) ,
   Auteur VARCHAR(100)  NOT NULL,
   NombreExemplaire INTEGER NOT NULL,
   idCategorie INTEGER NOT NULL,
   idAuteur INTEGER NOT NULL,
   PRIMARY KEY(idLivre),
   FOREIGN KEY(idCategorie) REFERENCES Categorie(idCategorie),
   FOREIGN KEY(idAuteur) REFERENCES Auteur(idAuteur)
);

INSERT INTO Livre (Titre, DateSortie, Edition, Auteur, NombreExemplaire, idCategorie, idAuteur)
VALUES
('Les Misérables', '1862-01-01', 'Hachette', 'Victor Hugo', 3, 1, 1),
('La Théorie de la Relativité', '1916-11-25', 'Springer', 'Albert Einstein', 2, 2, 2),
('La République', '0380-01-01', 'Belles Lettres', 'Platon', 4, 3, 3),
('Le Monde comme volonté et comme représentation', '1818-01-01', 'PUF', 'Arthur Schopenhauer', 2, 3, 4),
('1984', '1949-06-08', 'Secker & Warburg', 'George Orwell', 5, 4, 5);


CREATE TABLE Exemplaire(
   idExemplaire SERIAL,
   NumeroExemplaire INTEGER NOT NULL,
   DateAjout DATE NOT NULL,
   status VARCHAR(50) ,
   idLivre INTEGER NOT NULL,
   PRIMARY KEY(idExemplaire),
   FOREIGN KEY(idLivre) REFERENCES Livre(idLivre)
);

INSERT INTO Exemplaire (NumeroExemplaire, DateAjout, status, idLivre) VALUES
-- Les Misérables (idLivre = 1)
(1, '2024-01-10', 'Disponible', 1),
(2, '2024-02-15', 'Emprunté', 1),
(3, '2024-03-20', 'Disponible', 1),

-- La Théorie de la Relativité (idLivre = 2)
(1, '2024-04-10', 'Disponible', 2),
(2, '2024-04-12', 'Perdu', 2),

-- La République (idLivre = 3)
(1, '2024-05-01', 'Disponible', 3),
(2, '2024-05-01', 'Disponible', 3),
(3, '2024-05-01', 'Disponible', 3),
(4, '2024-05-01', 'Emprunté', 3),

-- Le Monde comme volonté... (idLivre = 4)
(1, '2024-06-01', 'Disponible', 4),
(2, '2024-06-02', 'Emprunté', 4),

-- 1984 (idLivre = 5)
(1, '2024-06-10', 'Disponible', 5),
(2, '2024-06-11', 'Réservé', 5),
(3, '2024-06-12', 'Disponible', 5),
(4, '2024-06-13', 'Disponible', 5),
(5, '2024-06-14', 'Emprunté', 5);


CREATE TABLE Utilisateur(
   idUtilisateur SERIAL,
   Nom VARCHAR(100)  NOT NULL,
   Email VARCHAR(100)  NOT NULL,
   MotDePasse VARCHAR(100)  NOT NULL,
   Telephone VARCHAR(50)  NOT NULL,
   Adresse VARCHAR(50)  NOT NULL,
   DateInscription DATE NOT NULL,
   DateNaissance DATE NOT NULL,
   idRole INTEGER NOT NULL,
   PRIMARY KEY(idUtilisateur),
   FOREIGN KEY(idRole) REFERENCES Role(idRole)
);

CREATE TABLE Bibliothecaire(
   idUtilisateur INTEGER,
   DateEmbauche DATE NOT NULL,
   PRIMARY KEY(idUtilisateur),
    FOREIGN KEY(idUtilisateur) REFERENCES Utilisateur(idUtilisateur)
);

CREATE TABLE Adherent(
    idUtilisateur INTEGER,
    DateAdhesion DATE NOT NULL,
    Actif BOOLEAN NOT NULL,
    idTypeAdherent INTEGER NOT NULL,
    PRIMARY KEY(idUtilisateur),
    FOREIGN KEY(idUtilisateur) REFERENCES Utilisateur(idUtilisateur) ,
    FOREIGN KEY(idTypeAdherent) REFERENCES TypeAdherent(idTypeAdherent)
);



CREATE TABLE Reservation(
   idReservation SERIAL,
   Statut VARCHAR(50)  NOT NULL,
   DateReservation DATE NOT NULL,
   idAdherent INTEGER NOT NULL,
   idExemplaire INTEGER NOT NULL,
   PRIMARY KEY(idReservation),
   FOREIGN KEY(idAdherent) REFERENCES Adherent(idAdherent),
   FOREIGN KEY(idExemplaire) REFERENCES Exemplaire(idExemplaire)
);

CREATE TABLE Penalite(
   idPenalite SERIAL,
   DateDebut DATE NOT NULL,
   DateFin DATE NOT NULL,
   idTypePenalite INTEGER NOT NULL,
   idAdherent INTEGER NOT NULL,
   PRIMARY KEY(idPenalite),
   FOREIGN KEY(idTypePenalite) REFERENCES TypePenalite(idTypePenalite),
   FOREIGN KEY(idAdherent) REFERENCES Adherent(idAdherent)
);

CREATE TABLE Pret(
   idPret SERIAL,
   DatePret DATE NOT NULL,
   DatePrevue DATE,
   idExemplaire INTEGER NOT NULL,
   idTypePret INTEGER NOT NULL,
   idAdherent INTEGER NOT NULL,
   PRIMARY KEY(idPret),
   FOREIGN KEY(idExemplaire) REFERENCES Exemplaire(idExemplaire),
   FOREIGN KEY(idTypePret) REFERENCES TypePret(idTypePret),
   FOREIGN KEY(idAdherent) REFERENCES Adherent(idAdherent)
);

CREATE TABLE Reprise(
   idReprise SERIAL,
   DateReprise DATE NOT NULL,
   idExemplaire INTEGER NOT NULL,
   idPret INTEGER NOT NULL,
   PRIMARY KEY(idReprise),
   FOREIGN KEY(idExemplaire) REFERENCES Exemplaire(idExemplaire),
   FOREIGN KEY(idPret) REFERENCES Pret(idPret)
);

CREATE TABLE ProlongementPret(
   idProlongementPret SERIAL,
   DateProlongement DATE NOT NULL,
   DateFin DATE NOT NULL,
   idPret INTEGER NOT NULL,
   PRIMARY KEY(idProlongementPret),
   UNIQUE(idPret),
   FOREIGN KEY(idPret) REFERENCES Pret(idPret)
);

CREATE TABLE MouvementExemplaire(
   idMouvementExemplaire SERIAL,
   Nombre INTEGER NOT NULL,
   DateMouvement DATE NOT NULL,
   idPret INTEGER NOT NULL,
   idTypeMouvement INTEGER NOT NULL,
   idExemplaire INTEGER NOT NULL,
   PRIMARY KEY(idMouvementExemplaire),
   FOREIGN KEY(idPret) REFERENCES Pret(idPret),
   FOREIGN KEY(idTypeMouvement) REFERENCES TypeMouvement(idTypeMouvement),
   FOREIGN KEY(idExemplaire) REFERENCES Exemplaire(idExemplaire)
);
