package com.bibliotheque.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="TypeUtilisateur")
public class TypeUtilisateur{
    
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="idtypeutilisateur")
    private Integer idTypeUtilisateur;

    @Column(name="nom")
    private String nom;

    public Integer getIdTypeUtilisateur() {
        return this.idTypeUtilisateur;
    }

    public void setIdTypeUtilisateur(Integer IdTypeUtilisateur) {
        this.idTypeUtilisateur = IdTypeUtilisateur;
    }

    public String getNom() {
        return this.nom;
    }

    public void setNom(String Nom) {
        this.nom = Nom;
    }

    

    
}
