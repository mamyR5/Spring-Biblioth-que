CREATE DATABASE bibliotheque;
\c bibliotheque;

CREATE TABLE Auteur(
   id_Auteur SERIAL,
   Nom VARCHAR(100)  NOT NULL,
   PRIMARY KEY(id_Auteur)
);

CREATE TABLE Categorie(
   id_Categorie SERIAL,
   Nom VARCHAR(100)  NOT NULL,
   PRIMARY KEY(id_Categorie)
);

CREATE TABLE Role(
   id_Role SERIAL,
   Nom VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_Role)
);

CREATE TABLE TypeAdherent(
   id_Type_Adherent SERIAL,
   Nom VARCHAR(50)  NOT NULL,
   Quota INTEGER NOT NULL,
   Nb_Jour_Pret INTEGER NOT NULL,
   Nb_Jour_Penalite INTEGER NOT NULL,
   PRIMARY KEY(id_Type_Adherent)
);


CREATE TABLE TypePret(
   id_Type_Pret SERIAL,
   Nom VARCHAR(100)  NOT NULL,
   PRIMARY KEY(id_Type_Pret)
);

CREATE TABLE TypeMouvement(
   id_Type_Mouvement SERIAL,
   Nom VARCHAR(100)  NOT NULL,
   PRIMARY KEY(id_Type_Mouvement)
);

CREATE TABLE JourFerie(
   id_Jour_Ferie SERIAL,
   Date_Ferie DATE NOT NULL,
   Nom VARCHAR(100)  NOT NULL,
   PRIMARY KEY(id_Jour_Ferie)
);

CREATE TABLE Validation(
   id_Validation SERIAL,
   Nom CHAR(50)  NOT NULL,
   PRIMARY KEY(id_Validation)
);



CREATE TABLE Restriction(
   id_Restriction SERIAL,
   Age INTEGER NOT NULL,
   PRIMARY KEY(id_Restriction)
);


CREATE TABLE Livre(
   id_Livre SERIAL,
   Titre VARCHAR(100)  NOT NULL,
   Date_Sortie DATE NOT NULL,
   Edition VARCHAR(50) ,
   Nombre_Exemplaire INTEGER NOT NULL,
   id_Restriction INTEGER NOT NULL,
   id_Categorie INTEGER NOT NULL,
   id_Auteur INTEGER NOT NULL,
   PRIMARY KEY(id_Livre),
   FOREIGN KEY(id_Restriction) REFERENCES Restriction(id_Restriction),
   FOREIGN KEY(id_Categorie) REFERENCES Categorie(id_Categorie),
   FOREIGN KEY(id_Auteur) REFERENCES Auteur(id_Auteur)
);

CREATE TABLE TypeUtilisateur(
   id_Type_Utilisateur SERIAL,
   Nom CHAR(50)  NOT NULL,
   PRIMARY KEY(id_Type_Utilisateur)
);



CREATE TABLE Utilisateur(
   id_Utilisateur SERIAL,
   Nom VARCHAR(100)  NOT NULL,
   Email VARCHAR(100)  NOT NULL,
   Mot_De_Passe VARCHAR(100)  NOT NULL,
   Telephone VARCHAR(50)  NOT NULL,
   Adresse VARCHAR(50)  NOT NULL,
   Date_Inscription DATE NOT NULL,
   Date_Naissance DATE NOT NULL,
   id_Type_Utilisateur INTEGER,
   id_Role INTEGER NOT NULL,
   PRIMARY KEY(id_Utilisateur),
   FOREIGN KEY(id_Role) REFERENCES Role(id_Role),
   FOREIGN KEY(id_Type_Utilisateur) REFERENCES TypeUtilisateur(id_Type_Utilisateur)
);

ALTER TABLE Utilisateur
ALTER COLUMN Date_Inscription SET DEFAULT NOW();


CREATE TABLE Bibliothecaire(
   id_Bibliothecaire SERIAL,
   Date_Embauche DATE NOT NULL,
   id_Utilisateur INTEGER NOT NULL,
   PRIMARY KEY(id_Bibliothecaire),
   FOREIGN KEY(id_Utilisateur) REFERENCES Utilisateur(id_Utilisateur)
);

ALTER TABLE Bibliothecaire
ALTER COLUMN Date_Embauche SET DEFAULT NOW();


CREATE TABLE Adherent(
      id_Adherent SERIAL,
      Date_Adhesion DATE NOT NULL,
      Actif BOOLEAN NOT NULL,
      id_Utilisateur INTEGER NOT NULL,
      id_Type_Adherent INTEGER NOT NULL,
      PRIMARY KEY(id_Adherent),
      FOREIGN KEY(id_Utilisateur) REFERENCES Utilisateur(id_Utilisateur),
      FOREIGN KEY(id_Type_Adherent) REFERENCES TypeAdherent(id_Type_Adherent)
);


ALTER TABLE Adherent
ALTER COLUMN Date_Adhesion SET DEFAULT NOW();


CREATE TABLE Exemplaire(
   id_Exemplaire SERIAL,
   Numero_Exemplaire INTEGER NOT NULL,
   Date_Ajout DATE NOT NULL,
   status VARCHAR(50) ,
   id_Livre INTEGER NOT NULL,
   PRIMARY KEY(id_Exemplaire),
   FOREIGN KEY(id_Livre) REFERENCES Livre(id_Livre)
);

CREATE TABLE Reservation(
   id_Reservation SERIAL,
   Statut VARCHAR(50)  NOT NULL,
   Date_Reservation DATE NOT NULL,
   id_Validation INTEGER NOT NULL,
   id_Adherent INTEGER NOT NULL,
   id_Exemplaire INTEGER NOT NULL,
   PRIMARY KEY(id_Reservation),
   FOREIGN KEY(id_Validation) REFERENCES Validation(id_Validation),
   FOREIGN KEY(id_Adherent) REFERENCES Adherent(id_Adherent),
   FOREIGN KEY(id_Exemplaire) REFERENCES Exemplaire(id_Exemplaire)
);

CREATE TABLE Penalite(
   id_Penalite SERIAL,
   Date_Debut DATE NOT NULL,
   Date_Fin DATE NOT NULL,
   id_Adherent INTEGER NOT NULL,
   PRIMARY KEY(id_Penalite),
   FOREIGN KEY(id_Adherent) REFERENCES Adherent(id_Adherent)
);



CREATE TABLE Abonnement(
   id_Abonnement SERIAL,
   Date_Debut DATE NOT NULL,
   Date_Fin DATE NOT NULL,
   id_Adherent INTEGER NOT NULL,
   PRIMARY KEY(id_Abonnement),
   FOREIGN KEY(id_Adherent) REFERENCES Adherent(id_Adherent)
);

CREATE TABLE Pret(
   id_Pret SERIAL,
   Date_Pret DATE NOT NULL,
   Date_Prevue DATE,
   id_Exemplaire INTEGER NOT NULL,
   id_Type_Pret INTEGER NOT NULL,
   id_Adherent INTEGER NOT NULL,
   PRIMARY KEY(id_Pret),
   FOREIGN KEY(id_Exemplaire) REFERENCES Exemplaire(id_Exemplaire),
   FOREIGN KEY(id_Type_Pret) REFERENCES TypePret(id_Type_Pret),
   FOREIGN KEY(id_Adherent) REFERENCES Adherent(id_Adherent)
);

CREATE TABLE Reprise(
   id_Reprise SERIAL,
   Date_Reprise DATE NOT NULL,
   id_Exemplaire INTEGER NOT NULL,
   id_Pret INTEGER NOT NULL,
   PRIMARY KEY(id_Reprise),
   FOREIGN KEY(id_Exemplaire) REFERENCES Exemplaire(id_Exemplaire),
   FOREIGN KEY(id_Pret) REFERENCES Pret(id_Pret)
);

CREATE TABLE ProlongementPret(
   id_Prolongement_Pret SERIAL,
   Date_Prolongement DATE NOT NULL,
   Date_Fin DATE NOT NULL,
   id_Validation INTEGER NOT NULL,
   id_Pret INTEGER NOT NULL,
   PRIMARY KEY(id_Prolongement_Pret),
   UNIQUE(id_Pret),
   FOREIGN KEY(id_Validation) REFERENCES Validation(id_Validation),
   FOREIGN KEY(id_Pret) REFERENCES Pret(id_Pret)
);

CREATE TABLE MouvementExemplaire(
   id_Mouvement_Exemplaire SERIAL,
   Nombre INTEGER NOT NULL,
   Date_Mouvement DATE NOT NULL,
   id_Pret INTEGER NOT NULL,
   id_Type_Mouvement INTEGER NOT NULL,
   id_Exemplaire INTEGER NOT NULL,
   PRIMARY KEY(id_Mouvement_Exemplaire),
   FOREIGN KEY(id_Pret) REFERENCES Pret(id_Pret),
   FOREIGN KEY(id_Type_Mouvement) REFERENCES TypeMouvement(id_Type_Mouvement),
   FOREIGN KEY(id_Exemplaire) REFERENCES Exemplaire(id_Exemplaire)
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

INSERT INTO TypeAdherent (Nom, Nb_Jour_Pret, Quota,Nb_Jour_Penalite) VALUES
('Etudiant', 15, 3,10),
('Professeur', 30, 5,5),
('Anonyme', 7, 1,15);

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

INSERT INTO JourFerie (Date_Ferie, Nom) VALUES
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


INSERT INTO TypeUtilisateur VALUES 
(default,'Adhérent'),
(default,'Bibliothécaire');



INSERT INTO Utilisateur (Nom, Email, Mot_De_Passe, Telephone, Adresse, Date_Inscription, Date_Naissance,id_Type_Utilisateur, id_Role) VALUES
-- Admin
('Admin Principal', 'admin@biblio.com', 'admin', '0321234567', 'Antananarivo', '2025-01-01', '1990-05-10', NULL,1),

-- Bibliothécaire
('Claire Bibliothécaire', 'claire@biblio.com', 'clairepwd', '0331122334', 'Fianarantsoa', '2025-03-10', '1988-04-15',2, 2),

-- Adhérents
('Jean Etudiant', 'jean@biblio.com', 'jeanpwd', '0345566778', 'Toamasina', '2025-02-01', '2001-07-20', 1,2),
('Lova Professeur', 'lova@biblio.com', 'lovapwd', '0329876543', 'Mahajanga', '2025-02-05', '1980-03-08',1, 2),
('Anjara Lecteur', 'anjara@biblio.com', 'anjara123', '0334455667', 'Toliara', '2025-02-10', '1995-11-11',1, 2);


INSERT INTO Bibliothecaire (id_Utilisateur, Date_Embauche) VALUES
(2, '2025-03-11');

INSERT INTO Adherent (id_Utilisateur, Date_Adhesion, Actif, id_Type_Adherent) VALUES
(3, '2025-02-01', TRUE, 1),
(4, '2025-02-05', TRUE, 2),
(5, '2025-02-10', FALSE, 3);

INSERT INTO Restriction (Age) VALUES 
(10),  -- restriction enfant
(16),  -- ado
(18),  -- adulte
(0),   -- aucune restriction
(12);  -- pré-ado

INSERT INTO Livre (Titre, Date_Sortie, Edition, Nombre_Exemplaire, id_Restriction, id_Categorie, id_Auteur)
VALUES
('Les Misérables', '1862-01-01', 'Hachette', 3, 3, 1, 1),
('La Théorie de la Relativité', '1916-11-25', 'Springer',2, 5, 2, 2),
('La République', '0380-01-01', 'Belles Lettres', 4, 2, 3, 3),
('Le Monde comme volonté et comme représentation', '1818-01-01', 'PUF', 2, 4, 3, 4),
('1984', '1949-06-08', 'Secker & Warburg', 5, 3, 4, 5);


INSERT INTO Exemplaire (Numero_Exemplaire, Date_Ajout, status, id_Livre) VALUES
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



