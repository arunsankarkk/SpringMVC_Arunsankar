package com.reservation.hotel.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.reservation.hotel.model.Hotel;
import com.reservation.hotel.model.HotelBooking;

@Repository
public class HotelReservationDaoImpl implements HotelReservationDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session session;
	
	
	public Session getSession() {
		
		if(session == null){
			session = sessionFactory.openSession();
		}
		return session;
	}
	
	@Override
	public Hotel saveHotel(Hotel hotel) {
		Serializable save = getSession().save(hotel);
		return hotel;
	}
		
	public List<Hotel> loadHotelOnLocation(String location) {
		Criteria criteria = getSession().createCriteria(Hotel.class);
		criteria.add(Restrictions.like("location", location));
		criteria.addOrder(Order.asc("ratePerRoom"));
		
		List<Hotel> list = (List<Hotel>)criteria.list();
		return list;
	}
	
	public HotelBooking bookRoom(HotelBooking booking){
		Serializable save = getSession().save(booking);
		return booking;
	}

}
