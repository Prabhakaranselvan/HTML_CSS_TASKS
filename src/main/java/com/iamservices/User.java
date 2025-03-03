package com.iamservices;


public class User 
{
	private String id;
	private String title;
	private String firstName;
	private String lastName;
	private String dob;
	private String gender;
	private String email;
	private String phone;
	private String aadhar;
	private String pan;
	private String accountType;
	private String address1;
	private String address2;
	private String district;
	private String state;
	private String country;
	private String pincode;
	private String nomineeName;
	private String nomineeContact;
	private String password;
	
	public User() {
	}
	
	public User(String id, String title, String firstName, String lastName, String dob, String gender,String email, String phone, 
			String aadhar, String pan, String accountType, String address1, String address2, String district, String state, 
			String country, String pincode, String nomineeName, String nomineeContact, String password) 
	{
		this.id = id;
		this.title = title;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dob = dob;
		this.gender = gender;
		this.email = email;
		this.phone = phone;
		this.aadhar = aadhar;
		this.pan = pan;
		this.accountType = accountType;
		this.address1 = address1;
		this.address2 = address2;
		this.district = district;
		this.state = state;
		this.country = country;
		this.pincode = pincode;
		this.nomineeName = nomineeName;
		this.nomineeContact = nomineeContact;
		this.password = password;
	}

	// Getter and Setter Methods

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAadhar() {
		return aadhar;
	}

	public void setAadhar(String aadhar) {
		this.aadhar = aadhar;
	}

	public String getPan() {
		return pan;
	}

	public void setPan(String pan) {
		this.pan = pan;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getNomineeName() {
		return nomineeName;
	}

	public void setNomineeName(String nomineeName) {
		this.nomineeName = nomineeName;
	}

	public String getNomineeContact() {
		return nomineeContact;
	}

	public void setNomineeContact(String nomineeContact) {
		this.nomineeContact = nomineeContact;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}

