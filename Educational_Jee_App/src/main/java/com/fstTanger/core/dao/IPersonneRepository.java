package com.fstTanger.core.dao;
import com.fstTanger.core.bo.Etudiant;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fstTanger.core.bo.Personne;

public interface IPersonneRepository extends JpaRepository<Personne, Long> {

	Personne getPersonneByCin(String cin);


}
