package com.reservation.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.reservation.entities.Reservation;
import com.reservation.entities.User;

public class ReservationDaoImpl {
	private Connection connection;

	public ReservationDaoImpl(Connection connection) {
		super();
		this.connection = connection;
	}

	public Connection getConnection() {
		return connection;
	}

	public void setConnection(Connection connection) {
		this.connection = connection;
	}

	public boolean doRegister(User user) {
		boolean f = false;
		String query = "insert into user (email,name, password) values(?,?,?)";
		try {
			PreparedStatement psmt = this.connection.prepareStatement(query);
			psmt.setString(1, user.getEmail());
			psmt.setString(2, user.getName());
			psmt.setString(3, user.getPassword());

			psmt.executeUpdate();
			f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public boolean doReservation(Reservation reservation) {
		boolean f = false;
		String query = "insert into user_reservation (phone,noa,noc,bdate,cplace, dplace, bustype, ttype, userid) values(?,?,?,?,?,?,?,?,?)";
		try {
			PreparedStatement psmt = this.connection.prepareStatement(query);
			psmt.setString(1, reservation.getPhone());
			psmt.setInt(2, reservation.getNoadults());
			psmt.setInt(3, reservation.getNochildern());
			psmt.setDate(4, Date.valueOf(reservation.getBookedDate()));
			psmt.setString(5, reservation.getCurrentPlace());
			psmt.setString(6, reservation.getDestinationPlace());
			psmt.setString(7, reservation.getBusType());
			psmt.setString(8, reservation.getTicketType());
			psmt.setInt(9, reservation.getUserid());
			psmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public User findUserByEmail(String email, String password) {
		String query = "select * from user where email =? and password =?";
		User user = null;
		try {
			PreparedStatement psmt = this.connection.prepareStatement(query);
			psmt.setString(1, email);
			psmt.setString(2, password);
			ResultSet set = psmt.executeQuery();

			while (set.next()) {
				user = new User();
				user.setId(set.getInt("id"));
				user.setName(set.getString("name"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public List<Reservation> getTicketsById(int userid) {
		List<Reservation> list = new ArrayList<Reservation>();
		String query = "select * from user_reservation where userid = ? order by bdate DESC";
		try {
			PreparedStatement psmt = this.connection.prepareStatement(query);
			psmt.setInt(1, userid);
			ResultSet set = psmt.executeQuery();
			while (set.next()) {
				Reservation reservation = new Reservation();
				reservation.setId(set.getInt("id"));
				reservation.setPhone(set.getString("phone"));
				reservation.setNoadults(set.getInt("noa"));
				reservation.setNochildern(set.getInt("noc"));
				reservation.setBookedDate(set.getDate("bdate").toLocalDate());
				reservation.setCurrentPlace(set.getString("cplace"));
				reservation.setDestinationPlace(set.getString("dplace"));
				reservation.setBusType(set.getString("bustype"));
				reservation.setTicketType(set.getString("ttype"));
				reservation.setUserid(set.getInt("userid"));

				list.add(reservation);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
