<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%@ page import="db.DBConnect" %>
<%@ page import="dao.WorkerDao" %>
<%@ page import="entity.worker" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit Workers</title>

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
WorkerDao dao=new WorkerDao(DBConnect.getConn());
worker w=dao.getWorkerById(id);
%>

<h5>Edit Worker Info</h5>
</div>

<form action="updateWorkerServlet" method="post">

<input type="hidden" value="<%=w.getId() %>" name="id">

<div class="form-group" >
<label>Enter Name</label> <input type="text" id="name" name="name" required class="form-control" value="<%=w.getName() %>">
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
<label>Enter Description</label> <textarea required rows="6" cols="" id="desc" name="desc" class="form-control" ><%=w.getDescription() %></textarea>
</div>

<div class="form-group" data-onsuccess="show">
<label>Rating</label> <input type="number" id="rating" name="rating" required class="form-control" value="<%=w.getRating() %>" >
</div>

<button class="btn btn-success" onclick="showAlert()">>Update Worker</button>

<script>
  function showAlert() {
    var myText = "Worker Info Updated Successfully!";
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