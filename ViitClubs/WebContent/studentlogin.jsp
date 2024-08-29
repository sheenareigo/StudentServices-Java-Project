<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="style/style.css">
</head>
<body>
	
	<% if ("Error".equals(request.getAttribute("action"))) { %>
    <script>
        alert("Check Credentials");
    </script>
    <!-- Your HTML/Java code here -->
<% } %>

	<div class="container mt-5">
		<h1 class="text-center">Login to Your Account</h1>

		<form action="studentlogin" method="post">
			<div class="form-group">
				<label for="username">Student ID:</label> <input type="text"
					class="form-control" id="student_id" name="student_id" required>
					
			</div>
			<div class="form-group">
				<label for="password">Password:</label>
				<div class="input-group">
					<input type="password" class="form-control" id="password"
						name="password" required>
					<div class="input-group-append">
						<span class="input-group-text password-toggle"> <img
							src="assets/eyeH-icon.jpg" alt="Toggle Password" height="24"
							width="24">
						</span>
					</div>
				</div>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary">Login</button>
				
			</div>
		</form>

	</div>

	<footer class="fixed-bottom bg-light text-center py-3">
		<p>Copyright &copy; 2023 Lambton College</p>
	</footer>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.password-toggle').click(function() {
				var passwordField = $('#password');
				var fieldType = passwordField.attr('type');
				if (fieldType === 'password') {
					passwordField.attr('type', 'text');
					$(this).find('img').attr('src', 'assets/eyeV-icon.jpg'); // Change image to eye-open.png when showing password
				} else {
					passwordField.attr('type', 'password');
					$(this).find('img').attr('src', 'assets/eyeH-icon.jpg'); // Change image to eye-closed.png when hiding password
				}
			});
		});
	</script>
</body>
</html>