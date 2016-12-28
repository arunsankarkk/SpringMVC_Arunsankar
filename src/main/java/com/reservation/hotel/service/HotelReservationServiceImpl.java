package com.reservation.hotel.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.hotel.dao.HotelReservationDao;
import com.reservation.hotel.model.Hotel;
import com.reservation.hotel.model.HotelBooking;

@Service
public class HotelReservationServiceImpl implements HotelReservationService {

	@Autowired
	private HotelReservationDao hotelDao;
	
	@Override
	public Hotel saveHotel(Hotel hotel) {
		 return hotelDao.saveHotel(hotel);
	}
	
	public List<Hotel> loadHotelOnLocation(String location) {
		return hotelDao.loadHotelOnLocation(location);
	}
	
	public HotelBooking bookRoom(HotelBooking booking) {
		return hotelDao.bookRoom(booking);
	}

}
