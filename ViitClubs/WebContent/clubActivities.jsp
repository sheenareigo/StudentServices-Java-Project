<%@ page import="java.util.List" %>
<%@ page import="com.entity.ClubEntity" %>
<%@ page import="com.entity.StudentClubEntity" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" isELIgnored="false"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Club Activities</title>
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
          <a class="navbar-brand font-weight-bold text-white" href="#">Club Activities</a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
        
         < <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto text-uppercase">
              <li class="nav-item">
                <a class="nav-link text-light" href="homepage">Home</a>
              </li>   
            </ul>
          </div> 
         </div>
    </nav>


<div class="container">
    <!-- Responsive Card Deck -->
    <main class="grid">
    <%
        List<ClubEntity> clubs = (List<ClubEntity>) request.getAttribute("clubsData");
        int student_id = (Integer) request.getAttribute("student_id");
        if (clubs == null || clubs.isEmpty()) {
    %>
        <h1 class="display-1">You are not registered with any club....</h1>
    <% 
        } else {
            for (ClubEntity club : clubs) {
    %>
                <article>
                    <img src="./showicon?id=<%=club.getClubid()%>" alt="Club Icon">
                    <div class="text">
                        <h3 class="text-uppercase"><%=club.getClubacronym()%></h3>
                        <p class="text-capitalize"><%=club.getClubname()%></p>
                        <a href="viewClubDetails.jsp"> <!-- Pass clubId as a parameter -->
                            <button class="view">View</button>
                        </a>
                        &nbsp;
                        <a href="unregisterclub?id=<%=club.getClubid()%>&studentId=<%=student_id%>">
                           <button class="view">Unregister from Club</button>
                        </a>
                    </div>
                </article>
    <%
            } // End of for loop
        } // End of else
    %>
    </main>
</div>

<script>
// Function to handle click event on View button
$(document).ready(function() {
    $(".view").click(function() {
        // Get the value of the button which is the club id
        var clubId = $(this).val();
        // Redirect to the viewClubDetails.jsp page with clubId as parameter
        window.location.href = "viewClubDetails.jsp?clubId=" + clubId;
    });
});
</script>

</body>
</html>
