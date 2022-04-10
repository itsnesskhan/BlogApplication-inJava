package com.reservation.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	public static Connection con;
	public static Connection getConnect() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			con= DriverManager.getConnection("jdbc:mysql://localhost:3306/user_reservation", "root", "root");
			System.out.println("connected");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
}

