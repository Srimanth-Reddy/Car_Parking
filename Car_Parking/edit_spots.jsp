<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%@ page import="db.DBConnect" %>
<%@ page import="dao.SpotDao" %>
<%@ page import="entity.spots" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit Spots</title>

<%@include file="all_css.jsp"%>
</head>
<style>
.back-i{
background-image: url("https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/rm283-nunny-054-f.jpg?w=1200&h=1200&dpr=1&fit=clip&crop=default&fm=jpg&q=75&vib=3&con=3&usm=15&cs=srgb&bg=F4F4F3&ixlib=js-2.2.1&s=0c7bf97677e6c1253557f958e9b9ac98");
background-position: center;
  background-repeat: no-repeat;
  background-size: cover;


}
</style>
<body style="background-color: #f0f1f2;" class="back-i">

<c:if test="${userobj.role ne 'admin' }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="navbar.jsp"%>

<div class="continer p-2">
<div class="col-md-10 offset-md-1">
<div class="card">
<div class="card-body">
<div class="text-center text-success">
<i class="fas fa-edit fa-3x"></i>

<%
String id=request.getParameter("id");
SpotDao dao=new SpotDao(DBConnect.getConn());
spots s=dao.getSpotById(id);
%>

<h5>Edit Parking Spot</h5>
</div>

<form action="updateSpotServlet" method="post">

<input type="hidden" value="<%=s.getId() %>" name="id">

<div class="form-group" >
<label>Enter Spot</label> <input type="text" id="spot" name="spot" required class="form-control" value="<%=s.getSpot() %>">
</div>

<div class="form-group" data-onsuccess="show">
<label>Total Parking Space</label> <input type="number" id="space" name="space" required class="form-control" value="<%=s.getParkingSpace() %>" >
</div>

<div class="form-group">
<label>Enter Description</label> <textarea required rows="6" cols="" id="desc" name="desc" class="form-control" ><%=s.getDescription() %></textarea>
</div>

<div class="form-group" data-onsuccess="show">
<label>Total Price perHour</label> <input type="number" id="pph" name="pph" required class="form-control" value="<%=s.getpph() %>" >
</div>

<button class="btn btn-success" onclick="showAlert()">>Update Spot</button>

<script>
  function showAlert() {
    var myText = "Spot Updated Successfully!";
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