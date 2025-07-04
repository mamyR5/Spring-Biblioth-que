package com.bibliotheque.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.beans.factory.annotation.Autowired;

import com.bibliotheque.models.TypeAdherent;
import com.bibliotheque.services.TypeAdherentService;

@RestController
public class TypeAdherentController {

    @Autowired
    private TypeAdherentService typeAdherentService;

    @GetMapping("/api/type-adherents")
    public List<TypeAdherent> getTypes() {
        return typeAdherentService.findAll();
    }
}
