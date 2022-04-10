<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
				<form action="SignupServlet" method="post" class="my-5 border p-3"
					id="reg-form" style="background-color: white">

					<h1>Register Here</h1>
					<!--name  -->

					<div class="form-group mb-2">
						<label>Name:</label> <input type="text" class="form-control"
							placeholder="Enter full name" name="urname">

					</div>
					<!-- email -->

					<div class="form-group mb-2">
						<label for="exampleInputEmail1">Email:</label> <input type="email"
							class="form-control" placeholder="Enter email" name="uremail">
					</div>
					<!-- password -->

					<div class="form-group mb-2">
						<label>Password:</label> <input type="password"
							class="form-control" placeholder="Enter your password"
							name="urpassword">

					</div>


					<div class="form-check mb-2">
						<input type="checkbox" class="form-check-input" name="urtc"
							value="true"> <label class="form-check-label"
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