package com.bibliotheque.services;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bibliotheque.models.Livre;
import com.bibliotheque.repositories.LivreRepository;

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

    public Optional<Livre> findById(Integer idLivre){
      return this.repository.findById(idLivre);
    }

    

}
