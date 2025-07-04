package com.bibliotheque.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="TypeAdherent")
public class TypeAdherent{
    
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="idtypeadherent")
    private Integer idTypeAdherent;

    @Column(name="nom")
    private String nom;

    public Integer getIdTypeAdherent() {
        return idTypeAdherent;
    }

    public void setIdTypeAdherent(Integer idTypeAdherent) {
        this.idTypeAdherent = idTypeAdherent;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    

    
}
