<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Form</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="style/style.css">
<style>
.password-toggle {
	cursor: pointer;
}
</style>
</head>
<body>

	<div class="container mt-5">
		<h1 class="text-center mb-4">Lambton Account Registration Form</h1>
		<form action="RegisterMageshwar" method="post">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="first_name">First Name</label> <input type="text"
						class="form-control" id="first_name" name="first_name" required>
				</div>
				<div class="form-group col-md-6">
					<label for="last_name">Last Name</label> <input type="text"
						class="form-control" id="last_name" name="last_name" required>
				</div>
			</div>
			<div class="form-group">
				<label for="username">Username</label> <input type="text"
					class="form-control" id="username" name="username" required>
				<div class="invalid-feedback"></div>
			</div>
			<div class="form-group">
				<label for="password">Password</label>
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
				<div class="invalid-feedback"></div>
			</div>
			<div class="form-group">
				<label for="address">Address</label> <input type="text"
					class="form-control" id="address" name="address" required>
				<div class="invalid-feedback"></div>
			</div>
			<div class="form-group">
				<label for="contact">Contact No</label> <input type="text"
					class="form-control" id="contact" name="contact" required>
				<div class="invalid-feedback"></div>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary">Submit</button>
				<div class="mt-3">
					Already have an account? <a href="login.jsp">Login</a>
				</div>
			</div>
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
		$(document)
				.ready(
						function() {
							$('.password-toggle').click(
									function() {
										var passwordField = $('#password');
										var fieldType = passwordField
												.attr('type');
										if (fieldType === 'password') {
											passwordField.attr('type', 'text');
											$(this).find('img').attr('src',
													'assets/eyeV-icon.jpg'); // Change image to eye-open.png when showing password
										} else {
											passwordField.attr('type',
													'password');
											$(this).find('img').attr('src',
													'assets/eyeH-icon.jpg'); // Change image to eye-closed.png when hiding password
										}
									});

							// Function to check if a field meets the minimum length requirement
							function checkMinLength(field, minLength) {
								return field.val().trim().length >= minLength;
							}

							// Function to show or hide the error message for a field
							function toggleError(field, message, show) {
								var errorDiv = field
										.siblings('.invalid-feedback');
								errorDiv.text(message);
								if (show) {
									errorDiv.show();
								} else {
									errorDiv.hide();
								}
							}

							// Password field rules
							$('#password')
									.on(
											'input',
											function() {
												var minLength = 6;
												if (!checkMinLength($(this),
														minLength)) {
													toggleError(
															$(this),
															'Password must be at least 6 characters long',
															true);
												} else {
													toggleError($(this), '',
															false);
												}
											});

							// Username field rules
							$('#username')
									.on(
											'input',
											function() {
												var minLength = 6;
												if (!checkMinLength($(this),
														minLength)) {
													toggleError(
															$(this),
															'Username must be at least 6 characters long',
															true);
												} else {
													toggleError($(this), '',
															false);
												}
											});

							// Address field rules
							$('#address')
									.on(
											'input',
											function() {
												var minLength = 6;
												if (!checkMinLength($(this),
														minLength)) {
													toggleError(
															$(this),
															'Address must be at least 6 characters long',
															true);
												} else {
													toggleError($(this), '',
															false);
												}
											});

							// Contact field rules
							$('#contact')
									.on(
											'input',
											function() {
												var minLength = 10;
												if (!checkMinLength($(this),
														minLength)) {
													toggleError(
															$(this),
															'Contact must be at least 10 characters long',
															true);
												} else {
													toggleError($(this), '',
															false);
												}
											});

							// Submit button validation
							$('form')
									.submit(
											function(event) {
												var minLength = 6;
												var errors = false;

												if (!checkMinLength(
														$('#password'),
														minLength)) {
													toggleError(
															$('#password'),
															'Password must be at least 6 characters long',
															true);
													errors = true;
												}

												if (!checkMinLength(
														$('#username'),
														minLength)) {
													toggleError(
															$('#username'),
															'Username must be at least 6 characters long',
															true);
													errors = true;
												}

												if (!checkMinLength(
														$('#address'),
														minLength)) {
													toggleError(
															$('#address'),
															'Address must be at least 6 characters long',
															true);
													errors = true;
												}

												if (!checkMinLength(
														$('#contact'),
														minLength)) {
													toggleError(
															$('#contact'),
															'Contact must be at least 10 characters long',
															true);
													errors = true;
												}

												if (errors) {
													event.preventDefault(); // Prevent form submission if there are errors
												}
											});
						});
	</script>
</body>
</html>
