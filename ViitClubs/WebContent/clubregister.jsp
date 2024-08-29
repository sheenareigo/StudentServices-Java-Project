<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register for Club</title>
    <!-- Include Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <h1 class="mb-4">Register with <%= request.getParameter("clubName") %></h1>
    
    <form action="registerclubStudent" method="post" class="col-md-6">
    
    <div class="form-group">
            <label for="clubId">Club Number</label>
            <input type="text" id="clubId" name="clubId" value="<%= request.getParameter("clubId") %>" readonly>
        </div>
        
        <div class="form-group">
            <label for="clubName">Club Name:</label>
            <input type="text" id="clubName" name="clubName" value="<%= request.getParameter("clubName") %>" class="form-control" readonly>
        </div>
        <div class="form-group">
            <label for="studentId">Student ID:</label>
            <input type="text" id="studentId" name="studentId" value="<%= session.getAttribute("student_id") %>" readonly class="form-control" required>
        </div>
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                </div>
                <input type="email" id="email" name="email" class="form-control" required>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>

    <!-- Include Font Awesome for icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
