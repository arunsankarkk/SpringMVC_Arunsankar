package com.reservation.hotel.dao;

import java.util.List;

import com.reservation.hotel.model.Hotel;
import com.reservation.hotel.model.HotelBooking;

public interface HotelReservationDao {

	public Hotel saveHotel(Hotel hotel);
	
	public List<Hotel> loadHotelOnLocation(String location);
	
	public HotelBooking bookRoom(HotelBooking booking);
}
