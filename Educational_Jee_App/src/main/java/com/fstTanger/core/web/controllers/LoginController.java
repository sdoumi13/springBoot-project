package com.fstTanger.core.web.controllers;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.fstTanger.core.bo.Compte;
import com.fstTanger.core.bo.UserPrincipal;
import com.fstTanger.core.bo.Personne;
import com.fstTanger.core.web.models.UserAndAccountInfos;

@Controller
public class LoginController {
	@Autowired
	private HttpSession httpSession;
	private UserAndAccountInfos getUserAccount() {
		UserAndAccountInfos userInfo = (UserAndAccountInfos) httpSession.getAttribute("userInfo");
		if (userInfo == null) {
			Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			Compte userAccount = ((UserPrincipal) principal).getUser();
			Personne u = userAccount.getProprietaire();
			String roleName = userAccount.getRole().getNomRole();
			userInfo = new UserAndAccountInfos(u.getIdPersonne(), userAccount.getIdCompte(),
					userAccount.getLogin(),
					u.getNom(), u.getPrenom(), u.getEmail(), roleName);
			httpSession.setAttribute("userInfo", userInfo);
		}
		return userInfo;

	}

	@GetMapping("/showMyLoginPage")
	public String showLoginForm() {

		return "loginForm";
	}

	@GetMapping("/access-denied")
	public String showAccessDenied() {

		return "access-denied";

	}

	@GetMapping("/student/showHome")
	public String showStudentHomePage(Model m) {

		UserAndAccountInfos infoUser = getUserAccount();
		m.addAttribute("userInfos", infoUser);

		return "student/userHomePage";

	}

	@GetMapping("/prof/showHome")
	public String showProfHomePage(Model m) {

		UserAndAccountInfos infoUser = getUserAccount();
		m.addAttribute("userInfos", infoUser);
		return "prof/userHomePage";

	}

	@GetMapping("/cadreadmin/showHome")
	public String showCadreAdminHomePage(Model m) {

		UserAndAccountInfos infoUser = getUserAccount();
		m.addAttribute("userInfos", infoUser);
		return "cadreadmin/userHomePage";

	}

	@GetMapping("/biblio/showHome")
	public String showBiblioHomePage(Model m) {

		UserAndAccountInfos infoUser = getUserAccount();
		m.addAttribute("userInfos", infoUser);
		return "biblio/userHomePage";

	}

	@GetMapping("/admin/showAdminHome")
	public String showAdminHome(Model m) {

		UserAndAccountInfos infoUser = getUserAccount();
		m.addAttribute("userInfos", infoUser);
		return "admin/adminHome";

	}

}
