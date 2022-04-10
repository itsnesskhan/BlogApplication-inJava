<%@page import="com.reservation.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<title>Reservation</title>
</head>
<body>
	<%@ include file="navbar.jsp"%>
	<%
	User user = (User) session.getAttribute("cuser");
	System.out.print(user);
	if (user == null) {
		response.sendRedirect("login.jsp");
		return;
	}
	%>
	<div class="container">
		<div class="row">
			<div class="offset-3	 col-6 my-4">
				<form action="ReservationServlet" method="post"
					style="background-color: white" class="p-3" id="reservation">

					<h1>Reservation Here</h1>
					<!-- phone -->

					<div class="form-group">
						<label for="exampleInputEmail1">Phone</label> <input type="text"
							class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp"
							placeholder="Enter phone/mobile number" name="phone">

					</div>

					<!-- number of adults -->
					<div class="form-group">
						<label for="exampleInputEmail1">Adults</label> <input
							type="number" class="form-control" min="0"
							placeholder="Number of Adults" name="noadults">

					</div>

					<!--number of childern  -->
					<div class="form-group">
						<label for="exampleInputEmail1">Children</label> <input
							type="number" class="form-control" min="0"
							placeholder="Number of children" name="nochildren">

					</div>

					<!-- booked date -->

					<div class="form-group">
						<label for="exampleInputEmail1">Date of journey</label> <input
							type="date" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="MM/DD/YYYY"
							name="bdate">

					</div>

					<!-- from -->
					<div class="form-group">
						<label for="currentPlace">From:</label> <select
							name="currentPlace" class="form-control" id="currentPlace">
							<option disabled="disabled" selected="selected">----Select----</option>
							<option value="Mumbai">Mumbai</option>
							<option value="Hydrabad">Hydrabad</option>
							<option value="Banglore">Banglore</option>
							<option value="Jaipur">Jaipur</option>
							<option value="Lakhnow">Lakhnow</option>
							<option value="Delhi">Delhi</option>
						</select>

					</div>

					<!-- To -->
					<div class="form-group">
						<label for="destinationPlace">To:</label> <select
							name="destinationPlace" class="form-control"
							id="destinationPlace">
							<option disabled="disabled" selected="selected">----Select----</option>
							<option value="Mumbai">Mumbai</option>
							<option value="Hydrabad">Hydrabad</option>
							<option value="Banglore">Banglore</option>
							<option value="Jaipur">Jaipur</option>
							<option value="Lakhnow">Lakhnow</option>
							<option value="Delhi">Delhi</option>
						</select>

					</div>

					<!-- bustype -->
					<div class="form-group">
						<label for="bustype">Bus Type:</label> <select name="bustype"
							id="bustype" class="form-control">
							<option value="Standerd">Standerd</option>
							<option value="Local">Local</option>

						</select>

					</div>

					<!-- tickettype -->
					<div class="form-group mb-2">
						<label for="ttype">Ticket type:</label> <select name="ttype"
							class="form-control " id="ttype">
							<option value="Single">Single</option>
							<option value="Return">Return</option>

						</select>

					</div>
					<div class="form-check mb-2">
						<input type="checkbox" class="form-check-input" id="exampleCheck1"
							name="tc"> <label class="form-check-label"
							for="exampleCheck1">Check me out</label>
					</div>
					<button type="submit" class="btn btn-primary">Submit</button>
				</form>
			</div>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script src="JS/myscript.js"></script>
	
</body>
</html>