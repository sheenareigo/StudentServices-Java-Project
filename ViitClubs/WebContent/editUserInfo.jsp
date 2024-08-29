<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit User Information</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

    <div class="container">
    <h1 class="mt-5">Edit User Information</h1>
    
    <form action="EditUserInfoServlet" method="post">
    <input type="hidden" name="username" value="<%= request.getParameter("username") %>">
        <div class="form-group">
    <label for="field">Old Address</label>
    <label class="form-control" id="old " name="field">
        <option value="address"><%= request.getParameter("address") %></option>
    </label>
</div>
<div class="form-group">
    <label for="newValue">New Address</label>
    <input type="text" class="form-control" id="newValue" name="newValue">
</div>
        <input type="hidden" name="address" value="<%= request.getParameter("address") %>">
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</div>
    <!-- Bootstrap JS (optional, for certain Bootstrap features) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  



</body>
</html>
