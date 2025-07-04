package com.bibliotheque.models;

import jakarta.persistence.*;
import java.sql.Date;

@Entity
@Table(name="Exemplaire")
public class Exemplaire {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="idExemplaire")
    private Integer idexemplaire;
    @Column(name="NumeroExemplaire  ")
    private Integer numeroExemplaire;
    @Column(name="DateAjout ")
    private Date dateAjout;
    @Column(name="status ")
    private String status;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name="idLivre",nullable=false)
    private Livre livre;

    public Integer getIdexemplaire() {
        return idexemplaire;
    }

    public void setIdexemplaire(Integer idexemplaire) {
        this.idexemplaire = idexemplaire;
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
        return status;
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
