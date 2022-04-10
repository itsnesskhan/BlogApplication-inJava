<%@page import="org.apache.jasper.tagplugins.jstl.core.Out"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="com.reservation.entities.User"%>
<%@page import="com.reservation.helper.ConnectionProvider"%>
<%@page import="com.reservation.dao.ReservationDaoImpl"%>
<%@page import="com.reservation.entities.Reservation"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page isELIgnored="false"%>


<html>
<head>
<meta charset="ISO-8859-1">
<title>${title }</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link href="css/mystyles.css" rel="stylesheet" type="">
</head>
<body>
<%@ include file="navbar.jsp" %>
	<%
	User user = (User) session.getAttribute("cuser");
	System.out.print(user);
	if (user == null) {
		System.out.print("i am gonna get redirect");
		response.sendRedirect("login.jsp");
		return;
	}
	%>

	<div class="container">
		<div class="row">
			<div class="col my-5">
				<h1 class="text-center">Booked Tickets</h1>
				<%
				ReservationDaoImpl dao = new ReservationDaoImpl(ConnectionProvider.getConnect());
				List<Reservation> list = dao.getTicketsById(user.getId());
				if (list.size() == 0) {
					out.println("<h2 class='text-center text-muted dislay-3'>No tickets is currently booked</h2>");
				out.println("<a href='reservation.jsp' class='btn btn-success'>Get Reservation</a>");
					
				} else {
				%>
				<table class="table" style="background-color: white">
					<thead>
						<tr>
							<th scope="col">Sno.</th>
							<th scope="col">Name</th>
							<th scope="col">Email</th>
							<th scope="col">Phone</th>
							<th scope="col">Booking Date</th>
							<th scope="col">Adults</th>
							<th scope="col">Chilren</th>
							<th scope="col">Bus Type</th>
							<th scope="col">Single/Return</th>
						</tr>
					</thead>
					<%
					for (Reservation t : list) {
					%>
					<tbody>
						<tr>
							<th scope="row">E5783#<%=t.getId()%></th>
							<td><%=user.getName()%></td>
							<td><%=user.getEmail()%></td>
							<td><%=t.getPhone()%></td>
							<td><%=t.getBookedDate()%></td>
							<td><%=t.getNoadults()%></td>
							<td><%=t.getNochildern()%></td>
							<td><%=t.getBusType()%></td>
							<td><%=t.getTicketType()%></td>
						</tr>
						<%
						}
						%>
					</tbody>
				</table>
				<a href="reservation.jsp" class="btn btn-info">Book more tikets</a>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
		integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
		integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
		crossorigin="anonymous"></script>
</body>
</html>