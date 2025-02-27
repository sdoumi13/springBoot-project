package com.fstTanger.core.dao;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fstTanger.core.bo.Surveillance;
import com.fstTanger.core.bo.Salle;
import com.fstTanger.core.bo.Enseignant;
import com.fstTanger.core.bo.CadreAdministrateur;

@Repository
public interface ISurveillanceRepository extends JpaRepository<Surveillance, Long> {
    List<Surveillance> findBySalleAndDateBetween(Salle salle, LocalDateTime dateDebut, LocalDateTime dateFin);
    List<Surveillance> findByProfAndDateBetween(Enseignant prof, LocalDateTime dateDebut, LocalDateTime dateFin);
    List<Surveillance> findByAdminAndDateBetween(CadreAdministrateur admin, LocalDateTime dateDebut, LocalDateTime dateFin);
    List<Surveillance> findByExamenId(Long examenId); 
    
   
    
    List<Surveillance> findByProfIdPersonne(Long idPersonne);
    List<Surveillance> findByProfIdPersonneAndDate(Long enseignantId, Date date);
    
   
}

