package com.winbet.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.winbet.dao.IAuthentificationJpaRepository;
import com.winbet.dao.IClientJpaRepository;
import com.winbet.dao.ISportJpaRepository;
import com.winbet.entities.Authentification;
import com.winbet.entities.Client;
import com.winbet.entities.Sport;

@Controller
@RequestMapping("/client")
public class ClientController {

    @Autowired
    private IClientJpaRepository clientRepo;

    @Autowired
    private IAuthentificationJpaRepository authentificationRepo;

    private ISportJpaRepository sportRepo;

    @RequestMapping("/goToAccueil")
    private String gotoAccueil(Model model) {
	List<Sport> listeSports = sportRepo.findAll();
	model.addAttribute("listeSports", listeSports);
	return "accueil";
    }

    @GetMapping("/goToCreer")
    public String goToCreer(Model model) {
	model.addAttribute("client", new Client());
	// model.addAttribute("roles", ERole.values());
	return "inscription";
    }

    @PostMapping("/creer")
    public String creer(@Valid @ModelAttribute(value = "client") Client client, BindingResult result, Model model) {
	// dao
	// new error
	// result.addError(error);
	if (authentificationRepo.findByEmail(client.getAuthentification().getEmail()) != null) {
	    ObjectError erreurDoublon = new ObjectError("client.authentification.email", "cet email existe déjà");
	    result.addError(erreurDoublon);
	}
	if (!result.hasErrors()) {
	    encodePassword(client.getAuthentification());
	    clientRepo.save(client);
	    model.addAttribute("client", new Client());
	    return "accueil";
	} else {
	    return "creer";
	}
    }

    private static void encodePassword(Authentification authentification) {
	String rawPassword = authentification.getMotDePasse();
	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	String encodedPassword = encoder.encode(rawPassword);
	authentification.setMotDePasse(encodedPassword);
    }
}
