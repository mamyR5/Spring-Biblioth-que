package com.bibliotheque.repositories;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.data.repository.query.Param; // Import manquant


import com.bibliotheque.models.Utilisateur;


@Repository
public interface UtilisateurRepository extends JpaRepository<Utilisateur, Integer>{
    @Query(value="SELECT * FROM Utilisateur WHERE Email=:email AND MotDePasse=:motDePasse",nativeQuery=true)
    Optional<Utilisateur> authentificationLogin(@Param("email") String email,@Param("motDePasse") String motDePasse);


}
