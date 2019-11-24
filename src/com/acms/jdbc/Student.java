package com.acms.jdbc;

public class Student {
	private int student_id;
	private String first_name;
	private String last_name;
	private String address;
	private String email;
	private String telephone;
	private String dob;
	private String gender;
	private String nationality;
	private String fathername;
	private String fathercontactno;
	private String mothername;
	private String mothercontactno;
	private String schoolattended;
	private String emergencyno;
	private String medium;
	private String mediclecondition;
	private boolean isDeleted;	
	
	public Student(int student_id, String first_name, String last_name, String address, String email, String telephone, String dob, String gender, String nationality, String fathername, String fathercontactno, String mothername, String mothercontactno, String schoolattended, String emergencyno,	String medium, String mediclecondition, boolean isDeleted) {
		this.student_id = student_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.address = address;
		this.email = email;
		this.telephone = telephone;
		this.dob =  dob;
		this.gender = gender;
		this.nationality = nationality;
		this.fathername = fathername;
		this.fathercontactno = fathercontactno;
		this.mothername = mothername;
		this.mothercontactno = mothercontactno;
		this.schoolattended = schoolattended;
		this.emergencyno = emergencyno;
		this.medium = medium;
		this.mediclecondition = mediclecondition;
		this.isDeleted = isDeleted;
	}
	
	public Student(int student_id, String first_name, String last_name, String address, String email,
			String telephone, String dob, String gender, String nationality, String fathername, String fathercontactno, String mothername, String mothercontactno, String schoolattended, String emergencyno,	String medium, String mediclecondition) {
		super();
		this.student_id = student_id;
		this.first_name = first_name;
		this.last_name = last_name;
		this.address = address;
		this.email = email;
		this.telephone = telephone;
		this.dob =  dob ;
		this.gender = gender;
		this.nationality = nationality;
		this.fathername = fathername;
		this.fathercontactno = fathercontactno;
		this.mothername = mothername;
		this.mothercontactno = mothercontactno;
		this.schoolattended = schoolattended;
		this.emergencyno = emergencyno;
		this.medium = medium;
		this.mediclecondition = mediclecondition;
	}



	public Student(String first_name, String last_name, String address, String email,
			String telephone, String dob, String gender, String nationality, String fathername, String fathercontactno, String mothername, String mothercontactno, String schoolattended, String emergencyno,	String medium, String mediclecondition) {
		this.first_name = first_name;
		this.last_name = last_name;
		this.address = address;
		this.email = email;
		this.telephone = telephone;
		this.dob =  dob ;
		this.gender = gender;
		this.nationality = nationality;
		this.fathername = fathername;
		this.fathercontactno = fathercontactno;
		this.mothername = mothername;
		this.mothercontactno = mothercontactno;
		this.schoolattended = schoolattended;
		this.emergencyno = emergencyno;
		this.medium = medium;
		this.mediclecondition = mediclecondition;
	}

	public int getStudent_id() {
		return student_id;
	}

	public void setStudent_id(int student_id) {
		this.student_id = student_id;
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
	
	public boolean isDeleted() {
		return isDeleted;
	}
	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getFathername() {
		return fathername;
	}

	public void setFathername(String fathername) {
		this.fathername = fathername;
	}

	public String getFathercontactno() {
		return fathercontactno;
	}

	public void setFathercontactno(String fathercontactno) {
		this.fathercontactno = fathercontactno;
	}

	public String getMothername() {
		return mothername;
	}

	public void setMothername(String mothername) {
		this.mothername = mothername;
	}

	public String getMothercontactno() {
		return mothercontactno;
	}

	public void setMothercontactno(String mothercontactno) {
		this.mothercontactno = mothercontactno;
	}

	public String getSchoolattended() {
		return schoolattended;
	}

	public void setSchoolattended(String schoolattended) {
		this.schoolattended = schoolattended;
	}

	public String getEmergencyno() {
		return emergencyno;
	}

	public void setEmergencyno(String emergencyno) {
		this.emergencyno = emergencyno;
	}

	public String getMedium() {
		return medium;
	}

	public void setMedium(String medium) {
		this.medium = medium;
	}

	public String getMediclecondition() {
		return mediclecondition;
	}

	public void setMediclecondition(String mediclecondition) {
		this.mediclecondition = mediclecondition;
	}
	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}

	@Override
	public String toString() {
		return "Student [student_id=" + student_id + ", first_name=" + first_name + ", last_name=" + last_name
				+ ", address=" + address + ", email=" + email + ", telephone=" + telephone+ ", dob= " + dob + ", gender=" + gender + ", nationality=" + nationality + ", fathername=" + fathername + ", fathercontactno=" + fathercontactno + ", mothername= " + mothername + ", mothercontactno=" + mothercontactno +", +  schoolattended=" + schoolattended +",  emergencyno=" + emergencyno + ", medium=" + medium + ",   mediclecondition=" + mediclecondition + " ]";
	}
}