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
<title>User: View Spot</title>
<%@include file="all_css.jsp" %>
</head>
<style>
.back-i{
background-image: url("https://i.pinimg.com/736x/1a/ad/63/1aad6350475e4020e1a091aacb18f727.jpg");
background-position: center;
}
</style>
<body style="background-color: #f0f1f2;" class="back-i">

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>
</c:if>

<%@include file="navbar.jsp" %>

<div class="container">
<div class="row">
<div class="col-md-12">

<%
String id=request.getParameter("id");
SpotDao dao=new SpotDao(DBConnect.getConn());
spots s=dao.getSpotById(id);
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
<input id="id" type="text" class="form-control form-control-sm" value="Space: <%=s.getParkingSpace() %>" readonly>
</div>
</div>

<div class="form-row">
		<div class="form-group col-md-3">
		<input type="text" class="form-control form-control-sm" value="pph: <%=s.getpph() %>" readonly>
		</div>
		</div>
		
<h6>Publish Date: <%=s.getPdate().toString() %></h6>

</div>
</div>

</div>
</div>
</div>

</body>
</html>