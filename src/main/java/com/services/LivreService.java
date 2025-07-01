package com.spring.services;

import java.util.List;

import com.models.Livre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.repositories.LivreRepository;

@Service
public class LivreService {
    private final LivreRepository repository;

    @Autowired
    public LivreService(LivreRepository repo){
        this.repository = repo;
    }

    public List<Livre> getAll(){
        return this.repository.findAll();
    }

}
