package com.bibliotheque.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bibliotheque.models.Bibliothecaire;

@Repository
public interface  BibliothecaireRepository extends JpaRepository<Bibliothecaire, Integer>{
    
}
