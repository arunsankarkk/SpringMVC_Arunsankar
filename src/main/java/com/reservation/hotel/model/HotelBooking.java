package com.reservation.hotel.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="HOTEL_BOOKING")
public class HotelBooking {
	
	private Long id;
	private Hotel hotel;
	private Date checkInDate;
	private Date checkOutDate;
	
	private Integer noOfRoomsToBook = 0;

	@Id
	@GeneratedValue
	@Column(name="BOOKING_ID")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@ManyToOne(fetch=FetchType.LAZY, optional=false)
	@JoinColumn(name="HOTEL_ID")
	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}

	@Column(name="CHECK_IN_DATE", nullable=false)
	public Date getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}

	@Column(name="CHECK_OUT_DATE", nullable=false)
	public Date getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}

	@Column(name="ROOMS_TO_BOOK", nullable=false)
	public Integer getNoOfRoomsToBook() {
		return noOfRoomsToBook;
	}

	public void setNoOfRoomsToBook(Integer noOfRoomsToBook) {
		this.noOfRoomsToBook = noOfRoomsToBook;
	}
	
	
	

}

