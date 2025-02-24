package com.fstTanger.core.dao;

import com.fstTanger.core.bo.Etudiant;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.fstTanger.core.bo.Enseignant;

@Repository
public interface EnseignantRepository extends JpaRepository<Enseignant, Long> {
    interface EtudiantRepository extends JpaRepository<Etudiant, Long> {
        // Vous pouvez ajouter d'autres méthodes spécifiques si nécessaire
    }
}
