package com.spring.services;

import java.util.List;

import com.spring.models.Livre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.repositories.LivreRepository;

@Service
public class LivreService {
    private final LivreRepository repository;

    @Autowired
    public LivreService(LivreRepository repo){
        this.repository = repo;
    }

    public List<Livre> findAll(){
        return this.repository.findAll();
    }

}
