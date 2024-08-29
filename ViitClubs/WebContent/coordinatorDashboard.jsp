<%@page import="java.util.List" %>
<%@page import="com.entity.CourseEntity" %>
<%@page import="com.entity.StudentClubEntity" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Co-ordinator Dashboard</title>
<!-- for all frontend formatting -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- for inputting tags -->	
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- for badges and tags: to display tags -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		
<link rel="stylesheet" type="text/css" href="css/adminDashboard_style.css">
</head>
<body>

<!-- navbar -->	

	<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
		 <div class="container text-uppercase p-2">
		  <a class="navbar-brand font-weight-bold text-white" href="#">Co-ordinator Course Schedule Management</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    <span class="navbar-toggler-icon"></span>
		  </button>
		
		  <div class="collapse navbar-collapse" id="navbarSupportedContent">
		    <ul class="navbar-nav ml-auto text-uppercase">
		      <li class="nav-item">
		        <a class="nav-link text-light" href="showcoordinatordashboard">View Schedules</a>
		      </li>   
		    </ul>
		  </div>
		 </div>
	</nav>

<div class="container">

    <form action="uploadschedule" method="post" enctype="multipart/form-data">
 <h2>" "</h2>
        <h2>" "</h2>
    <h2>Upload Program Schedules</h2>
        <!-- Dropdown for selecting the course -->
        <label for="course_id">Select Program:</label>
        <select name="course_id" id="course_id">
            <option value="FSDM">Full Stack</option>
            <option value="CPCM">Computer Programming</option>
            <option value="IBM">Business Management</option>
             <option value="PJM">Project Management</option>
            <option value="CC">Cloud Computing</option>
            <option value="EVM">Environmental Management</option>
        </select>
        <br><br>
        <label for="course_name">Program Description:</label>
        <input type="text" name="course_name" id="course_name" required>
        <br><br>
        <!-- File input for uploading the schedule -->
        <label for="file">Upload Course Schedule:</label>
        <input type="file" name="file" id="file" required>
        <br><br>

        <button type="submit">Upload Schedule</button>
    </form>
</div>
</body>
</html>