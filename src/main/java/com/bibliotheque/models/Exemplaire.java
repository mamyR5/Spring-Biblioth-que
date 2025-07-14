package com.bibliotheque.models;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="Exemplaire")
public class Exemplaire {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id_exemplaire")
    private Integer idExemplaire;
    @Column(name="numero_exemplaire")
    private Integer numeroExemplaire;
    @Column(name="date_ajout")
    private Date dateAjout;
    @Column(name="status")
    private String status;
    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="id_livre",nullable=false)
    private Livre livre;

    public Integer getIdExemplaire() {
        return this.idExemplaire;
    }

    public void setIdExemplaire(Integer idExemplaire) {
        this.idExemplaire = idExemplaire;
    }

    public Integer getNumeroExemplaire() {
        return numeroExemplaire;
    }

    public void setNumeroExemplaire(Integer numeroExemplaire) {
        this.numeroExemplaire = numeroExemplaire;
    }

    public Date getDateAjout() {
        return dateAjout;
    }

    public void setDateAjout(Date dateAjout) {
        this.dateAjout = dateAjout;
    }

    public String getStatus() {
        return status.replaceAll("‚", "é");
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Livre getLivre() {
        return livre;
    }

    public void setLivre(Livre livre) {
        this.livre = livre;
    }
}
