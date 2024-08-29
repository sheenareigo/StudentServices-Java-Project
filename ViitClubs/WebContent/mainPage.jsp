<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FSDM Group 7 Project</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="style/style.css">
    <link rel="stylesheet" href="style/style2.css">
    <link rel="stylesheet" href="style/style3.css">
</head>
<body>

<!-- Main Content -->
    <div class="mt-5">
        <h1 class="text-center">Lamton College Portal</h1>

        <!-- Banner Image -->
        <div class="banner-image">
            <!-- Banner image from your assets -->
          
        </div>

        <!-- Student Services Description -->
        <section class="services-description">
	      </section>

        <!-- Student Services Icons and Explanations -->
        <section class="services-icons">
            <!-- Service 1 -->
<div class="service text-center">
    <a href="studentlogin.jsp">
        <img src="http://localhost:8080//StudentServices/assets/student_icon.png" alt="Student Icon">
    </a>
    <h3>Students Login</h3>
   </div>

            <!-- Service 2 -->
            <div class="service text-center">
                <a href="coordinatorLogin.jsp">
                    <img src="http://localhost:8080//StudentServices/assets/networking.png" alt="Sports Icon">
                </a>
                <h3>Co-Ordinator Login</h3>
               </div>

            <!-- Additional services can be added here -->
            

            <div class="service text-center">
                <a href="adminLogin.jsp">
                    <img src="http://localhost:8080//StudentServices/assets/setting.png" alt="Student Icon">
                </a>
                <h3>Admin Login</h3>
                  </div>

                 <!--       
            <div class="service text-center">
                <a href="professorCollection.jsp?username=${sessionScope.loggedInUser}">
                    <img src="http://localhost:8080//StudentServices/assets/lec.jpg" alt="Lecturer Icon">
                </a>
                <h3>Lecturers</h3>
                <p>Expert lecturers are here to guide you through your academic journey.</p>
            </div>

            <!-- Additional services can be added here -->
        </section>
        
        
        
      <br><br><br>
        
        
    </div>

</body>
</html>