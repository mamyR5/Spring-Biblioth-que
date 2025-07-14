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
    @Column(name="id_Type_Adherent")
    private Integer idTypeAdherent;

    @Column(name="Nom")
    private String nom;

    @Column(name="quota")
    private Integer quota;

    @Column(name="nb_jour_pret")
    private Integer NbJourPret;

    @Column(name="nb_jour_penalite")
    private Integer NbJourPenalite;


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

    public Integer getQuota() {
        return quota;
    }

    public void setQuota(Integer quota) {
        this.quota = quota;
    }

    public Integer getNbJourPret() {
        return NbJourPret;
    }

    public void setNbJourPret(Integer NbJourPret) {
        this.NbJourPret = NbJourPret;
    }

    public Integer getNbJourPenalite() {
        return NbJourPenalite;
    }

    public void setNbJourPenalite(Integer NbJourPenalite) {
        this.NbJourPenalite = NbJourPenalite;
    }

    

    
}
