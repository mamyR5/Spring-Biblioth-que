package com.bibliotheque.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bibliotheque.models.TypeAdherent;
import com.bibliotheque.repositories.*;

@Service
public class TypeAdherentService {
    private final TypeAdherentRepository repository;

    @Autowired
    public TypeAdherentService(TypeAdherentRepository repo){
        this.repository = repo;
    }

    public List<TypeAdherent> findAll(){
        return this.repository.findAll();
    }

    public Optional<TypeAdherent> findById(Integer id){
        return this.repository.findById(id);
    }

}
