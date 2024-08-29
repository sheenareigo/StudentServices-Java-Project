<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Information</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <h1 class="mt-5">Student Information</h1>
        <table class="table table-bordered mt-3">
            <tbody>
                <c:if test="${not empty user}">
                    <tr>
                        <th>First Name</th>
                        <td>${user.getString("first_name")}</td>
                    </tr>
                    <tr>
                        <th>Last Name</th>
                        <td>${user.getString("last_name")}</td>
                    </tr>
                    <tr>
                        <th>student_id</th>
                        <td>${user.getString("student_id")}</td>
                    </tr>
                    
                    <tr>
                        <th>Address</th>
                       <td>${user.getString("address")} &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href="editUserInfo.jsp?address=${user.getString("address")}&username=${user.getString("student_id")}" class="btn btn-primary">Edit</a></td>

                    </tr>
                    <tr>
                        <th>Contact</th>
                        <td>${user.getString("contact")}</td> <!-- <td> <a href="DeleteUserInfoServlet?contact=${user.getString("contact")}&username=${user.getString("student_id")}">Delete</a></td>	 -->
                    </tr>
                </c:if>
            </tbody>
        </table>
    </div>
    <!-- Bootstrap JS (optional, for certain Bootstrap features) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
