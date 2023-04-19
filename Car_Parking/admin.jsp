<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
<%@include file="all_css.jsp"%>

<style type="text/css">
.back-img{
background: url("https://keepersecurity.com/console/resources/css/img/undraw_programming_2svr@2x.png");
width: 75%;
height: 80vh;
background-repeat: no repeat;
background-size: cover;
}
</style>
</head>
<style>
.button-2 {
    display: block;
    width: 200px;
    height: 65px;
    background: #4E9CAF;
    padding: 10px;
    text-align: center;
    border-radius: 5px;
    color: white;
    font-weight: bold;
    line-height: 25px;
    margin-left: -10%;
}
</style>

<body>
<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="navbar.jsp" %>

<div class="container-fluid back-img">
<div class="text-center">
<h1 > Welcome Admin
</h1>

</div>

<div style="margin-bottom=10%;">
<a href="post_spot.jsp" style="font-size: 20px" class ="button-2"><i class="fas fa-plus-circle" style="padding: 5px; font: serif;" ></i>Post Parking Spots</a>
<a href="view_spot.jsp" style="font-size: 20px; margin-top: 20px;" class ="button-2"><i class="fas fa-eye" style="padding: 5px; font: serif;"></i>View Parking Spots</a>
<a href="post_worker.jsp" style="font-size: 20px;margin-top: 20px;" class ="button-2"><i class="fas fa-plus-circle" style="padding: 5px; font: serif;" ></i>Post Workers</a>
<a href="view_worker.jsp" style="font-size: 20px;margin-top: 20px;" class ="button-2"><i class="fas fa-eye" style="padding: 10px; font: serif;"></i>View Workers</a>
</div>
</div>

</body>
</html>