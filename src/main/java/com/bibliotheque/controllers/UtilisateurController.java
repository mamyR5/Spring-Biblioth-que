package com.bibliotheque.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.bibliotheque.services.*;
import org.springframework.beans.factory.annotation.Autowired;

import com.bibliotheque.services.*;


@Controller
public class UtilisateurController {
    @Autowired
    private RoleService roleService;
    @Autowired
    private UtilisateurService utilisateurService;

    @GetMapping("/user/inscription")
    public String inscription(Model model){
        model.addAttribute("roles",roleService.findAll());
        return "inscription";
    }

    @PostMapping("/user/insert")
    public String insertUser(){
        
    }
    
}
