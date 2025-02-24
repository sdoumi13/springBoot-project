package com.fstTanger.core.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fstTanger.core.bo.Groupe;

public interface GroupeRepository extends JpaRepository<Groupe, Long> {
	
	Groupe findByNomGroupe(String nomGroupe);

}
