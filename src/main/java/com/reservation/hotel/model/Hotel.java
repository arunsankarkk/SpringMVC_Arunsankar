package com.reservation.hotel.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="HOTEL")
public class Hotel {
	
	private Long id;
	private String hotelName;
	
	private Integer noOfRooms;
	private Integer ratePerRoom;
	
	//private Integer noOfAvailableRooms;
	
	private String location;
	
	private HotelContact contact;

	
	public Hotel() {
		super();
	}

	@Id
	@GeneratedValue
	@Column(name="HOTEL_ID", nullable=false, unique=true)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name="HOTEL_NAME", length=25, nullable= false)
	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}

	/*@Column(name="NO_OF_ROOMS", length=5, nullable= false)
	public Integer getNoOfRooms() {
		return noOfRooms;
	}

	public void setNoOfRooms(Integer noOfRooms) {
		this.noOfRooms = noOfRooms;
	}*/

	@Column(name="ROOM_RATE", length=10, nullable= false)
	public Integer getRatePerRoom() {
		return ratePerRoom;
	}

	public void setRatePerRoom(Integer ratePerRoom) {
		this.ratePerRoom = ratePerRoom;
	}

	/*@Column(name="AVAILABLE_ROOMS", length=15, nullable= false)
	public Integer getNoOfAvailableRooms() {
		return noOfAvailableRooms;
	}

	public void setNoOfAvailableRooms(Integer noOfAvailableRooms) {
		this.noOfAvailableRooms = noOfAvailableRooms;
	}*/

	@Column(name="LOCATION",  nullable= false)
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@OneToOne(mappedBy = "hotel", cascade=CascadeType.ALL)
	public HotelContact getContact() {
		return contact;
	}

	public void setContact(HotelContact contact) {
		this.contact = contact;
	}
	
	

}
