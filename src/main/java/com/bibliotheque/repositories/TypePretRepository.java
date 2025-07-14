package com.bibliotheque.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.bibliotheque.models.*;


@Repository
public interface TypePretRepository extends JpaRepository<TypePret, Integer>{
    
}
