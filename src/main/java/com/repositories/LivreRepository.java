package com.spring.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.spring.models.Livre;

@Repository
public interface LivreRepository extends JpaRepository<Livre, Integer>{
    
}
