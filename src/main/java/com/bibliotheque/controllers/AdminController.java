package com.bibliotheque.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bibliotheque.models.Livre;
import com.bibliotheque.services.ExemplaireService;
import com.bibliotheque.services.LivreService;
import com.bibliotheque.models.*;
import com.bibliotheque.services.*;
import com.bibliotheque.services.TypePretService;

import com.bibliotheque.services.UtilisateurService;

import com.bibliotheque.models.Utilisateur;

import com.bibliotheque.models.Exemplaire;
import com.bibliotheque.models.TypePret;


@Controller
public class AdminController {
    @Autowired
    private UtilisateurService utilisateurService;
    @Autowired
    private LivreService livreService;
    @Autowired
    private ExemplaireService exemplaireService;
    @Autowired
    private TypePretService typePretService;
    @Autowired
    private AdherentService adherentService;

    @GetMapping("/bibliothecaire/home")
    public String home(Model model){
        model.addAttribute("livres", livreService.findAll());
        model.addAttribute("exemplaires",exemplaireService.findAll());
        return "bibliothecaire/home";
    }

      @GetMapping("/bibliothecaire/pret")
    public String demandePret(@RequestParam("idLivre") Integer idLivre,@RequestParam("idExemplaire") Integer idExemplaire,Model model){
       List<TypePret> typePrets = typePretService.findAll();
       List<Utilisateur> utilisateurs = utilisateurService.findAll();
       List<Adherent> adherents = adherentService.findAll();

       Optional<Livre> livre = livreService.findById(idLivre);
       Optional<Exemplaire> exemplaire = exemplaireService.findById(idExemplaire);

       if (livre.isPresent() && exemplaire.isPresent()) {
         model.addAttribute("livre",livre.get());
         model.addAttribute("exemplaire",exemplaire.get());
         model.addAttribute("utilisateurs",utilisateurs);
         model.addAttribute("adherents", adherents);
       }

       model.addAttribute("types",typePrets);

       return "bibliothecaire/pret";
    }

    @PostMapping("/bibliothecaire/insertPret")
    public String insertPret(@RequestParam("id_adherent") Integer id_adherent){

    }
}
