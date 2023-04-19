<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Spots</title>

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
<i class="fas fa-parking fa-3x"></i>

<h5>Add Parking Spots</h5>
</div>

<form action="postSpotServlet" method="post">

<div class="form-group">
<label>Entry Number</label> <input type="number" style="border: 1.5px solid #000000; border-radius: 5px;" id="entrynum" name="entrynum" required class="form-control">
</div>

<div class="form-group">
<label>Enter Spot</label> <input type="text" style="border: 1.5px solid #000000; border-radius: 5px;" id="spot" name="spot" required class="form-control">
</div>

<div class="form-group">
<label>Total Parking Space</label> <input type="number" style=" border: 1.5px solid #000000; border-radius: 5px;" id="space" name="space" required class="form-control">
</div>

<div class="form-group">
<label>Enter Description</label> <textarea style=" border: 1.5px solid #000000; border-radius: 5px;"  required rows="6" cols="" id="desc" name="desc" class="form-control"></textarea>
</div>

<div class="form-group">
<label>Price perHour</label> <input type="number" style=" border: 1.5px solid #000000; border-radius: 5px;" id="pph" name="pph" required class="form-control">
</div>

<button class="btn btn-success" onclick="showAlert()">>Add Spot</button>
</form>

<script>
  function showAlert() {
    var myText = "Spot added Successfully!";
    alert (myText);
  }
  </script>
</div>
</div>
</div>
</div>

</body>
</html>