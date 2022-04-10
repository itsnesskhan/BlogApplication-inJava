$(document).ready(function() {
	$("#reg-form").on('submit', function(event) {
		event.preventDefault();
		let form = new FormData(this);
		//alert(form.get("urname"));

		$.ajax({
			url: "SignupServlet",
			type: "POST",
			data: form,
			success: function(data) {

				if (data.trim() === 'done') {
					swal("Registered Successfully..!", "Redirecting you to login page..!", "success")
						.then((value) => { window.location = "login.jsp" });
				} else {
					swal(data);
				}


			},
			error: function(data) {
				console.log("error " + data)
				swal("Something went wrong..!", "Please try again..!", "warning");
			},
			processData: false,
			contentType: false,

		})

	})
})

