package com.reservation.hotel.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.reservation.hotel.model.Location;

@Controller
public class LoginController {
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public ModelAndView startup() {
		ModelAndView model = new ModelAndView();
		model.setViewName("index");
		return model;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(){
		List<Location> locationList = Arrays.asList(Location.values());
		return new ModelAndView("login", "locationList", locationList);
	}
	
	@RequestMapping(value="/dashboard", method=RequestMethod.GET)
	public ModelAndView dashboard(){
		return new ModelAndView("dashboard");
	}
	
	@RequestMapping(value="/newHotel", method=RequestMethod.GET)
	public ModelAndView addNewHotel(){
		ModelAndView model = new ModelAndView();
		model.setViewName("newHotel");
		return model;
	}
	
	@RequestMapping(value="/hotelBooking", method=RequestMethod.GET)
	public ModelAndView hotelBooking(){
		ModelAndView model = new ModelAndView();
		model.setViewName("hotelBooking");
		return model;
	}
	
	@RequestMapping(value="/createUser", method=RequestMethod.GET)
	public ModelAndView statup() {
		ModelAndView model = new ModelAndView();
		model.setViewName("createUser");
		return model;
	}
	
	@RequestMapping(value="/lowestTariff", method=RequestMethod.GET)
	public ModelAndView lowestTariff() {
		ModelAndView model = new ModelAndView();
		model.setViewName("lowestTariff");
		return model;
	}

}
