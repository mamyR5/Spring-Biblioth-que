package com.bibliotheque.models;

import jakarta.persistence.*;

@Entity
@Table(name="Categorie")
public class Categorie {
    
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="idcategorie")
    Integer idlivre;
    @Column(name="nom")
    String nom;

    public Integer getIdlivre() {
        return idlivre;
    }

    public void setIdlivre(Integer idlivre) {
        this.idlivre = idlivre;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
}
