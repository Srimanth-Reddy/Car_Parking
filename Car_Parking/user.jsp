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
<title>User: Home</title>
<%@include file="all_css.jsp" %>
</head>
<style>
.img{
background-image: url("https://i.pinimg.com/736x/1a/ad/63/1aad6350475e4020e1a091aacb18f727.jpg");
background-position: center;

}
.button-2{
 background: #fcb603;

    color: white;
    
}

</style>


<body style="background-color:#f0f1f2; " class="img">

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>
</c:if>
<div class="card" style="color: #000000;">
<%
String status =(String)request.getAttribute("status");
if(status != null){
	out.println(status);
}
%>
</div>
<%@include file="navbar.jsp" %>

<div class="container">
<div class="row">
<div class="col-md-12">


<div class="card">
<div>
<h3 style= "color: #000000; margin-left: 40%; font-size: 45px; font-family: Times New Roman;">All Spots</h3>
</div>
<div class="card-body">
<form class="form-inline" action="MoreView.jsp" method="get">
<div class="form-group col-md-5 mt-1">

<h5>Search for Location: </h5>
</div>

<div class="form-group col-md-5">
<input type="text" id="loc" name="loc" required class="form-control" style="border:2px solid #050505;">
</div>

<button class="btn btn-success" >Submit</button>
</form>
</div>
</div>

<%
SpotDao dao=new SpotDao(DBConnect.getConn());
List<spots> list=dao.getAllSpots();
for(spots s:list){
%>

<div class="card mt-2">
<div class="card-body">
<div class="text-center text-primary">
<i class="fas fa-parking fa-2x"></i>
</div>

<h5><%=s.getSpot() %></h5>

<%
if(s.getDescription().length()>0 && s.getDescription().length()<120){
%>
<p><%=s.getDescription() %>.</p>
<%
}else{
%>
<p><%=s.getDescription().substring(0,120) %>...</p>
<%
}
%>

<br>
<div class="form-row">
<div class="form-group col-md-3">
<input type="text" class="form-control form-control-sm" id="id" value="Space: <%=s.getParkingSpace()%>" readonly>
</div>

</div>

<br>
<div class="form-row">
<div class="form-group col-md-3">
<input type="text" class="form-control form-control-sm" id="pph" value="pph: <%=s.getpph()%>" readonly>
</div>

</div>

<h6>Publish Date: <%=s.getPdate().toString() %></h6>
<form action="bookedServlet" method="post">
<input type="hidden" value="${userobj.mobnum}" name="mobnum">
<input type="hidden" value="${userobj.freq}" name="freq">
<input type="hidden" value="<%=s.getId() %>" name="entrynum">
<input type="hidden" value="<%=s.getSpot() %>" name="spot">
<input type="hidden" value="<%=s.getParkingSpace()%>" name="space">
<input type="hidden" value="<%=s.getDescription() %>" name="desc">
<input type="hidden" value="<%=s.getpph()%>" name="pph">
<div class="text-center">
<a href="oneView.jsp?id=<%=s.getId() %>" class="btn btn-sm bg-success text-white">View More</a>
<button class="btn btn-sm button-2" onclick="showAlert()">Book Now</button>

<script>
  function showAlert() {
    var myText = "Spot Booked Successfully!";
    alert (myText);
  }
  </script>
</div>
</form>
</div>
</div>

<%
}
%>

</div>
</div>
</div>

</body>
</html>