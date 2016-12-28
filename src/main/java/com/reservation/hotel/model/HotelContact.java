package com.reservation.hotel.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name="HOTEL_CONTACT", uniqueConstraints={
		@UniqueConstraint(columnNames="LAND_LINE")
		})
public class HotelContact {

	private Long id;
	private Integer phone1;
	private Integer phone2;
	private String email;
	
	private String fullAddress;
	
	private Hotel hotel;

	public HotelContact() {
		super();
	}

	@Id
	@GeneratedValue
	@Column(name = "CONTACT_ID", unique = true, nullable = false)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "LAND_LINE", nullable=false)
	public Integer getPhone1() {
		return phone1;
	}

	public void setPhone1(Integer phone1) {
		this.phone1 = phone1;
	}

	@Column(name = "MOBILE", nullable=false)
	public Integer getPhone2() {
		return phone2;
	}

	public void setPhone2(Integer phone2) {
		this.phone2 = phone2;
	}

	@Column(name = "EMAIL", nullable=false)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "ADDRESS", nullable=false)
	public String getFullAddress() {
		return fullAddress;
	}

	public void setFullAddress(String fullAddress) {
		this.fullAddress = fullAddress;
	}

	@OneToOne(fetch=FetchType.LAZY)
	public Hotel getHotel() {
		return hotel;
	}

	public void setHotel(Hotel hotel) {
		this.hotel = hotel;
	}
	
	
}
