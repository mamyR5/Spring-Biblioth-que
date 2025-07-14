package com.bibliotheque.models;

import jakarta.persistence.*;
import java.sql.Date;
import com.bibliotheque.models.Utilisateur;

@Entity
@Table(name="Bibliothecaire")
public class Bibliothecaire {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id_Bibliothecaire")
    private Integer idBibliothecaire;

    @Column(name="Date_Embauche", updatable = false, insertable = false)
    private Date dateEmbauche;

    @OneToOne
    @JoinColumn(name="id_Utilisateur")
    private Utilisateur utilisateur;

    public Integer getIdBibliothecaire() {
        return idBibliothecaire;
    }

    public void setIdBibliothecaire(Integer idBibliothecaire) {
        this.idBibliothecaire = idBibliothecaire;
    }

    public Date getDateEmbauche() {
        return dateEmbauche;
    }

    public void setDateEmbauche(Date dateEmbauche) {
        this.dateEmbauche = dateEmbauche;
    }

    public Utilisateur getUtilisateur() {
        return utilisateur;
    }

    public void setUtilisateur(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }

    

}
