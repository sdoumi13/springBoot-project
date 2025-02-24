package com.fstTanger.core.services.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fstTanger.core.services.ISalleService;

import com.fstTanger.core.dao.ISalleRepository;
import com.fstTanger.core.bo.Salle;

@Service
@Transactional
public class SalleServiceImpl implements ISalleService{
	
	
	@Autowired
    private ISalleRepository salleRepository;

    @Override
	public void updateSalle(Salle salle) {
    	salleRepository.save(salle);
		
		
	}

	@Override
    public void addSalle(Salle salle) {
        salleRepository.save(salle);
    }

    @Override
    public void deleteSalle(Long id) {
        salleRepository.deleteById(id);
    }

    @Override
    public Salle getSalleById(Long id) {
        return salleRepository.findById(id).orElse(null);
    }

    @Override
    public List<Salle> getAllSalles() {
        return salleRepository.findAll();
    }
	

}
