package com.bibliotheque.models;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.*;
import com.bibliotheque.models.*;

@Entity
@Table(name="Adherent")
public class Adherent{

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id_Adherent")
    private Integer idAdherent;


    @OneToOne
    @JoinColumn(name="id_Utilisateur")
    private Utilisateur utilisateur;

    @Column(name="Date_Adhesion",updatable = false, insertable = false)
    private Date dateAdhesion;

    @Column(name="Actif")
    private boolean actif;

    @ManyToOne
    @JoinColumn(name="id_Type_Adherent")
    private TypeAdherent typeAdherent;

       
    public Integer getIdAdherent() {
        return idAdherent;
    }

    public void setIdAdherent(Integer idAdherent) {
        this.idAdherent = idAdherent;
    }

    public Date getDateAdhesion() {
        return dateAdhesion;
    }

    public void setDateAdhesion(Date dateAdhesion) {
        this.dateAdhesion = dateAdhesion;
    }

    public boolean isActif() {
        return actif;
    }

    public void setActif(boolean actif) {
        this.actif = actif;
    }

    public TypeAdherent getTypeAdherent() {
        return typeAdherent;
    }

    public void setTypeAdherent(TypeAdherent typeAdherent) {
        this.typeAdherent = typeAdherent;
    }

    public Utilisateur getUtilisateur() {
        return utilisateur;
    }

    public void setUtilisateur(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }

}
