package com.bibliotheque.controllers;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import jakarta.servlet.http.HttpSession;



@Controller
public class HomeController {
 @GetMapping("/")
 public String login(Model model,HttpSession session){
   session.removeAttribute("messageErreur");
    return "login";
 }   
}
