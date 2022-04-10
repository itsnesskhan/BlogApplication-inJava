package com.reservation.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reservation.dao.ReservationDaoImpl;
import com.reservation.entities.Reservation;
import com.reservation.entities.User;
import com.reservation.helper.ConnectionProvider;

/**
 * Servlet implementation class ReservationServlet
 */
@WebServlet("/ReservationServlet")
public class ReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReservationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String tc = request.getParameter("tc");
		String phone = request.getParameter("phone");
		String from = request.getParameter("currentPlace");
		String to = request.getParameter("destinationPlace");
		String bustype = request.getParameter("bustype");
		String tickettype = request.getParameter("ttype");
		if (tc == null) {
			out.print("please agree to the tearms and conditons");
		} else if (phone.isEmpty()) {
			out.print("Please enter your phone number");
		} else if (request.getParameter("noadults").isEmpty()) {
			out.print("please book at least one ticket");
		} else if (request.getParameter("nochildren").isEmpty()) {
			out.print("please enter a value");
		} else if (request.getParameter("bdate").isEmpty()) {
			out.print("please enter your booking date");
		} else if (LocalDate.parse(request.getParameter("bdate")).isBefore(LocalDate.now())) {
			out.print("please select a current date");

		} else if (from == null) {
			out.print("please enter your current location");
		} else if (to == null) {
			out.print("please enter your destination location");
		} else if (from.equals(to)) {
			out.print("please select a diffrent plcae to go");

		}

		LocalDate bdate = LocalDate.parse(request.getParameter("bdate"));
		int adults = Integer.parseInt(request.getParameter("noadults"));
		int children = Integer.parseInt(request.getParameter("nochildren"));
		try {
			ReservationDaoImpl daoImpl = new ReservationDaoImpl(ConnectionProvider.getConnect());
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("cuser");
			int userid = user.getId();
			Reservation reservation = new Reservation(phone, adults, children, bdate, from, to, bustype, tickettype,
					userid);

			System.out.println(reservation);
			boolean doReservation = daoImpl.doReservation(reservation);
			session.setAttribute("title", "all Tickets");
			session.setAttribute("cuser", user);
			if (doReservation) {
				out.print("done");
			} else {
				out.print("something went wrong");
			}
		} catch (Exception e) {
			out.print("Error");
			out.println(e.getMessage());
			e.printStackTrace();
		}

	}

}
