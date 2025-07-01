-- DROP base uniquement si nécessaire
-- DROP DATABASE IF EXISTS bibliotheque;
-- CREATE DATABASE bibliotheque;
-- \c bibliotheque;

-- Suppression des tables dans l'ordre inverse de dépendance
DROP TABLE IF EXISTS MouvementExemplaire CASCADE;
DROP TABLE IF EXISTS ProlongementPret CASCADE;
DROP TABLE IF EXISTS Reprise CASCADE;
DROP TABLE IF EXISTS Pret CASCADE;
DROP TABLE IF EXISTS Abonnement CASCADE;
DROP TABLE IF EXISTS Penalite CASCADE;
DROP TABLE IF EXISTS Reservation CASCADE;
DROP TABLE IF EXISTS Exemplaire CASCADE;
DROP TABLE IF EXISTS Adherent CASCADE;
DROP TABLE IF EXISTS Bibliothecaire CASCADE;
DROP TABLE IF EXISTS Utilisateur CASCADE;
DROP TABLE IF EXISTS Livre CASCADE;
DROP TABLE IF EXISTS Validation CASCADE;
DROP TABLE IF EXISTS JourFerie CASCADE;
DROP TABLE IF EXISTS TypeMouvement CASCADE;
DROP TABLE IF EXISTS TypePret CASCADE;
DROP TABLE IF EXISTS TypeAdherent CASCADE;
DROP TABLE IF EXISTS Role CASCADE;
DROP TABLE IF EXISTS Categorie CASCADE;
DROP TABLE IF EXISTS Auteur CASCADE;

-- Recréation des tables
CREATE TABLE Auteur(
   idAuteur SERIAL PRIMARY KEY,
   Nom VARCHAR(100) NOT NULL
);

CREATE TABLE Categorie(
   idCategorie SERIAL PRIMARY KEY,
   Nom VARCHAR(100) NOT NULL
);

CREATE TABLE Role(
   idRole SERIAL PRIMARY KEY,
   Nom VARCHAR(50) NOT NULL
);

CREATE TABLE TypeAdherent(
   idTypeAdherent SERIAL PRIMARY KEY,
   Nom VARCHAR(50) NOT NULL,
   Quota INTEGER NOT NULL,
   NbJourPret INTEGER NOT NULL,
   NbJourPenalite INTEGER NOT NULL
);

CREATE TABLE TypePret(
   idTypePret SERIAL PRIMARY KEY,
   Nom VARCHAR(100) NOT NULL
);

CREATE TABLE TypeMouvement(
   idTypeMouvement SERIAL PRIMARY KEY,
   Nom VARCHAR(100) NOT NULL
);

CREATE TABLE JourFerie(
   idJourFerie SERIAL PRIMARY KEY,
   DateFerie DATE NOT NULL,
   Nom VARCHAR(100) NOT NULL
);

CREATE TABLE Validation(
   idValidation SERIAL PRIMARY KEY,
   Nom CHAR(50) NOT NULL
);

CREATE TABLE Livre(
   idLivre SERIAL PRIMARY KEY,
   Titre VARCHAR(100) NOT NULL,
   DateSortie DATE NOT NULL,
   Edition VARCHAR(50),
   Auteur VARCHAR(100) NOT NULL,
   NombreExemplaire INTEGER NOT NULL,
   idCategorie INTEGER NOT NULL REFERENCES Categorie(idCategorie),
   idAuteur INTEGER NOT NULL REFERENCES Auteur(idAuteur)
);

CREATE TABLE Utilisateur(
   idUtilisateur SERIAL PRIMARY KEY,
   Nom VARCHAR(100) NOT NULL,
   Email VARCHAR(100) NOT NULL,
   MotDePasse VARCHAR(100) NOT NULL,
   Telephone VARCHAR(50) NOT NULL,
   Adresse VARCHAR(50) NOT NULL,
   DateInscription DATE NOT NULL,
   DateNaissance DATE NOT NULL,
   idRole INTEGER NOT NULL REFERENCES Role(idRole)
);

CREATE TABLE Bibliothecaire(
   idUtilisateur INTEGER PRIMARY KEY REFERENCES Utilisateur(idUtilisateur),
   DateEmbauche DATE NOT NULL
);

CREATE TABLE Adherent(
   idUtilisateur INTEGER PRIMARY KEY REFERENCES Utilisateur(idUtilisateur),
   DateAdhesion DATE NOT NULL,
   Actif BOOLEAN NOT NULL,
   idTypeAdherent INTEGER NOT NULL REFERENCES TypeAdherent(idTypeAdherent)
);

CREATE TABLE Exemplaire(
   idExemplaire SERIAL PRIMARY KEY,
   NumeroExemplaire INTEGER NOT NULL,
   DateAjout DATE NOT NULL,
   status VARCHAR(50),
   idLivre INTEGER NOT NULL REFERENCES Livre(idLivre)
);

CREATE TABLE Reservation(
   idReservation SERIAL PRIMARY KEY,
   Statut VARCHAR(50) NOT NULL,
   DateReservation DATE NOT NULL,
   idValidation INTEGER NOT NULL REFERENCES Validation(idValidation),
   idAdherent INTEGER NOT NULL REFERENCES Adherent(idUtilisateur),
   idExemplaire INTEGER NOT NULL REFERENCES Exemplaire(idExemplaire)
);

CREATE TABLE Penalite(
   idPenalite SERIAL PRIMARY KEY,
   DateDebut DATE NOT NULL,
   DateFin DATE NOT NULL,
   idAdherent INTEGER NOT NULL REFERENCES Adherent(idUtilisateur)
);

CREATE TABLE Abonnement(
   idAbonnement SERIAL PRIMARY KEY,
   DateDebut DATE NOT NULL,
   DateFin DATE NOT NULL,
   idAdherent INTEGER NOT NULL REFERENCES Adherent(idUtilisateur)
);

CREATE TABLE Pret(
   idPret SERIAL PRIMARY KEY,
   DatePret DATE NOT NULL,
   DatePrevue DATE,
   idExemplaire INTEGER NOT NULL REFERENCES Exemplaire(idExemplaire),
   idTypePret INTEGER NOT NULL REFERENCES TypePret(idTypePret),
   idAdherent INTEGER NOT NULL REFERENCES Adherent(idUtilisateur)
);

CREATE TABLE Reprise(
   idReprise SERIAL PRIMARY KEY,
   DateReprise DATE NOT NULL,
   idExemplaire INTEGER NOT NULL REFERENCES Exemplaire(idExemplaire),
   idPret INTEGER NOT NULL REFERENCES Pret(idPret)
);

CREATE TABLE ProlongementPret(
   idProlongementPret SERIAL PRIMARY KEY,
   DateProlongement DATE NOT NULL,
   DateFin DATE NOT NULL,
   idValidation INTEGER NOT NULL REFERENCES Validation(idValidation),
   idPret INTEGER NOT NULL UNIQUE REFERENCES Pret(idPret)
);

CREATE TABLE MouvementExemplaire(
   idMouvementExemplaire SERIAL PRIMARY KEY,
   Nombre INTEGER NOT NULL,
   DateMouvement DATE NOT NULL,
   idPret INTEGER NOT NULL REFERENCES Pret(idPret),
   idTypeMouvement INTEGER NOT NULL REFERENCES TypeMouvement(idTypeMouvement),
   idExemplaire INTEGER NOT NULL REFERENCES Exemplaire(idExemplaire)
);

-- Données
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

INSERT INTO TypeAdherent (Nom, NbJourPret, Quota, NbJourPenalite) VALUES
('Etudiant', 15, 3, 10),
('Professeur', 30, 5, 5),
('Anonyme', 7, 1, 15);

INSERT INTO Validation (Nom) VALUES
('Validé'),
('En attente'),
('Rejeté'),
('En cours de validation');

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
('Admin Principal', 'admin@biblio.com', 'admin', '0321234567', 'Antananarivo', '2025-01-01', '1990-05-10', 1),
('Claire Bibliothécaire', 'claire@biblio.com', 'clairepwd', '0331122334', 'Fianarantsoa', '2025-03-10', '1988-04-15', 2),
('Jean Etudiant', 'jean@biblio.com', 'jeanpwd', '0345566778', 'Toamasina', '2025-02-01', '2001-07-20', 2),
('Lova Professeur', 'lova@biblio.com', 'lovapwd', '0329876543', 'Mahajanga', '2025-02-05', '1980-03-08', 2),
('Anjara Lecteur', 'anjara@biblio.com', 'anjara123', '0334455667', 'Toliara', '2025-02-10', '1995-11-11', 2);

INSERT INTO Bibliothecaire (idUtilisateur, DateEmbauche) VALUES
(2, '2025-03-11');

INSERT INTO Adherent (idUtilisateur, DateAdhesion, Actif, idTypeAdherent) VALUES
(3, '2025-02-01', TRUE, 1),
(4, '2025-02-05', TRUE, 2),
(5, '2025-02-10', FALSE, 3);
