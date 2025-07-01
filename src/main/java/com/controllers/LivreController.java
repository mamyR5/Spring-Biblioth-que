package com.spring.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.services.LivreService;

@Controller
@RequestMapping("/livres")
public class LivreController {

    @Autowired
    private LivreService livreService;

    @GetMapping("/")
    public String listLivre(Model model) {
        model.addAttribute("livres", livreService.findAll());
        return "index";  // rend src/main/webapp/WEB-INF/views/index.jsp
    }
}
