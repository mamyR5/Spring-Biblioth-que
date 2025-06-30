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
   NbJourPret INTEGER NOT NULL,
   Quota INTEGER NOT NULL,
   NbJourPenalite VARCHAR(50) ,
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

CREATE TABLE Pret(
   idPret SERIAL,
   DatePret DATE NOT NULL,
   DatePrevue DATE,
   idTypePret INTEGER NOT NULL,
   idAdherent INTEGER NOT NULL,
   PRIMARY KEY(idPret),
   FOREIGN KEY(idTypePret) REFERENCES TypePret(idTypePret),
   FOREIGN KEY(idAdherent) REFERENCES Adherent(idUtilisateur)
);

CREATE TABLE Reprise(
   idReprise SERIAL,
   DateReprise DATE NOT NULL,
   idPret INTEGER NOT NULL,
   PRIMARY KEY(idReprise),
   FOREIGN KEY(idPret) REFERENCES Pret(idPret)
);

CREATE TABLE Exemplaire(
   idExemplaire SERIAL,
   NumeroExemplaire INTEGER NOT NULL,
   idLivre INTEGER NOT NULL,
   PRIMARY KEY(idExemplaire),
   FOREIGN KEY(idLivre) REFERENCES Livre(idLivre)
);

CREATE TABLE Reservation(
   idReservation SERIAL,
   Statut VARCHAR(50)  NOT NULL,
   DateReservation DATE NOT NULL,
   idAdherent INTEGER NOT NULL,
   idExemplaire INTEGER NOT NULL,
   PRIMARY KEY(idReservation),
   FOREIGN KEY(idAdherent) REFERENCES Adherent(idUtilisateur),
   FOREIGN KEY(idExemplaire) REFERENCES Exemplaire(idExemplaire)
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

CREATE TABLE PretExemplaire(
   idPret INTEGER,
   idExemplaire INTEGER,
   PRIMARY KEY(idPret, idExemplaire),
   FOREIGN KEY(idPret) REFERENCES Pret(idPret),
   FOREIGN KEY(idExemplaire) REFERENCES Exemplaire(idExemplaire)
);

CREATE TABLE RepriseExemplaire(
   idReprise INTEGER,
   idExemplaire INTEGER,
   PRIMARY KEY(idReprise, idExemplaire),
   FOREIGN KEY(idReprise) REFERENCES Reprise(idReprise),
   FOREIGN KEY(idExemplaire) REFERENCES Exemplaire(idExemplaire)
);
