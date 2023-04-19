<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Worker</title>
<%@include file="all_css.jsp"%>

<style type="text/css">
.back-img{
background: url("https://cdn4.vectorstock.com/i/1000x1000/18/23/worker-on-car-factory-vector-22791823.jpg");
width: 85%;
height: 95vh;
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
    padding: 5px;
    text-align: center;
    border-radius: 5px;
    color: white;
    font-weight: bold;
    line-height: 25px;
    margin-left: 10%;
}
</style>

<body>

<%@include file="navbar.jsp" %>

<div class="container-fluid back-img">
<div class="text-center">
<h1 > Welcome Worker
</h1>

</div>

<div style="margin-bottom=10%;">
<a href="#" style="font-size: 20px" class ="button-2">Car Washing</a>
<a href="#" style="font-size: 20px; margin-top: 20px;" class ="button-2">Dry Cleaning</a>
<a href="#" style="font-size: 20px;margin-top: 20px;" class ="button-2">Air-Filling</a>
<a href="#" style="font-size: 20px;margin-top: 20px;" class ="button-2">Tyre Health Centre</a>
</div>
</div>

</body>
</html>