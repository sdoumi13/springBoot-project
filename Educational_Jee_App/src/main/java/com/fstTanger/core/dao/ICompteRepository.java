package com.fstTanger.core.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.fstTanger.core.bo.Compte;

public interface ICompteRepository extends JpaRepository<Compte, Long> {
	public Compte getCompteByLogin(String username);

    boolean existsByProprietaireIdPersonne(Long personId);
    Compte findByLogin(String login);
}
