package com.fstTanger.core.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.fstTanger.core.services.impl.CustomAuthentificationService;
@Configuration
@EnableWebSecurity // Car c'est notre classe de gestion de sécurité donc on active Spring Security
public class AppSecurityConfig {
	Logger LOGGER = LoggerFactory.getLogger(getClass().getName());
	@Autowired // injection du gestionnaire CustomAuthentificationService
	private CustomAuthentificationService userService;
	@Bean
	public AuthenticationSuccessHandler uthenticationSuccessHandler() {
		return new RedirectionAfterAuthenticationSuccessHandler();
	}
	public AppSecurityConfig(CustomAuthentificationService userService) {
		this.userService = userService;

		LOGGER.debug("AppSecurityConfig Initialisé");
	}
	@Bean
	public DaoAuthenticationProvider authProvider() {
		DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
		authProvider.setUserDetailsService(userService);
		authProvider.setPasswordEncoder(passwordEncoder());
		return authProvider;
	}
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userService);
	}
	@Bean
	public AuthenticationFailureHandler authenticationFailureHandler() {
		return new CustomAuthenticationFailureHandler();
	}
	// Configuration de l'algorithme de hashage des mots de passe
	@Bean
	public PasswordEncoder passwordEncoder() {
		return org.springframework.security.crypto.password.NoOpPasswordEncoder.getInstance();
	}
	@Bean // nécessaire car c'est Spring qui créer automatiquement cette classe de type
	// MySimpleUrlAuthenticationSuccessHandler
	public AuthenticationSuccessHandler redirectionAfterAuthenticationSuccessHandler() {
		return new RedirectionAfterAuthenticationSuccessHandler();
	}
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		// TODO : Configurer la securité de votre application
		http
		//.csrf(csrf -> csrf.disable())  // Disable CSRF
		.authorizeHttpRequests(
				authz -> authz.requestMatchers("/student/**")
				.hasRole("STUDENT") //les mappings /student/** sont accessibles uniquementpour ROLE STUDENT  
				.requestMatchers("/cadreadmin/**")
				.hasRole("CADRE_ADMIN") 
				.requestMatchers("/prof/**")
				.hasRole("PROF")
				.requestMatchers("/admin/**")
				.hasRole("ADMIN")
				.anyRequest().permitAll()

		).formLogin(form -> form.loginPage("/showMyLoginPage")
				.loginProcessingUrl("/authenticateTheUser")
				.failureHandler(authenticationFailureHandler())
				.successHandler(uthenticationSuccessHandler())
				.permitAll()

		).logout(logout -> logout.logoutUrl("/logout") // Endpoint de déconnexion
//				.deleteCookies("JSESSIONID") // Supprime le cookie JSESSIONID lors de la déconnexion
				.permitAll())
		.exceptionHandling(exception -> exception.accessDeniedPage("/access-denied") 
		);
		return http.build();

	}
}
