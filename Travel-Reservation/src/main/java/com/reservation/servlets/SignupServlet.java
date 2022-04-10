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
import com.reservation.entities.User;
import com.reservation.helper.ConnectionProvider;
import com.reservation.helper.Message;

/**
 * Servlet implementation class ReservationServlet
 */
@MultipartConfig
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignupServlet() {
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
		String name = request.getParameter("urname");
		String email = request.getParameter("uremail");
		String password = request.getParameter("urpassword");
		String checkbox = request.getParameter("urtc");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		System.out.println(name);
		System.out.println("tc"+checkbox);
		if (checkbox == null) {
			out.println("Please agree to the tearms and conditions");
		} else if (name.isEmpty()) {
			out.println("Please enter your name");
		} else if (password.isEmpty()) {
			out.println("Please enter your password");
		} else if (password.length() < 8) {
			out.println("Password must be 8 character long");
		} else {
			User user = new User(name, email, password);
			ReservationDaoImpl daoImpl = new ReservationDaoImpl(ConnectionProvider.getConnect());
			boolean isRegistred = daoImpl.doRegister(user);
			HttpSession session = request.getSession();
			session.setAttribute("cuser", user);
			if (isRegistred) {
				out.print("done");
				
			} else {
				out.print("user already exist with this email");
			}

	 	}

	}

}
