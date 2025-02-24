package com.fstTanger.core.services.impl;

import com.fstTanger.core.bo.Enseignant;
import com.fstTanger.core.dao.EnseignantRepository;
import com.fstTanger.core.services.IEnseignantService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class EnseignantServiceImpl implements IEnseignantService {

    private final EnseignantRepository enseignantRepository;

    @Autowired
    public EnseignantServiceImpl(EnseignantRepository enseignantRepository) {
        this.enseignantRepository = enseignantRepository;
    }

    @Override
    public void addEnseignant(Enseignant enseignant) {
        if (enseignant != null) {
            enseignantRepository.save(enseignant);  // Ajouter ou mettre à jour un enseignant
        } else {
            throw new IllegalArgumentException("Enseignant cannot be null");
        }
    }

    @Override
    public void updateEnseignant(Enseignant enseignant) {
        if (enseignant != null && enseignant.getIdPersonne() != null && enseignantRepository.existsById(enseignant.getIdPersonne())) {
            enseignantRepository.save(enseignant);  // Mise à jour de l'enseignant
        } else {
            throw new IllegalArgumentException("Invalid enseignant or id");
        }
    }

    @Override
    public void deleteEnseignant(Long id) {
        if (id != null && enseignantRepository.existsById(id)) {
            enseignantRepository.deleteById(id);  // Suppression de l'enseignant par ID
        } else {
            throw new IllegalArgumentException("Enseignant not found with id: " + id);
        }
    }

    @Override
    public List<Enseignant> getAllEnseignants() {
        return enseignantRepository.findAll();  // Récupérer tous les enseignants
    }

    @Override
    public Enseignant getEnseignantById(Long id) {
        Optional<Enseignant> enseignantOptional = enseignantRepository.findById(id);
        if (enseignantOptional.isPresent()) {
            return enseignantOptional.get();  // Retourner l'enseignant si trouvé
        } else {
            throw new IllegalArgumentException("Enseignant not found with id: " + id);  // Gestion d'erreur si l'enseignant n'existe pas
        }
    }
}
