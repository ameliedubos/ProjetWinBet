package com.winbet.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/securitycontroller")
public class SecurityController {

    @SuppressWarnings("unused")
    @GetMapping("/login")
    public String appLogin(@RequestParam(value = "error", required = false) Boolean error,
	    @RequestParam(value = "logout", required = false) Boolean logout) {
	return "login";
    }
}