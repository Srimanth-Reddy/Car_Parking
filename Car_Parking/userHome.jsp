<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User</title>
<%@include file="all_css.jsp"%>

<style type="text/css">
.back-img{
background: url("https://thumbs.dreamstime.com/b/reserve-parking-space-curbside-pickup-abstract-concept-vector-illustration-customer-walk-station-customers-arrival-keep-210017885.jpg");
width: 75%;
height: 90vh;
background-repeat: no repeat;
background-size: cover;
}
</style>
</head>
<style>
.button-2 {
    display: block;
    width: 200px;
    height: 70px;
    background: #4E9CAF;
    padding: 10px;
    text-align: center;
    border-radius: 5px;
    color: white;
    font-weight: bold;
    line-height: 25px;
    margin-left: 40%;
}


</style>
<body>

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>
</c:if>

<%@include file="navbar.jsp" %>

<div class="container-fluid back-img">
<div class="text-center">
<h1 > Welcome User!
</h1>
<div>
<a href="user.jsp" style="font-size: 20px" class ="button-2">View Parking Spots</a>
</div>

</div>
</div>

</body>
</html>