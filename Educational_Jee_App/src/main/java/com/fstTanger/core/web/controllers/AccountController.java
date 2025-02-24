package com.fstTanger.core.web.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import jakarta.servlet.http.HttpServletResponse;

import com.fstTanger.core.services.IPersonneService;
import com.fstTanger.core.utils.ExcelExporter;
import com.fstTanger.core.bo.Compte;
import com.fstTanger.core.services.ICompteService;
import com.fstTanger.core.web.models.AccountModel;


@Controller
@RequestMapping("/admin")
public class AccountController {
	@Autowired
	private ICompteService userService; // On obtient par injection automatique le service
	@Autowired
	private IPersonneService personService; // On obtient par injection automatique le service
	@RequestMapping(value = "createAccountForm/{idPerson}", method = RequestMethod.GET)
	public String createAccountForm(@PathVariable int idPerson, Model model) {
		AccountModel accountModel = new AccountModel(Long.valueOf(idPerson));
		model.addAttribute("accountModel", accountModel);
		model.addAttribute("roleList", userService.getAllRoles());
		model.addAttribute("accountList", userService.getAllAccounts());
		return "admin/formAccount";}
	@GetMapping("manageAccounts")
	public String manageAccounts(@ModelAttribute("accountModel") AccountModel accountModel, Model model) {

		model.addAttribute("accountList", userService.getAllAccounts());

		return "admin/accountList";
	}
	@GetMapping("createAccounts")
	public String createAccounts(@ModelAttribute("accountModel") AccountModel accountModel, Model model) {


		model.addAttribute("personList", personService.getAllPersonnes());

		return "admin/accountCreation";
	}


	//Cette méthode permet de créer un comote
	@PostMapping("addAccount")
	public String addAccount(@ModelAttribute("accountModel") AccountModel accountModel, Model model) {


		//La création du compte est implémenter au niveau service
		//Il suffit de passer l'id du role et l'id de personne
		//à la couche service
		String password = userService.createUser(accountModel.getRoleId(), accountModel.getPersonId());

		//On affiche le mot de passe dans la vue 
		accountModel.setPassword(password);

		//On affiche également la liste des comptes dans la vue
		model.addAttribute("accountList", userService.getAllAccounts());


		//On affiche la vue 
		return "admin/accountList";

	}

	@GetMapping("exportAccounts")
	public void exportToExcel(HttpServletResponse response) throws IOException {
		response.setContentType("application/octet-stream");
		DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
		String currentDateTime = dateFormatter.format(new Date());

		String headerKey = "Content-Disposition";
		String headerValue = "attachment; filename=accounts_" + currentDateTime + ".xlsx";
		response.setHeader(headerKey, headerValue);

		List<Compte> comptes = userService.getAllAccounts();

		ExcelExporter excelExporter = userService.prepareCompteExport(comptes);

		excelExporter.export(response);
	}


}
