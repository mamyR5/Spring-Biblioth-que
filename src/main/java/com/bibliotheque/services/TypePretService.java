package com.bibliotheque.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bibliotheque.models.TypePret;
import com.bibliotheque.repositories.*;

@Service
public class TypePretService {
    private final TypePretRepository typePretRepository;

    @Autowired
    public TypePretService(TypePretRepository t){
        this.typePretRepository = t;
    }

    public List<TypePret> findAll(){
        return this.typePretRepository.findAll();
    }


}
