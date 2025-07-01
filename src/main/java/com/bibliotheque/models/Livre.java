package com.bibliotheque.models;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import com.bibliotheque.models.*;
import jakarta.persistence.*;

@Entity
@Table(name="Livre")
public class Livre{
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="idlivre")
    Integer idlivre;
    @Column(name="titre")
    String titre;
    @Column(name="datesortie")
    Date datesortie;
    @Column(name="edition")
    String edition;
    @Column(name="nombreexemplaire")
    Integer nbExemplaire;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)  // un livre a obligatoirement un auteur
    @JoinColumn(name = "idcategorie", nullable = false)    
    private Categorie categorie;

    // Suppression du champ idauteur int, remplacé par la relation ManyToOne
    @ManyToOne(fetch = FetchType.LAZY, optional = false)  // un livre a obligatoirement un auteur
    @JoinColumn(name = "idauteur", nullable = false)
    private Auteur auteur;

    public Integer getIdlivre() {
        return idlivre;
    }

    public void setIdlivre(Integer idlivre) {
        this.idlivre = idlivre;
    }

    public String getTitre() {
        return titre.replaceAll("‚", "é");
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public Date getDatesortie() {
        return datesortie;
    }

    public void setDatesortie(Date datesortie) {
        this.datesortie = datesortie;
    }

    public String getEdition() {
        return edition;
    }

    public void setEdition(String edition) {
        this.edition = edition;
    }

    public Integer getNbExemplaire() {
        return nbExemplaire;
    }

    public void setNbExemplaire(Integer nbExemplaire) {
        this.nbExemplaire = nbExemplaire;
    }



    public Auteur getAuteur() {
        return auteur;
    }

    public void setAuteur(Auteur auteur) {
        this.auteur = auteur;
    }

    public Categorie getCategorie() {
        return categorie;
    }

    public void setCategorie(Categorie categorie) {
        this.categorie = categorie;
    }

}