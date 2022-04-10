package com.reservation.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.reservation.helper.ConnectionProvider;
import com.reservation.helper.Message;
import com.reservation.dao.ReservationDaoImpl;
import com.reservation.entities.User;

/**
 * Servlet implementation class LoginServelet
 */
@WebServlet("/login")
public class LoginServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServelet() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		ReservationDaoImpl dao = new ReservationDaoImpl(ConnectionProvider.getConnect());
		User user = dao.findUserByEmail(email, password);
		System.out.println(user);
		if (user == null) {
			Message msg = new Message("Invalid Details.. please try again", "error", "alert-danger");
			HttpSession session = request.getSession();
			System.out.println(msg);
			session.setAttribute("msg", msg);
			session.setAttribute("name", "Nasser Khan");
			response.sendRedirect("login.jsp");
		} else {
			// login success
			HttpSession session = request.getSession();
			session.setAttribute("cuser", user);
			response.sendRedirect("reservation.jsp");
		}

	}

}
