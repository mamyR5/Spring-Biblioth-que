package com.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.models.Livre;

@Repository
public interface LivreRepository extends JpaRepository<Livre, Integer>{
    
}
