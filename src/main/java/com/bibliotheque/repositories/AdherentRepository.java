package com.bibliotheque.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.Query; // Import manquant
import org.springframework.data.repository.query.Param; // Import manquant
import com.bibliotheque.models.*;
import com.bibliotheque.models.Adherent;


public interface AdherentRepository extends JpaRepository<Adherent, Integer>{
    
}
