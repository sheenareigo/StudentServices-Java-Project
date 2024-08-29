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
<title>Co-ordinator Dashboard</title>
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
				href="coordinatordashboard">Co-ordinator Course Schedule
				Management</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto text-uppercase">
					<li class="nav-item"><a class="nav-link" href="#">View
							Schedules</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<div class="showFeedback">
		<%
    String roleName = "coordinator"; // Replace "your_role_name" with the actual role name
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
						<th scope="col">Remove File</th>
					</tr>
				</thead>
				<tbody>

					<%
					List<CourseEntity> c = (List<CourseEntity>) request.getAttribute("courseData");
					for (CourseEntity course : c) {
					%>
					<tr>
						<th scope="row"><%=course.getcourse_id()%></th>
						<th><a href="downloadCourse?courseId=<%=course.getcourse_id()%>&role=<%= roleName %>" style="font-weight: bold; color: inherit; text-decoration: none;">
    <%=course.getCourseName()%>
</a></th>
    <td>
        <form action="deleteSchedule" method="post"> <!-- Assuming you're using POST method for deleting -->
            <input type="hidden" name="courseId" value="<%= course.getcourse_id() %>">
            <input type="submit" value="Delete Schedule">
        </form>
    </td>
  

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