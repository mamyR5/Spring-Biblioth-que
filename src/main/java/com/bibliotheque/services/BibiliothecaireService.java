package com.bibliotheque.services;
import org.springframework.beans.factory.annotation.Autowired;

import com.bibliotheque.repositories.BibliothecaireRepository;
import com.bibliotheque.models.Bibliothecaire;
import org.springframework.stereotype.Service;

import jakarta.persistence.*;

@Service
public class BibiliothecaireService {
    private BibliothecaireRepository bibliothecaireRepository;

    @Autowired
    public BibiliothecaireService(BibliothecaireRepository repository)
    {
        this.bibliothecaireRepository = repository;
    }

    public void save(Bibliothecaire bibliothecaire){
        this.bibliothecaireRepository.save(bibliothecaire);
    }


}
