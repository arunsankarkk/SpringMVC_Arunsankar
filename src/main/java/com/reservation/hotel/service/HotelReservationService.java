package com.reservation.hotel.service;

import java.util.List;

import com.reservation.hotel.model.Hotel;
import com.reservation.hotel.model.HotelBooking;

public interface HotelReservationService {
	
	public Hotel saveHotel(Hotel hotel);
	
	public List<Hotel> loadHotelOnLocation(String location);
	
	public HotelBooking bookRoom(HotelBooking booking);

}
