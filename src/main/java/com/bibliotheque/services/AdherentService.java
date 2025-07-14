package com.bibliotheque.services;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bibliotheque.models.Adherent;
import com.bibliotheque.repositories.AdherentRepository;

@Service
public class AdherentService {
    private final AdherentRepository adherentRepository;

    @Autowired
    public AdherentService(AdherentRepository repository){
        this.adherentRepository = repository;
    }

    public void save(Adherent adherent){
        this.adherentRepository.save(adherent);
    }

    public List<Adherent> findAll(){
        return this.adherentRepository.findAll();
    }
}
