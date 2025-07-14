package com.bibliotheque.models;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;


@Entity
@Table(name="Utilisateur")
public class Utilisateur {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="id_utilisateur")
    private Integer idUtilisateur;

    @Column(name="nom")
    private String nom;

    @Column(name="email")
    private String email;

    @Column(name="mot_de_passe")
    private String motDePasse;

    @Column(name="telephone")
    private String telephone;

    @Column(name="adresse")
    private String adresse;

    @Column(name="date_inscription", updatable = false, insertable = false)
    private Date dateInscription;

    @Column(name="date_naissance")
    private Date dateNaissance;

    @ManyToOne
    @JoinColumn(name="id_role")
    private Role role;

    @ManyToOne
    @JoinColumn(name="id_type_utilisateur")
    private TypeUtilisateur typeUtilisateur;

    public TypeUtilisateur getTypeUtilisateur() {
        return typeUtilisateur;
    }

    public void setTypeUtilisateur(TypeUtilisateur TypeUtilisateur) {
        this.typeUtilisateur = TypeUtilisateur;
    }

    public Integer getIdUtilisateur() {
        return idUtilisateur;
    }

    public void setIdUtilisateur(Integer idUtilisateur) {
        this.idUtilisateur = idUtilisateur;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMotDePasse() {
        return motDePasse;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public Date getDateInscription() {
        return dateInscription;
    }

    public void setDateInscription(Date dateInscription) {
        this.dateInscription = dateInscription;
    }

    public Date getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(Date dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public Role getRole() {
        return this.role;
    }

    public void setRole(Role Role) {
        this.role = Role;
    }

}
