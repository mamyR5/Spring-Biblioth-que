package com.bibliotheque.controllers;

import java.sql.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bibliotheque.models.Adherent;
import com.bibliotheque.models.Bibliothecaire;
import com.bibliotheque.models.Role;
import com.bibliotheque.models.TypeAdherent;
import com.bibliotheque.models.TypeUtilisateur;
import com.bibliotheque.models.Utilisateur;
import com.bibliotheque.services.AdherentService;
import com.bibliotheque.services.BibiliothecaireService;
import com.bibliotheque.services.ExemplaireService;
import com.bibliotheque.services.LivreService;
import com.bibliotheque.services.RoleService;
import com.bibliotheque.services.TypeAdherentService;
import com.bibliotheque.services.TypePretService;
import com.bibliotheque.services.TypeUtilisateurService;
import com.bibliotheque.services.UtilisateurService;

import jakarta.servlet.http.HttpSession;

@Controller
public class UtilisateurController {
    @Autowired
    private RoleService roleService;
    @Autowired
    private UtilisateurService utilisateurService;
    @Autowired
    private TypeUtilisateurService typeUtilisateurService;
    @Autowired
    private TypeAdherentService typeAdherentService;
    @Autowired 
    private AdherentService adherentService;
    @Autowired 
    private BibiliothecaireService bibliothecaireService;
    @Autowired
    private LivreService livreService;
    @Autowired
    private ExemplaireService exemplaireService;
    @Autowired
    private TypePretService typePretService;



    @PostMapping("/user/login")
    public String login(@RequestParam("Email") String email,
                        @RequestParam("MotDePasse") String motDePasse, 
                        HttpSession session,
                        Model model){
        Optional<Utilisateur> user = this.utilisateurService.login(email, motDePasse);
        if (user.isPresent()) {
            session.setAttribute("Utilisateur", user.get());

            if (user.get().getTypeUtilisateur().getIdTypeUtilisateur()!=1) {
                return "redirect:/bibliothecaire/home";                
            }else{
                return "redirect:/user/home";
            }
            
        }else{
            session.setMaxInactiveInterval(60); // 60 secondes = 1 minute
            session.setAttribute("messageErreur","Veuillez vérifier les données entrés dans les champ.");
            return "login";
        }

    }

    @GetMapping("/user/inscription")
    public String inscription(Model model){
        model.addAttribute("typesUtilisateurs",typeUtilisateurService.findAll());
        model.addAttribute("typesAdherents",typeAdherentService.findAll());
        return "inscription";
    }

    @PostMapping("/user/insert")
    public String insertInscription(@RequestParam("Nom") String nom,
                                    @RequestParam("Email") String email,
                                    @RequestParam("Telephone") String telephone,
                                    @RequestParam("Adresse") String adresse,
                                    @RequestParam("idTypeUtilisateur") String idTypeUtilisateur,
                                    @RequestParam("idTypeAdherent") String idTypeAdherent,
                                    @RequestParam("MotDePasse") String motDePasse,
                                    @RequestParam("DateNaissance") String dateNaissance,
                                    Model model){
        //System.out.println("idTypeUtilisateur = " + idTypeUtilisateur);

        Utilisateur u = new Utilisateur();
        u.setNom(nom);
        u.setEmail(email);
        u.setMotDePasse(motDePasse);
        u.setTelephone(telephone);
        u.setAdresse(adresse);
        u.setDateNaissance(Date.valueOf(dateNaissance));
        Optional<Role> role = this.roleService.findById(2);
        Optional<TypeUtilisateur> typeUser = this.typeUtilisateurService.findById(Integer.parseInt(idTypeUtilisateur));

        if(role.isPresent() && typeUser.isPresent()){
            u.setRole(role.get());
            u.setTypeUtilisateur(typeUser.get());            
            this.utilisateurService.inscription(u);
        }
      
        
        if (!"1".equals(idTypeUtilisateur)) {
            //Makato raha toa ka idTypeUtilisateur tsy 1 fa 2 , izany hoe bibliothécaire 
            Bibliothecaire b = new Bibliothecaire();
            b.setUtilisateur(u);
            this.bibliothecaireService.save(b);

            return "redirect:/bibliothecaire/home";
        }else if("1".equals(idTypeUtilisateur)) {
            //Makato raha toa ka idTypeUtilisateur = 1  , izany hoe adhérent 
            Adherent a = new Adherent();
            a.setActif(true);
            a.setUtilisateur(u);
            Optional<TypeAdherent> typeAdherent = this.typeAdherentService.findById(Integer.parseInt(idTypeAdherent));
            if (typeAdherent.isPresent()) {
                a.setTypeAdherent(typeAdherent.get());                
                this.adherentService.save(a);
            }
            return "redirect:/user/home";
        }

        return "redirect:/login";
    }



    
    // Cette méthode répond à la racine "/livres" (sans slash à la fin)
    @GetMapping("/user/home")
    public String listLivre(Model model) {
        model.addAttribute("livres", livreService.findAll());
        model.addAttribute("exemplaires",exemplaireService.findAll());
        return "adherent/home"; // retour de la vue src/main/webapp/WEB-INF/views/index.jsp
    }


  
    
}
