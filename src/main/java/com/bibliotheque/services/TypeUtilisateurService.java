package com.bibliotheque.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bibliotheque.models.TypeUtilisateur;
import com.bibliotheque.repositories.*;

@Service
public class TypeUtilisateurService {
    private final TypeUtilisateurRepository repository;

    @Autowired
    public TypeUtilisateurService(TypeUtilisateurRepository repo){
        this.repository = repo;
    }

    public List<TypeUtilisateur> findAll(){
        return this.repository.findAll();
    }

    public Optional<TypeUtilisateur> findById(Integer id){
        return this.repository.findById(id); 
    }

}
