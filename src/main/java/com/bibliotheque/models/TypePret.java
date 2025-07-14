package com.bibliotheque.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="TypePret")
public class TypePret {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id_Type_Pret")
    private Integer idTypePret;

    @Column(name="nom")
    private String nom;

    public Integer getIdTypePret() {
        return idTypePret;
    }

    public void setIdTypePret(Integer idTypePret) {
        this.idTypePret = idTypePret;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }
    
}
