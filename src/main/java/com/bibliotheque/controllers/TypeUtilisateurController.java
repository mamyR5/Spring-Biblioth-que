package com.bibliotheque.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;

import com.bibliotheque.models.TypeUtilisateur;
import com.bibliotheque.services.TypeUtilisateurService;

@RestController
public class TypeUtilisateurController {

    @Autowired
    private TypeUtilisateurService TypeUtilisateurService;

    @GetMapping("/api/type-utilisateurs")
    public List<TypeUtilisateur> getTypes() {
        return TypeUtilisateurService.findAll();
    }
}
