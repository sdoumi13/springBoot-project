package com.fstTanger.core.web.controllers;

import com.fstTanger.core.bo.Enseignant;
import com.fstTanger.core.services.IEnseignantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import jakarta.validation.Valid;
import org.springframework.validation.BindingResult;

import java.util.List;

@Controller
@RequestMapping("/admin/enseignant")
public class EnseignantController {

    @Autowired
    private IEnseignantService enseignantService;

    // Afficher la liste des enseignants
    @GetMapping("/manageEnseignants")
    public String manageEnseignants(Model model) {
        List<Enseignant> enseignants = enseignantService.getAllEnseignants();
        model.addAttribute("enseignants", enseignants);
        return "admin/enseignant/listeEnseignants";
    }

    // Afficher le formulaire d'ajout d'enseignant
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("enseignant", new Enseignant());
        return "admin/enseignant/formEnseignant";
    }

    // Ajouter un nouvel enseignant
    @PostMapping("/add")
    public String addEnseignant(@Valid @ModelAttribute("enseignant") Enseignant enseignant,
                                BindingResult result,
                                Model model) {
        if (result.hasErrors()) {
            return "admin/enseignant/formEnseignant";
        }
        enseignantService.addEnseignant(enseignant);
        return "redirect:/admin/enseignant/manageEnseignants";
    }

    // Afficher le formulaire de modification d'un enseignant
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Enseignant enseignant = enseignantService.getEnseignantById(id);
        if (enseignant == null) {
            return "redirect:/admin/enseignant/manageEnseignants";
        }
        model.addAttribute("enseignant", enseignant);
        return "admin/enseignant/formEnseignant";
    }

    // Modifier un enseignant
    @PostMapping("/edit/{id}")
    public String updateEnseignant(@PathVariable("id") Long id,
                                   @Valid @ModelAttribute("enseignant") Enseignant enseignant,
                                   BindingResult result,
                                   Model model) {
        if (result.hasErrors()) {
            return "admin/enseignant/formEnseignant";
        }
        enseignant.setIdPersonne(id);
        enseignantService.updateEnseignant(enseignant);
        return "redirect:/admin/enseignant/manageEnseignants";
    }

    // Supprimer un enseignant
    @GetMapping("/delete/{id}")
    public String deleteEnseignant(@PathVariable("id") Long id) {
        enseignantService.deleteEnseignant(id);
        return "redirect:/admin/enseignant/manageEnseignants";
    }
}
