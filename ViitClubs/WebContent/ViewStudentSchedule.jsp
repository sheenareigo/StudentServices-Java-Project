<%@page import="java.util.List"%>
<%@page import="com.entity.CourseEntity"%>
<%@page import="com.entity.StudentClubEntity"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isELIgnored="false" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student </title>
<!-- for all frontend formatting -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- for inputting tags -->
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css"
	rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- for badges and tags: to display tags -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" type="text/css"
	href="css/adminDashboard_style.css">
</head>
<body>

	<!-- navbar -->

	<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
		<div class="container text-uppercase p-2">
			<a class="navbar-brand font-weight-bold text-white"
				href="#">Download Your Term Schedule</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>


		</div>
	</nav>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="showFeedback">
		<%
    int student_id = 0; // Default value if the attribute is not found or cannot be cast
    Object studentIdObj = request.getAttribute("student_id");
    if (studentIdObj instanceof Integer) {
        student_id = (Integer) studentIdObj;
    }
%>
			<%
			if (request.getAttribute("courseData") == null) {
			%>
			<h1 class="display-1">No Schedules Uploaded....</h1>
			<%
			} else {
			%>

			<div class="row mx-auto">
				<h2>Schedules</h2>
			</div>
			<br />
			
			<table class="table table-hover">
				<thead style="background-color: #C0C0C0;">
					<tr>
						<th scope="col">Course ID</th>
						<th scope="col">Schedule File</th>
					</tr>
				</thead>
				<tbody>

					<%
					List<CourseEntity> c = (List<CourseEntity>) request.getAttribute("courseData");
					String roleName="student";
					for (CourseEntity course : c) {
					%>
					<tr>
						<th scope="row"><%=course.getcourse_id()%></th>
						<th><a href="downloadCourse?courseId=<%=course.getcourse_id()%>&role=<%= roleName %>&username=<%=student_id %>" style="font-weight: bold; color: inherit; text-decoration: none;">
    <%=course.getCourseName()%>
</a></th>

						<%
						}
						%>
					
				</tbody>
			</table>
			<%
			}
			%><br />
			<br />

		</div>
	</div>

</body>
</html>