package com.acms.jdbc;

public class Owner {
	private int owner_id;
	private String first_name;
	private String last_name;
	private String address;
	private String email;
	private String telephone;
	private String nationality;
	private boolean isDeleted;
	
	
	public Owner(int owner_id, String first_name, String last_name, String address, String email, String telephone, String nationality,
			boolean isDeleted) {
		this.owner_id = owner_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.address = address;
		this.email = email;
		this.telephone = telephone;
		this.nationality = nationality;
		this.isDeleted = isDeleted;
	}
	
	public Owner(int owner_id, String first_name, String last_name, String address, String email, String telephone, String nationality) {
		super();
		this.owner_id = owner_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.address = address;
		this.email = email;
		this.telephone = telephone;
		this.nationality = nationality;
	}
	
	public Owner(String first_name, String last_name, String address, String email, String telephone, String nationality) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.address = address;
		this.email = email;
		this.telephone = telephone;
		this.nationality = nationality;
	}



	public int getOwner_id() {
		return owner_id;
	}

	public void setOwner_id(int owner_id) {
		this.owner_id = owner_id;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}	
	
	public boolean isDeleted() {
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}


}

