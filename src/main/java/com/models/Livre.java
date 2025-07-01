package com.models;

import jakarta.persistence.CascadeType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import java.util.List;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.sql.Date;
import java.sql.Date;
import java.sql.Date;
import java.sql.Date;
import java.sql.Date;
import java.sql.Date;

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
    @Column(name="idcategorie")
    Integer idcategorie;
    @Column(name="idauteur")
    Integer idauteur;

    public Integer getIdlivre() {
        return idlivre;
    }

    public void setIdlivre(Integer idlivre) {
        this.idlivre = idlivre;
    }

    public String getTitre() {
        return titre;
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

    public Integer getIdcategorie() {
        return idcategorie;
    }

    public void setIdcategorie(Integer idcategorie) {
        this.idcategorie = idcategorie;
    }

    public Integer getIdauteur() {
        return idauteur;
    }

    public void setIdauteur(Integer idauteur) {
        this.idauteur = idauteur;
    }

}