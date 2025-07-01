CREATE DATABASE bibliotheque;
\c bibliotheque;

CREATE TABLE Auteur(
   idAuteur SERIAL,
   Nom VARCHAR(100)  NOT NULL,
   PRIMARY KEY(idAuteur)
);

CREATE TABLE Categorie(
   idCategorie SERIAL,
   Nom VARCHAR(100)  NOT NULL,
   PRIMARY KEY(idCategorie)
);

CREATE TABLE Role(
   idRole SERIAL,
   Nom VARCHAR(50)  NOT NULL,
   PRIMARY KEY(idRole)
);

CREATE TABLE TypeAdherent(
   idTypeAdherent SERIAL,
   Nom VARCHAR(50)  NOT NULL,
   Quota INTEGER NOT NULL,
   NbJourPret INTEGER NOT NULL,
   NbJourPenalite INTEGER NOT NULL,
   PRIMARY KEY(idTypeAdherent)
);


CREATE TABLE TypePret(
   idTypePret SERIAL,
   Nom VARCHAR(100)  NOT NULL,
   PRIMARY KEY(idTypePret)
);

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

CREATE TABLE Validation(
   idValidation SERIAL,
   Nom CHAR(50)  NOT NULL,
   PRIMARY KEY(idValidation)
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

CREATE TABLE Exemplaire(
   idExemplaire SERIAL,
   NumeroExemplaire INTEGER NOT NULL,
   DateAjout DATE NOT NULL,
   status VARCHAR(50) ,
   idLivre INTEGER NOT NULL,
   PRIMARY KEY(idExemplaire),
   FOREIGN KEY(idLivre) REFERENCES Livre(idLivre)
);

CREATE TABLE Reservation(
   idReservation SERIAL,
   Statut VARCHAR(50)  NOT NULL,
   DateReservation DATE NOT NULL,
   idValidation INTEGER NOT NULL,
   idAdherent INTEGER NOT NULL,
   idExemplaire INTEGER NOT NULL,
   PRIMARY KEY(idReservation),
   FOREIGN KEY(idValidation) REFERENCES Validation(idValidation),
   FOREIGN KEY(idAdherent) REFERENCES Adherent(idUtilisateur),
   FOREIGN KEY(idExemplaire) REFERENCES Exemplaire(idExemplaire)
);

CREATE TABLE Penalite(
   idPenalite SERIAL,
   DateDebut DATE NOT NULL,
   DateFin DATE NOT NULL,
   idAdherent INTEGER NOT NULL,
   PRIMARY KEY(idPenalite),
   FOREIGN KEY(idAdherent) REFERENCES Adherent(idUtilisateur)
);

CREATE TABLE Abonnement(
   idAbonnement SERIAL,
   DateDebut DATE NOT NULL,
   DateFin DATE NOT NULL,
   idAdherent INTEGER NOT NULL,
   PRIMARY KEY(idAbonnement),
   FOREIGN KEY(idAdherent) REFERENCES Adherent(idUtilisateur)
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
   FOREIGN KEY(idAdherent) REFERENCES Adherent(idUtilisateur)
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
   idValidation INTEGER NOT NULL,
   idPret INTEGER NOT NULL,
   PRIMARY KEY(idProlongementPret),
   UNIQUE(idPret),
   FOREIGN KEY(idValidation) REFERENCES Validation(idValidation),
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

INSERT INTO Auteur (Nom) VALUES
('Victor Hugo'),
('Albert Einstein'),
('Platon'),
('Arthur Schopenhauer'),
('George Orwell');

INSERT INTO Categorie (Nom) VALUES
('Roman'),
('Science'),
('Philosophie'),
('Politique'),
('Fantastique');

INSERT INTO Role (Nom) VALUES
('Admin'),
('Utilisateur');

INSERT INTO TypeAdherent (Nom, NbJourPret, Quota,NbJourPenalite) VALUES
('Etudiant', 15, 3,10),
('Professeur', 30, 5,5),
('Anonyme', 7, 1,15);

INSERT INTO Validation (Nom) VALUES
('Validé'),
('En attente'),
('Rejeté'),
('En cours de validation');

INSERT INTO TypeAdherent (Nom, NbJourPret, Quota) VALUES
('Etudiant', 15, 3),
('Professeur', 30, 5),
('Anonyme', 7, 1);

INSERT INTO TypePret (Nom) VALUES
('A domicile'),
('Sur place');

INSERT INTO TypeMouvement (Nom) VALUES
('Prêt'),
('Reprise');

INSERT INTO JourFerie (DateFerie, Nom) VALUES
('2025-01-01', 'Nouvel an'),
('2025-03-29', 'Commémoration des martyrs de l''insurrection de 1947'),
('2025-04-18', 'Vendredi Saint'),
('2025-04-21', 'Lundi de Pâques'),
('2025-05-01', 'Fête du travail'),
('2025-05-29', 'Ascension'),
('2025-06-09', 'Lundi de Pentecôte'),
('2025-06-26', 'Fête de l''indépendance'),
('2025-08-15', 'Assomption'),
('2025-11-01', 'Toussaint'),
('2025-12-25', 'Noël');


INSERT INTO Utilisateur (Nom, Email, MotDePasse, Telephone, Adresse, DateInscription, DateNaissance, idRole) VALUES
-- Admin
('Admin Principal', 'admin@biblio.com', 'admin', '0321234567', 'Antananarivo', '2025-01-01', '1990-05-10', 1),

-- Bibliothécaire
('Claire Bibliothécaire', 'claire@biblio.com', 'clairepwd', '0331122334', 'Fianarantsoa', '2025-03-10', '1988-04-15', 2),

-- Adhérents
('Jean Etudiant', 'jean@biblio.com', 'jeanpwd', '0345566778', 'Toamasina', '2025-02-01', '2001-07-20', 2),
('Lova Professeur', 'lova@biblio.com', 'lovapwd', '0329876543', 'Mahajanga', '2025-02-05', '1980-03-08', 2),
('Anjara Lecteur', 'anjara@biblio.com', 'anjara123', '0334455667', 'Toliara', '2025-02-10', '1995-11-11', 2);

INSERT INTO Bibliothecaire (idUtilisateur, DateEmbauche) VALUES
(2, '2025-03-11');

INSERT INTO Adherent (idUtilisateur, DateAdhesion, Actif, idTypeAdherent) VALUES
(3, '2025-02-01', TRUE, 1),
(4, '2025-02-05', TRUE, 2),
(5, '2025-02-10', FALSE, 3);

