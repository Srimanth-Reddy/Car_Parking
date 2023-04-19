<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Thank You!</title>
<%@include file="all_css.jsp" %>

<style type="text/css">
.back-img{
background: url("https://cdn.dribbble.com/users/4479253/screenshots/14600146/post_1_4x.png");
width: 90%;
height: 90vh;
background-repeat: no repeat;
background-size: cover;
}
</style>

</head>
<body>
<%@include file="navbar.jsp" %>
<div class="container-fluid back-img">
<div class="text-center">

<h5>We have sent your bill to your mobile number. </h5>
<h4>Thank you! Please Rate us! </h4>


<a href="logoutServlet" class="fa fa-star fa-4x checked" onclick="showAlert()" id="rate"></a>
<a href="logoutServlet" class="fa fa-star fa-4x checked" onclick="showAlert()" id="rate"></a>
<a href="logoutServlet" class="fa fa-star fa-4x checked" onclick="showAlert()" id="rate"></a>
<a href="logoutServlet" class="fa fa-star fa-4x checked" onclick="showAlert()" id="rate"></a>
<a href="logoutServlet" class="fa fa-star fa-4x checked" onclick="showAlert()" id="rate"></a>

<script>
  function showAlert() {
    var myText = "Feedback Submitted!";
    alert (myText);
  }
  </script>


</div>
</div>


</body>
</html>