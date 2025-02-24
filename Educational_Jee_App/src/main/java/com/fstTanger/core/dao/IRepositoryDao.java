package com.fstTanger.core.dao;


import org.springframework.data.jpa.repository.JpaRepository;

import com.fstTanger.core.bo.Role;

public interface IRepositoryDao extends JpaRepository<Role, Long> {

}
