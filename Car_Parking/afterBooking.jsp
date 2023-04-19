<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
        
<%@ page import="db.DBConnect" %>
<%@ page import="dao.SpotDao" %>
<%@ page import="java.util.List" %>
<%@ page import="entity.spots" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Bill Generation</title>
<%@include file="all_css.jsp" %>
</head>

<style>
.img{
background-image: url("https://i.pinimg.com/736x/1a/ad/63/1aad6350475e4020e1a091aacb18f727.jpg");
background-position: center;
}
.boxx{
background : #ffffff;
border: 1px solid black;
height : 25px;
}
</style>

<body style="background-color:#f0f1f2; " class="img">

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>
</c:if>

<%@include file="navbar.jsp" %>
<div class="boxx">
<h5><i class="fas fa-check-circle" ></i>Booked</h5> </div>

<div class="container">
<div class="row">
<div class="col-md-12">

<%
SpotDao dao=new SpotDao(DBConnect.getConn());
spots s=dao.getSpotBooked();
%>

<div class="card mt-5">
<div class="card-body">
<div class="text-center text-primary">
<i class="fas fa-parking fa-2x"></i>

</div>

<h6><%=s.getSpot() %></h6>
<p><%=s.getDescription() %>.</p>
<br>

<div class="form-row">
		<div class="form-group col-md-3">
		<input type="text" class="form-control form-control-sm" value="pph: <%=s.getpph() %>" readonly>
		</div>
		</div>

<h6>Booked Date: <%=s.getPdate().toString() %></h6>

</div>
</div>
<div class="card mt-5">
<p style="font-size: 20px; margin-left: 3.5%; font-weight: 500;">Other services:</p>
<p style=" margin-left: 3.5%; font-weight: 500;">Please! Note that the cost for the other services will be calculated at the check-out time</p>

<form action="billServlet" method="post">
<input type="hidden"name="pph" value="pph: <%=s.getpph() %>">

  <label for="otherServices" style="font-size: 20px; margin-left: 3.5%;">Other Services(if needed)</label>
  <select id="otherServices" name="otherServices">
    <option value="Dry Cleaning" style="margin-left: 5.5%;">Dry Cleaning</option>
    <option value="Car Washing" style="margin-left: 5.5%;">Car Washing</option>
    <option value="Air filling">Air Filling</option>
    <option value="Tyre Health Check">Tyre Health Check</option>
  </select>
  

<div class="form-row">
<div class="form-group col-md-3">Check-In Time:
<input name="checkintime" type="time" class="form-control form-control-sm" value="time: " required>
</div>
</div>

<div class="form-row">
<div class="form-group col-md-3">Check-Out Time:
<input name="checkouttime" type="time" class="form-control form-control-sm" value="time:" required>
</div>
</div>

<div class="form-row">
<div class="form-group col-md-3">Arrival Date:
<input name="arrivaldate" type="date" class="form-control form-control-sm" value="date:" required>
</div>
</div>
<input type="submit" onclick="showAlert()" class="btn btn-sm bg-success text-white" style="width: 70px;font-size: 15px; margin-left: 20%;">

<script>
  function showAlert() {
    var myText = "Bill Generated Successfully!";
    alert (myText);
  }
  </script>
</form>
</div>

</div>
</div>
</div>


</body>
</html>