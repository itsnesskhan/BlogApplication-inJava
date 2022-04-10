package com.reservation.entities;

import java.time.LocalDate;

import com.mysql.cj.protocol.a.authentication.CachingSha2PasswordPlugin.AuthStage;

public class Reservation {
	private int id;
	private String phone;
	private int noadults;
	private int nochildern;
	private LocalDate bookedDate;
	private String currentPlace;
	private String destinationPlace;
	private String busType;
	private String ticketType;
	private int userid;
	
	public Reservation(int id, String phone, int noadults, int nochildern, LocalDate bookedDate, String currentPlace,
			String destinationPlace, String busType, String ticketType, int userid) {
		super();
		this.id = id;
		this.phone = phone;
		this.noadults = noadults;
		this.nochildern = nochildern;
		this.bookedDate = bookedDate;
		this.currentPlace = currentPlace;
		this.destinationPlace = destinationPlace;
		this.busType = busType;
		this.ticketType = ticketType;
		this.userid = userid;
	}

	public Reservation(String phone, int noadults, int nochildern, LocalDate bookedDate, String currentPlace,
			String destinationPlace, String busType, String ticketType, int userid) {
		super();
		this.phone = phone;
		this.noadults = noadults;
		this.nochildern = nochildern;
		this.bookedDate = bookedDate;
		this.currentPlace = currentPlace;
		this.destinationPlace = destinationPlace;
		this.busType = busType;
		this.ticketType = ticketType;
		this.userid = userid;
	}

	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getNoadults() {
		return noadults;
	}

	public void setNoadults(int noadults) {
		this.noadults = noadults;
	}

	public int getNochildern() {
		return nochildern;
	}

	public void setNochildern(int nochildern) {
		this.nochildern = nochildern;
	}

	public LocalDate getBookedDate() {
		return bookedDate;
	}

	public void setBookedDate(LocalDate bookedDate) {
		this.bookedDate = bookedDate;
	}

	public String getCurrentPlace() {
		return currentPlace;
	}

	public void setCurrentPlace(String currentPlace) {
		this.currentPlace = currentPlace;
	}

	public String getDestinationPlace() {
		return destinationPlace;
	}

	public void setDestinationPlace(String destinationPlace) {
		this.destinationPlace = destinationPlace;
	}

	public String getBusType() {
		return busType;
	}

	public void setBusType(String busType) {
		this.busType = busType;
	}

	public String getTicketType() {
		return ticketType;
	}

	public void setTicketType(String ticketType) {
		this.ticketType = ticketType;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "Reservation [id=" + id + ", phone=" + phone + ", noadults=" + noadults + ", nochildern=" + nochildern
				+ ", bookedDate=" + bookedDate + ", currentPlace=" + currentPlace + ", destinationPlace="
				+ destinationPlace + ", busType=" + busType + ", ticketType=" + ticketType + ", userid=" + userid + "]";
	}
	
	

	

}
