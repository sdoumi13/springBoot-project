package com.fstTanger.core.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.fstTanger.core.bo.ElementPedag;

@Repository
public interface ElementPedagogiqueRepository extends JpaRepository<ElementPedag, Long> {
	
}

