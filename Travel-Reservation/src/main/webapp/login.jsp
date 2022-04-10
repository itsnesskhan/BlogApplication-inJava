<%@page import="com.reservation.helper.Message"%>
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
	<div class="container">
		<div class="row">
			<div class="offset-3 	 col-6 my-4">
				<form action="login" method="post" class="my-5 border p-3 " style="background-color: white">
					<%
					Message message = (Message) session.getAttribute("msg");
					if (message != null) {
					%>
					<div class="alert <%=message.getCssClass()%>" role="alert">
						<%=message.getContent()%>
					</div>
					<%
					session.removeAttribute("msg");
					}
					%>

					<h1>Login Here</h1>

					<!-- email -->

					<div class="form-group mb-2">
						<label for="exampleInputEmail1">Email:</label> <input type="email"
							class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter email"
							name="email">

					</div>
					<!-- phone -->

					<div class="form-group mb-2">
						<label for="exampleInputEmail1">Password:</label> <input
							type="password" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" placeholder="Enter password"
							name="password">

					</div>

					<button type="submit" class="btn btn-primary">Login</button>
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
</body>
</html>