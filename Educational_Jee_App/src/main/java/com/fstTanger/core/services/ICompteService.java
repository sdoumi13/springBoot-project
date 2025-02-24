package com.fstTanger.core.services;

import java.util.List;


import com.fstTanger.core.bo.Compte;
import com.fstTanger.core.bo.Role;
import com.fstTanger.core.utils.ExcelExporter;

public interface ICompteService {

	public List<Role> getAllRoles();

	public List<Compte> getAllAccounts();

	public Compte getAccountByUserName(String login);

	public String createUser(Long idRole, Long idPerson);

	public ExcelExporter prepareCompteExport(List<Compte> comptes) ;
}
