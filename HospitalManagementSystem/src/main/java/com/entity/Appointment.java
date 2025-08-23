package com.entity;

public class Appointment {
	private int id;
	private int userId;
	private String fullName;
	private String gender;
	private String age;
	private String aptDate;
	private String email;
	private String phNo;
	private String disease;
	private int doctorId;
	private String address;
	private String status;
	public Appointment() {
		super();
	}
	
	public Appointment(int userId, String fullName, String gender, String age, String aptDate, String email,
			String phNo, String disease, int doctorId, String address, String status) {
		super();
		this.userId = userId;
		this.fullName = fullName;
		this.gender = gender;
		this.age = age;
		this.aptDate = aptDate;
		this.email = email;
		this.phNo = phNo;
		this.disease = disease;
		this.doctorId = doctorId;
		this.address = address;
		this.status = status;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAptDate() {
		return aptDate;
	}
	public void setAptDate(String aptDate) {
		this.aptDate = aptDate;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhNo() {
		return phNo;
	}
	public void setPhNo(String phNo) {
		this.phNo = phNo;
	}
	public String getDisease() {
		return disease;
	}
	public void setDisease(String disease) {
		this.disease = disease;
	}
	public int getDoctorId() {
		return doctorId;
	}
	public void setDoctorId(int doctorId) {
		this.doctorId = doctorId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
	
}
