package com.bibliotheque.models;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
@Entity
@Table(name="Auteur")
public class Auteur {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="idAuteur")
    private Integer idAuteur;
    @Column(name="Nom")
    private String nom;

    public Integer getIdAuteur() {
        return idAuteur;
    }

    public void setIdAuteur(Integer IdAuteur) {
        this.idAuteur = IdAuteur;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
}
