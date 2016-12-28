package com.reservation.hotel.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.reservation.hotel.model.Hotel;
import com.reservation.hotel.model.HotelBooking;
import com.reservation.hotel.model.Location;
import com.reservation.hotel.service.HotelReservationService;

@RestController
public class CRUDControllers {
	
	@Autowired
	private HotelReservationService hotelService;

	@RequestMapping(value = "/fetchLocations", method=RequestMethod.GET )
	public ResponseEntity<List<Location>> fetchLocationList() {
		List<Location> locationList = Arrays.asList(Location.values());
		return new ResponseEntity<List<Location>>( locationList, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/saveHotel", method=RequestMethod.POST )
	public ResponseEntity<Hotel> saveHotel(@RequestBody Hotel hotel) {
		
		Hotel saveHotel = hotelService.saveHotel(hotel);
		return new ResponseEntity<Hotel>(saveHotel, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/hotelOnTariff", method=RequestMethod.GET )
	public ResponseEntity<List<Hotel>> loadHotelOntarrif(@RequestParam("param") String param) {
		
		List<Hotel> loadHotelOnLocation = hotelService.loadHotelOnLocation(param);
		
		return new ResponseEntity<List<Hotel>>((List<Hotel>)loadHotelOnLocation, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/bookRoom", method=RequestMethod.POST )	
	public ResponseEntity<HotelBooking> bookRoom(@RequestBody HotelBooking booking) {
		
		HotelBooking bookRoom = hotelService.bookRoom(booking);
		
		return new ResponseEntity<HotelBooking>(bookRoom, HttpStatus.OK);
	}
}
