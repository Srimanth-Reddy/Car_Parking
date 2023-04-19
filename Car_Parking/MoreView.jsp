<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="db.DBConnect" %>
<%@ page import="dao.SpotDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.spots" %>
<%@ page import="java.util.Random" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: View Spot</title>
<%@include file="all_css.jsp" %>
<style>
.back-i{
background-image: url("https://i.pinimg.com/736x/1a/ad/63/1aad6350475e4020e1a091aacb18f727.jpg");
background-position: center;
}
.boxx{

background : #ffffff;
border: 1px solid black;
height : 25px;
}

.button-2{
 background: #fcb603;

    color: white;
    
}
</style>

</head>


<body style="background-color:#f0f1f2;" class="back-i">

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"/>
</c:if>
<%@include file="navbar.jsp" %>

<div class="container">
<div class="row">
<div class="col-md-12">

<%
String loc=request.getParameter("loc");
String msg="";

Random random=new Random();

SpotDao dao=new SpotDao(DBConnect.getConn());
List <spots> list=null;

if(loc.equals(null)){
	list=new ArrayList<spots>();
	msg="Spots Not Available!";
}
else{
	list=dao.getSpotByLoc(loc);
}

if(list.isEmpty()){
%>
<div class="card mt-5">
<div class="card-body">
<div class="text-center text-primary">
<h4 class="text-center text-danger" style="font-weight: 500;">Spots Not Available</h4>


	<h4>You are placed on a waiting list for this location! Come back and check later</h4>
	<h6>Your waiting list number is:	</h6>
	<input type="number" class="form-control form-control-sm" style="width: 10%;margin-left: 42%;" value="<%=random.nextInt(10)+1 %>" readonly>

<%
}
if(list!=null){
	for(spots s: list){
%>
		
		<div class="card mt-2">
		<div class="card-body">
		<div class="text-center text-primary">
		<i class="fas fa-parking fa-2x"></i>
		</div>
		
		<h6><%=s.getSpot() %></h6>
		<p><%=s.getDescription() %></p>
		<br>
		
		<div class="form-row">
		<div class="form-group col-md-3">
		<input type="text" class="form-control form-control-sm" value="space: <%=s.getParkingSpace() %>" readonly>
		</div>
		</div>
		
		<div class="form-row">
		<div class="form-group col-md-3">
		<input type="text" class="form-control form-control-sm" value="pph: <%=s.getpph() %>" readonly>
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
}else{
	%>
	<h4 class="text-center text-danger"><%=msg%></h4>
	<%
}

%>

</div>
</div>
</div>
</div>
</div>
</div>

</body>
</html>