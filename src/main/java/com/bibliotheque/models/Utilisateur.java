package com.bibliotheque.models;

import javax.annotation.processing.Generated;

import jakarta.persistence.*;

@Entity
public class Utilisateur {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name="idutilisateur")
    private Integer idUtilisateur;

    



}
