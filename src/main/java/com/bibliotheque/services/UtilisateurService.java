package com.bibliotheque.services;

import com.bibliotheque.repositories.*;

import java.util.Optional;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bibliotheque.models.Utilisateur;

@Service
public class UtilisateurService {
    private final UtilisateurRepository utilisateurRepository;

    @Autowired
    public UtilisateurService(UtilisateurRepository uia){
        this.utilisateurRepository = uia;
    }

    public Optional<Utilisateur> login(String email,String pwd){
        return this.utilisateurRepository.authentificationLogin(email, pwd);
    }


    public void inscription(Utilisateur user){
        this.utilisateurRepository.save(user);
    }

    




}
