<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Worker</title>

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

<h5>Add Worker</h5>
</div>

<form action="postWorkerServlet" method="post">

<div class="form-group">
<label>Entry Number</label> <input type="number" style="border: 1.5px solid #000000; border-radius: 5px;" id="entrynum" name="entrynum" required class="form-control">
</div>

<div class="form-group">
<label>Enter Name</label> <input type="text" style="border: 1.5px solid #000000; border-radius: 5px;" id="name" name="name" required class="form-control">
</div>

<div class="form-group">
<label for="Specializedin">Specialized in:</label>
  <select id="spec" name="spec">
    <option value="Dry Cleaning">Dry Cleaning</option>
    <option value="Car Washing">Car Washing</option>
    <option value="Air filling">Air Filling</option>
    <option value="Tyre Health Check">Tyre Health Check</option>
  </select>
</div>

<div class="form-group">
<label>Enter Description</label> <textarea style=" border: 1.5px solid #000000; border-radius: 5px;"  required rows="6" cols="" id="desc" name="desc" class="form-control"></textarea>
</div>

<div class="form-group">
<label>Rating</label> <input type="number" min="1" max="5" style=" border: 1.5px solid #000000; border-radius: 5px;" id="rating" name="rating" required class="form-control">
</div>

<button class="btn btn-success" onclick="showAlert()">>Add worker</button>
</form>

<script>
  function showAlert() {
    var myText = "Worker added Successfully!";
    alert (myText);
  }
  </script>
</div>
</div>
</div>
</div>

</body>
</html>