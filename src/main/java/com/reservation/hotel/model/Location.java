package com.reservation.hotel.model;

public enum Location {
	
	BANGALORE(1, "BANGALORE"), 
	CHENNAI(2, "CHENNAI"), 
	COCHIN(3, "COCHIN"), 
	GOA(4, "GOA"), 
	DELHI(5, "DELHI"),
	MUMBAI(6, "MUMBAI"),
	JAIPUR(7, "JAIPUR"),
	HYDERABAD(8, "HYDERABAD");
	
	private int id;
	private String description;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}

	Location(int id, String str) {
		this.id = id;
		this.description = str;
	}
}
