package com.bibliotheque.services;

import java.util.List;
import java.util.Optional;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bibliotheque.models.Exemplaire;
import com.bibliotheque.repositories.ExemplaireRepository;

@Service
public class ExemplaireService {
    private final ExemplaireRepository exemplaireRepository;

    @Autowired
    public ExemplaireService(ExemplaireRepository exemplaireRepository1)
    {
        this.exemplaireRepository = exemplaireRepository1;
    }

    public List<Exemplaire> findAll(){
        return this.exemplaireRepository.findAll();
    }

    public List<Exemplaire> findByIdlivre(Integer id){
        return this.exemplaireRepository.findByIdlivre(id);
    }

    public Optional<Exemplaire> findById(Integer id){
        return this.exemplaireRepository.findById(id);
    }



}
