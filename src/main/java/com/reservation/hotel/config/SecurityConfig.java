package com.reservation.hotel.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	private static String REALM="MY_REALM";
	
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
	  auth.inMemoryAuthentication().withUser("ADMIN").password("TEST").roles("ADMIN");
	  auth.inMemoryAuthentication().withUser("CUSTOMER").password("TEST").roles("CUSTOMER");
	  auth.inMemoryAuthentication().withUser("MANAGEMENT").password("TEST").roles("MANAGEMENT");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {

	http.csrf().disable().authorizeRequests()
	  .antMatchers("/")
      .access("permitAll")
      .antMatchers("/createUser")
      .access("hasRole('ADMIN')");
     
	}
}
