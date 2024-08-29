<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Services Home Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="style/style.css">
    <link rel="stylesheet" href="style/style2.css">
    <link rel="stylesheet" href="style/style3.css">
   <style>
        /* Custom CSS for hover effects */
        .banner-image {
    width: 100%;
    height: 500px;
    background-image: url('http://localhost:8080/StudentServices/assets/img1.jpg');
    background-size: cover;
    background-position: center;
}
        .service {
            transition: transform 0.3s ease;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            background-color: #fff;
            padding: 20px;
            margin-bottom: 66px;
        }

        .service:hover {
            transform: translateY(-5px);
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.2);
        }

        /* Additional styles for responsiveness */
        @media (min-width: 576px) {
            .service {
                margin-bottom: 10px;
            }
        }
      
          /* Custom CSS for hover effects */
        .image-container {
            position: relative;
            overflow: hidden;
            border-radius: 10px;
        }

        .image-container img {
            width: 100%;
            height: auto;
            transition: transform 0.3s ease;
        }

        .content-overlay {
            position: absolute;
            top: 0;
            left: 0;
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity 0.3s ease;
            border-radius: 10px;
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .image-container:hover .content-overlay {
            opacity: 1;
        }

        .content-overlay h3 {
            margin-bottom: 10px;
        }

        .content-overlay p {
            margin-bottom: 0;
        }
      
    </style>
</head>
<body>
    <!-- Navigation Bar -->
   <nav>
	<a href=mainPage.jsp>Home</a>
		
			<div class="dropdown">
            <img class="logo" src="http://localhost:8080//StudentServices/assets/student_icon.png" alt="Logout Icon">
            <div class="dropdown-content">
                <a href="LogoutServlet">Logout</a>
            </div>
        </div>
	</nav>


    <!-- Main Content -->
    <div class="mt-5">
  <%
    String studentName = (String) request.getAttribute("student_name");
  Integer studentId = (Integer) session.getAttribute("student_id");
%>
        <h1 class="text-center">Welcome <%= studentName %> !</h1>

        <!-- Banner Image -->
        <div class="banner-image">
            <!-- Banner image from your assets -->
          
        </div>

        <!-- Student Services Description -->
        <section class="services-description">
            <h2 class="text-center">Welcome to Student Services</h2>
            <p class="text-center">Our mission is to support your academic journey and enhance your college experience. From academic support to career guidance, we're here to help you succeed.</p>
        </section>

        <!-- Student Services Icons and Explanations -->
        <section class="services-icons">
            <!-- Service 1 -->
<div class="service text-center">
<a href="StudentInfoServlet?username=<%= studentId %>">
        <img src="http://localhost:8080//StudentServices/assets/student_icon.png" alt="Student Icon">
    </a>
    <h3>Students-Info</h3>
    <p>Our student services provide a supportive environment for learning and growth.</p>
</div>

            <!-- Service 2 -->
            <div class="service text-center">
                <a href="homepage?username=<%= studentId %>">
                    <img src="http://localhost:8080//StudentServices/assets/ao.jpg" alt="Sports Icon">
                </a>
                <h3>Extra Curricular</h3>
                <p>Extracurricular activities can be a great way to explore interests, develop new skills, and build a well-rounded resume..</p>
            </div>

            <!-- Additional services can be added here -->
            

            <div class="service text-center">
                <a href="showstudentschedule?username=<%= studentId %>">
                    <img src="http://localhost:8080//StudentServices/assets/student_icon.png" alt="Student Icon">
                </a>
                <h3>View your term schedule</h3>
                <p>Check the current term schedule</p>
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

    <!-- Footer -->
    <footer class="fixed-bottom bg-dark text-center py-3">
        <p>Copyright © 2023 Student Services. All rights reserved.</p>
    </footer>

    <!-- JavaScript to prevent back navigation to login page -->
</body>
</html>