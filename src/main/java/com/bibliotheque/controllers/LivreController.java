package com.bibliotheque.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bibliotheque.services.ExemplaireService;
import com.bibliotheque.services.LivreService;

@Controller
public class LivreController {

    @Autowired
    private LivreService livreService;
    @Autowired
    private ExemplaireService exemplaireService;

    // Cette méthode répond à la racine "/livres" (sans slash à la fin)
    @GetMapping("/livre")
    public String listLivre(Model model) {
        model.addAttribute("livres", livreService.findAll());
        model.addAttribute("exemplaires",exemplaireService.findAll());
        return "page"; // retour de la vue src/main/webapp/WEB-INF/views/index.jsp
    }
}
